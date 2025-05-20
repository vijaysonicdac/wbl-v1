// ignore_for_file: must_be_immutable

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../Pages/Welcome Page/welcome_page.dart';
import '../../Reusable Functions/reusable_function.dart';

class NewLoginpageFormat extends StatefulWidget {
  NewLoginpageFormat(
      {super.key,
      required this.menuItems,
      required this.user,
      this.bodyWidget,
      this.selectedButtonName});

  final List<Map<String, dynamic>> menuItems;
  final Map<String, dynamic>? user;
  Widget? bodyWidget;
  String? selectedButtonName;

  static int? selectedMenuItem;
  static int? selectedsubMenuItem;

  @override
  State<NewLoginpageFormat> createState() => _NewLoginpageFormatState();
}

class _NewLoginpageFormatState extends State<NewLoginpageFormat> {
  List menuItems = [];
  List subMenuItems = [];
  bool isDrawerOpen = true;
  int smallScreenWidthSize = 600;
  void getSubMenuItems() {
    if (widget.bodyWidget == null) {
      NewLoginpageFormat.selectedsubMenuItem = 0;
    }

    Map subtitles = widget.menuItems[NewLoginpageFormat.selectedMenuItem ??= 0]
            ['subtitle'] ??
        {};
    if (subtitles.isNotEmpty) {
      subMenuItems = subtitles.keys.toList();
    } else {
      subMenuItems = [];
    }
  }

  @override
  void initState() {
    NewLoginpageFormat.selectedMenuItem ??= 0;
    menuItems = widget.menuItems.map((menuItem) {
      return menuItem['title'].keys.first;
    }).toList();
    getSubMenuItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            screenWidth >= smallScreenWidthSize
                ? myDrawerButton()
                : myImage("assets/images/wblLogo.png"),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  myImage("assets/images/miety.png"),
                  myImage('assets/images/G20Logo.png'),
                  myImage("assets/images/cdacLogo.png"),
                ],
              ),
            ),
            mySettingButton()
          ],
        ),
      ),
      bottomNavigationBar: screenWidth <= smallScreenWidthSize
          ? BottomNavigationBar(
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              currentIndex: NewLoginpageFormat.selectedMenuItem ??= 0,
              onTap: (value) {
                setState(() {
                  if (menuItems[value] == 'Logout') {
                    MyFun.navigatToPagewithoutBack(context, WelcomePage());
                  }
                  NewLoginpageFormat.selectedMenuItem = value;
                  getSubMenuItems();
                });
              },
              items: widget.menuItems.map((icon) {
                int index = widget.menuItems.indexOf(icon);
                return BottomNavigationBarItem(
                  icon: Icon(widget.menuItems[index]['icon']),
                  label: widget.menuItems[index]['title'].keys.first,
                );
              }).toList(),
            )
          : null,
      body: Row(
        children: [
          if (screenWidth >= smallScreenWidthSize) myDrawer(),
          Expanded(
            child: Column(
              children: [
                screenWidth <= smallScreenWidthSize
                    ? mySubMenu()
                    : rowTOColumn([
                        Text(
                          getFormattedMenuPath(),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              '${widget.user?['center'] ?? ""} (${widget.user?['center type'] ?? ""})',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ]),
                Expanded(
                  child: getbodyWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget rowTOColumn(List<Widget> children) {
    return MediaQuery.of(context).size.width <= 600
        ? Wrap(children: children)
        : Row(children: children);
  }

  String getFormattedMenuPath() {
    String menu = (NewLoginpageFormat.selectedMenuItem != null)
        ? widget
            .menuItems[NewLoginpageFormat.selectedMenuItem!]['title'].keys.first
        : "";

    String submenu = (NewLoginpageFormat.selectedsubMenuItem != null &&
            subMenuItems.isNotEmpty &&
            NewLoginpageFormat.selectedsubMenuItem! < subMenuItems.length)
        ? " > ${subMenuItems[NewLoginpageFormat.selectedsubMenuItem!]}"
        : "";

    String button = (widget.selectedButtonName?.isNotEmpty ?? false)
        ? " > ${widget.selectedButtonName}"
        : "";

    return "$menu$submenu$button";
  }

  Widget myDrawerButton() {
    return Row(
      children: [
        SizedBox(
          width: isDrawerOpen ? 204 : 54,
          child: Row(
            mainAxisAlignment: isDrawerOpen
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              myImage("assets/images/wblLogo.png"),
              if (isDrawerOpen)
                Text(
                  'WBL',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
        myVerticalDivider(),
        IconButton(
          icon: const Icon(
            Icons.menu,
            size: 30,
          ),
          onPressed: () {
            setState(() {
              isDrawerOpen = !isDrawerOpen;
            });
          },
        ),
      ],
    );
  }

  Widget myVerticalDivider() {
    return Container(
      color: Colors.black,
      width: .5,
      height: 45,
    );
  }

  Widget myExpended() {
    return const Expanded(
      child: SizedBox(
        width: 1,
      ),
    );
  }

  Widget myImage(String assetLocation) {
    return Image(
      image: AssetImage(assetLocation),
      height: 40,
    );
  }

  Widget mySettingButton() {
    return IconButton(
      icon: const Icon(
        Icons.settings,
        size: 25,
      ),
      onPressed: () {
        showMenu(
          context: context,
          position: const RelativeRect.fromLTRB(100, 40, 10, 100),
          items: [
            PopupMenuItem(
              child: const Text('Profile'),
              onTap: () {
                widget.bodyWidget = widget.user!['profile'];
                MyFun.navigatToPagewithoutBack(
                    context, widget.user!['profile']);
              },
            ),
            PopupMenuItem(
              child: const Text('Logout'),
              onTap: () {
                NewLoginpageFormat.selectedMenuItem = null;
                NewLoginpageFormat.selectedsubMenuItem = null;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WelcomePage(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget mySubMenu() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < subMenuItems.length; i++)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    NewLoginpageFormat.selectedsubMenuItem = i;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: NewLoginpageFormat.selectedsubMenuItem == i
                      ? Colors.grey // Selected button background
                      : Colors.transparent, // Default background
                  shape: RoundedRectangleBorder(
                    borderRadius: NewLoginpageFormat.selectedsubMenuItem == i
                        ? BorderRadius.circular(10) // Rounded selected
                        : BorderRadius.zero, // Square not selected
                  ),
                  elevation:
                      NewLoginpageFormat.selectedsubMenuItem == i ? 2 : 0,
                ),
                child: Text(
                  subMenuItems[i],
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: NewLoginpageFormat.selectedsubMenuItem == i
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget getbodyWidget() {
    final bodyWidgets = widget.bodyWidget;
    widget.bodyWidget = null;

    Map<String, dynamic> titleSubtileValue =
        widget.menuItems[NewLoginpageFormat.selectedMenuItem ?? 0]['title'];
    if (kDebugMode) {
      print('v $titleSubtileValue');
    }
    if (titleSubtileValue[
            menuItems[NewLoginpageFormat.selectedMenuItem ?? 0]] ==
        null) {
      titleSubtileValue = widget
          .menuItems[NewLoginpageFormat.selectedMenuItem ?? 0]['subtitle'];
      if (kDebugMode) {
        print('v $titleSubtileValue');
      }
    } 
    return bodyWidgets ??
        widget.menuItems[NewLoginpageFormat.selectedMenuItem ?? 0]['title']
            [menuItems[NewLoginpageFormat.selectedMenuItem ?? 0]] ??
        widget.menuItems[NewLoginpageFormat.selectedMenuItem ?? 0]['subtitle']
            [subMenuItems[NewLoginpageFormat.selectedsubMenuItem ?? 0]];
  }

  Widget myDrawer() {
    return SizedBox(
      width: isDrawerOpen ? 220 : 70,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            if (isDrawerOpen)
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myUserImage(),
                    ],
                  ),
                  Text(
                    '${widget.user!['firstName']} ${widget.user!['lastName']} ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text('(${widget.user!['roll']})'),
                  Text(widget.user!['center']),
                  SizedBox(
                    height: 8,
                    width: 200,
                  )
                ],
              ),
            const Divider(
              height: 1.5,
            ),
            SizedBox(
              height: 8,
            ),
            for (int j = 0; j <= menuItems.length - 1; j++)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor:
                            NewLoginpageFormat.selectedMenuItem == j
                                ? Colors.grey[200]
                                : Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                      ),
                      onPressed: () {
                        setState(() {
                          if (menuItems[j] == 'Logout') {
                            MyFun.navigatToPagewithoutBack(
                                context, WelcomePage());
                          }
                          NewLoginpageFormat.selectedMenuItem = j;
                          getSubMenuItems();
                        });
                      },
                      child: Row(
                        children: [
                          Icon(
                            widget.menuItems[j]['icon'],
                            size: 28,
                            color: NewLoginpageFormat.selectedMenuItem == j
                                ? Colors.black
                                : Colors.grey,
                          ),
                          if (isDrawerOpen)
                            myMenuTitle(menuItems[j],
                                NewLoginpageFormat.selectedMenuItem == j),
                          if (isDrawerOpen) myExpended(),
                          if (isDrawerOpen)
                            if (widget.menuItems[j]['subtitle'] != null)
                              Icon(
                                NewLoginpageFormat.selectedMenuItem == j
                                    ? Icons.remove
                                    : Icons.add,
                                color: NewLoginpageFormat.selectedMenuItem == j
                                    ? Colors.black
                                    : Colors.grey,
                              )
                        ],
                      ),
                    ),
                  ),
                  if (j == NewLoginpageFormat.selectedMenuItem && isDrawerOpen)
                    for (int k = 0; k <= subMenuItems.length - 1; k++)
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor:
                              NewLoginpageFormat.selectedsubMenuItem == k
                                  ? Colors.grey[300]
                                  : Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            NewLoginpageFormat.selectedsubMenuItem = k;
                          });
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: NewLoginpageFormat.selectedsubMenuItem == k
                                  ? 18
                                  : 30,
                            ),
                            if (NewLoginpageFormat.selectedsubMenuItem == k)
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                                color:
                                    NewLoginpageFormat.selectedsubMenuItem == k
                                        ? Colors.black // Selected color
                                        : Colors.grey, // Default color
                              ),
                            myMenuTitle(subMenuItems[k],
                                NewLoginpageFormat.selectedsubMenuItem == k),
                          ],
                        ),
                      ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget myUserImage() {
    String initials = '';
    if (widget.user!['firstName'] != null && widget.user!['lastName'] != null) {
      initials = widget.user!['firstName']![0] + widget.user!['lastName']![0];
    } else if (widget.user!['firstName'] != null) {
      initials = widget.user!['firstName']![0];
    }
    return CircleAvatar(
      radius: 50,
      backgroundImage: widget.user!['profileImage'] != null
          ? NetworkImage(widget.user!['profileImage']!)
          : null,
      child: widget.user!['profileImage'] == null
          ? Text(
              initials,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          : null,
    );
  }

  Widget myMenuTitle(String title, bool isSelectedCondition) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Text(
        title,
        overflow: TextOverflow.fade,
        style: TextStyle(
          fontWeight: isSelectedCondition ? FontWeight.bold : FontWeight.normal,
          color: isSelectedCondition ? Colors.black : Colors.black87,
          fontSize: isSelectedCondition ? 14 : 13,
        ),
      ),
    );
  }
}
