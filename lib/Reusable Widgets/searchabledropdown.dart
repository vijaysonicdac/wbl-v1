import 'package:flutter/material.dart';

class MyEnrollmentSearchdropdown extends StatefulWidget {
  final List<String> dropdownItems;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final AutovalidateMode? autovalidateMode;

  const MyEnrollmentSearchdropdown({
    super.key,
    required this.dropdownItems,
    required this.hintText,
    required this.controller,
    required this.validator,
    required this.autovalidateMode,
  });

  @override
  State<MyEnrollmentSearchdropdown> createState() =>
      _SearcMyEnrollmentSearchdropdown();
}

class _SearcMyEnrollmentSearchdropdown
    extends State<MyEnrollmentSearchdropdown> {
  final _link = LayerLink();
  final _overlayController = OverlayPortalController();
  final GlobalKey _textFieldKey = GlobalKey();
  String? selectedItem;
  String tempInput = '';
  bool showError = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CompositedTransformTarget(
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
    return SizedBox(
      key: _textFieldKey,
      child: TextFormField(
        validator: widget.validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            fontSize: 18.0,
            color: Color.fromARGB(255, 57, 57, 57),
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          suffixIcon: const Icon(Icons.arrow_drop_down),
        ),
        controller: widget.controller,
        onTap: () {
          _overlayController.show();
        },
        onChanged: (value) {
          setState(() {
            tempInput = value;
            showError = widget.validator(widget.controller.text) != null;
          });
          _overlayController.show(); // Ensure dropdown shows when typing
        },
        onFieldSubmitted: (value) {
          if (widget.dropdownItems
              .any((item) => item.toLowerCase() == value.toLowerCase())) {
            setState(() {
              selectedItem = value;
              widget.controller.text = value;
              showError = false; // No error after a valid selection
            });
          } else {
            setState(() {
              showError = true; // Show error if item is not valid
            });
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Select an item from the list')),
            );
          }
        },
      ),
    );
  }

  Widget dropdown() {
    final RenderBox renderBox =
        _textFieldKey.currentContext?.findRenderObject() as RenderBox;
    final width = renderBox.size.width;

    // Filter items based on the text input
    final filteredItems = widget.dropdownItems
        .where((item) => item.toLowerCase().contains(tempInput.toLowerCase()))
        .toList();

    final double dropdownHeight =
        (filteredItems.length * 48.0).clamp(0.0, 200.0);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: Colors.white,
      ),
      width: width,
      height: dropdownHeight,
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
                      selectedItem = filteredItems[i];
                      widget.controller.text = filteredItems[i];
                      showError = false;
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
  HoverableListTileState createState() => HoverableListTileState();
}

class HoverableListTileState extends State<HoverableListTile> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
      },
      child: Container(
        color: isHovered ? Colors.blue : Colors.white,
        child: ListTile(
          title: Text(
            widget.title,
            style: TextStyle(
              color: isHovered ? Colors.white : Colors.black,
            ),
          ),
          onTap: widget.onTap,
        ),
      ),
    );
  }
}
