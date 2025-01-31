import 'package:flutter/material.dart';

class SearchableDropdown extends StatefulWidget {
  const SearchableDropdown({super.key});

  @override
  State<SearchableDropdown> createState() => _SearchableDropdownState();
}

class _SearchableDropdownState extends State<SearchableDropdown> {
  List<String> dropdownItems = [
    'Dimple',
    'sahil',
    'mamta',
    'manpreet',
    'd',
    'k',
  ];
  final controllerSearch = TextEditingController();
  final _link = LayerLink();
  final _overlayController = OverlayPortalController();
  List<bool> isHovered = List.generate(10, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CompositedTransformTarget(
            link: _link,
            child: SizedBox(
              child: OverlayPortal(
                controller: _overlayController,
                overlayChildBuilder: (BuildContext context) {
                  return CompositedTransformFollower(
                    link: _link,
                    targetAnchor: Alignment.bottomLeft,
                    child: dropdown(),
                  );
                },
                child: textField(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget textField() {
  return Container(
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controllerSearch,
        onTap: () {
          _overlayController.show();
        },
        onChanged: (value) {
          _overlayController.show();
        },
        decoration: const InputDecoration(
          hintText: 'Select an item',
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
        ),
      ),
    );
  }

  Widget dropdown() {
    return SizedBox(
      height: 200,
      child: TextFieldTapRegion(
        onTapOutside: (p) {
          _overlayController.hide();
        },
        child: Material(
          elevation: 4,
          child: Container(
            width: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int i = 0; i < dropdownItems.length; i++)
                      if (dropdownItems[i]
                          .toLowerCase()
                          .contains(controllerSearch.text.toLowerCase()))
                        MouseRegion(
                          onEnter: (_) => setState(() {
                            isHovered[i] = true;
                          }),
                          onExit: (_) => setState(() {
                            isHovered[i] = false;
                          }),
                          child: SizedBox(
                            width: 200,
                            child: ListTile(
                              title: Text(dropdownItems[i]),
                              tileColor:
                                  isHovered[i] ? const Color(0xff5897fb) : null,
                              onTap: () {
                                _overlayController.hide();
                                setState(() {
                                  controllerSearch.text = dropdownItems[i];
                                });
                              },
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
