import 'package:flutter/material.dart';

class MyWelcomeSearchableDropdown extends StatefulWidget {
  final List<String> dropdownItems;
  final String hintText;
  final TextEditingController controller; // Ensure it's a TextEditingController
  final String? Function(String?) validator;
  final AutovalidateMode? autovalidateMode;

  const MyWelcomeSearchableDropdown({
    super.key,
    required this.dropdownItems,
    required this.hintText,
    required this.controller,
    required this.validator,
    required this.autovalidateMode,
  });

  @override
  State<MyWelcomeSearchableDropdown> createState() => _MyWelcomeSearchableDropdownState();
}

class _MyWelcomeSearchableDropdownState extends State<MyWelcomeSearchableDropdown> {
  final _link = LayerLink();
  final _overlayController = OverlayPortalController();
  final GlobalKey _textFieldKey = GlobalKey(); // Key for TextFormField

  String? selectedItem; // Variable to store selected item
  String tempInput = ''; // Temporary input variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CompositedTransformTarget(
        link: _link,
        child: SizedBox(
          child: OverlayPortal(
            controller: _overlayController,
            overlayChildBuilder: (BuildContext context) {
              return CompositedTransformFollower(
                link: _link,
                targetAnchor: Alignment.bottomLeft,
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: dropdown(),
                ),
              );
            },
            child: textField(),
          ),
        ),
      ),
    );
  }

  Widget textField() {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromARGB(255, 126, 124, 128)),
      borderRadius: const BorderRadius.all(Radius.circular(4)),
    ),
    child: SizedBox(
      key: _textFieldKey,
      child: Stack(
        children: [
          const ListTile(
            trailing: Icon(Icons.arrow_drop_down),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextFormField(
              validator: widget.validator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                hintText: widget.hintText,
                border: InputBorder.none,
              ),
              controller: widget.controller,
              onTap: () {
                _overlayController.show();
              },
              onChanged: (value) {
                // Update tempInput with the user's input for filtering
                setState(() {
                  tempInput = value; // Update tempInput
                });
                _overlayController.show(); // Show the dropdown
              },
              onFieldSubmitted: (value) {
                // Validate if the value is part of the dropdown list
                if (widget.dropdownItems.any(
                    (item) => item.toLowerCase() == value.toLowerCase())) {
                  setState(() {
                    selectedItem = value; // Update selected item
                    widget.controller.text = value; // Update controller only if valid
                  });
                } else {
                  // Don't update the controller, just show the error message
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Select an item from the list')),
                  );
                }
              },
            ),
          ),
        ],
      ),
    ),
  );
}


  Widget dropdown() {
    // Get the size of the TextFormField
    final RenderBox renderBox =
        _textFieldKey.currentContext?.findRenderObject() as RenderBox;
    final width = renderBox.size.width; // Get the width of the TextFormField

    // Filter dropdown items based on search
    final filteredItems = widget.dropdownItems
        .where((item) =>
            item.toLowerCase().contains(tempInput.toLowerCase())) // Use tempInput instead of controller.text
        .toList();

    // Calculate the height dynamically, with a maximum height of 200
    final double dropdownHeight = (filteredItems.length * 48.0).clamp(0.0, 200.0);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: Colors.white,
      ),
      width: width, // Set the dropdown width equal to TextFormField width
      height: dropdownHeight, // Set the dynamic height
      child: TextFieldTapRegion(
        onTapOutside: (p) {
          _overlayController.hide();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 0; i < filteredItems.length; i++)
                HoverableListTile(
                  title: filteredItems[i],
                  onTap: () {
                    _overlayController.hide();
                    setState(() {
                      selectedItem = filteredItems[i]; // Store selected item
                      widget.controller.text =
                          filteredItems[i]; // Display selected item in text field
                    });
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class HoverableListTile extends StatefulWidget {
  final String title;
  final Function() onTap;

  const HoverableListTile({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  // ignore: library_private_types_in_public_api
  _HoverableListTileState createState() => _HoverableListTileState();
}

class _HoverableListTileState extends State<HoverableListTile> {
  bool isHovered = false; // Track hover state

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovered = true; // Mouse entered, show hover effect
        });
      },
      onExit: (event) {
        setState(() {
          isHovered = false; // Mouse exited, remove hover effect
        });
      },
      child: Container(
        color: isHovered ? Colors.blue : Colors.white, // Change color on hover
        child: ListTile(
          title: Text(
            widget.title,
            style: TextStyle(
              color: isHovered ? Colors.white : Colors.black, // Change text color on hover
            ),
          ),
          onTap: widget.onTap, // Trigger action on tap
        ),
      ),
    );
  }
}
