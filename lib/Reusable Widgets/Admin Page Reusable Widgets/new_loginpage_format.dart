import 'package:flutter/material.dart';

import '../../Pages/Welcome Page/welcome_page.dart';
import '../../Reusable Functions/reusable_function.dart';

class NewLoginpageFormat extends StatefulWidget {
  const NewLoginpageFormat(
      {super.key, required this.menuItems, required this.user});

  final List<Map<String, dynamic>> menuItems;
  final Map<String, dynamic>? user;
  static Widget? bodyWidget;
  static int? currentMenuIndex;
  static int? currentSubmenuIndex;

  @override
  State<NewLoginpageFormat> createState() => _NewLoginpageFormatState();
}

class _NewLoginpageFormatState extends State<NewLoginpageFormat> {
  List menuItems = [];
  List subMenuItems = [];
  bool isDrawerOpen = true;
  int smallScreenWidthSize = 600;
  void getSubMenuItems() {
    if (NewLoginpageFormat.bodyWidget == null) {
      NewLoginpageFormat.currentSubmenuIndex = 0;
    }

    Map subtitles = widget.menuItems[NewLoginpageFormat.currentMenuIndex ??= 0]
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
    NewLoginpageFormat.currentMenuIndex ??= 0;
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
      )),
      bottomNavigationBar: screenWidth <= smallScreenWidthSize
          ? BottomNavigationBar(
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              currentIndex: NewLoginpageFormat.currentMenuIndex ??= 0,
              onTap: (value) {
                setState(() {
                  if (menuItems[value] == 'Logout') {
                    MyFun.navigatToPagewithoutBack(context, WelcomePage());
                  }
                  NewLoginpageFormat.currentMenuIndex = value;
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
            child: ColoredBox(
              color: const Color.fromARGB(255, 233, 246, 255),
              child: Column(
                children: [
                  if (screenWidth <= smallScreenWidthSize) mySubMenu(),
                  Expanded(child: getbodyWidget())
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget myDrawerButton() {
    return Row(
      children: [
        SizedBox(
          width: isDrawerOpen ? 194 : 54,
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
                NewLoginpageFormat.bodyWidget = widget.user!['profile'];
                MyFun.navigatToPagewithoutBack(
                    context,
                    NewLoginpageFormat(
                        menuItems: widget.menuItems, user: widget.user));
              },
            ),
            PopupMenuItem(
              child: const Text('Logout'),
              onTap: () {
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
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          for (int i = 0; i <= subMenuItems.length - 1; i++)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    NewLoginpageFormat.currentSubmenuIndex = i;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: NewLoginpageFormat.currentSubmenuIndex == i
                      ? Colors.indigo
                      : Colors.grey, // This sets the button color to blue
                ),
                child: Text(
                  subMenuItems[i],
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
        ]));
  }

  Widget getbodyWidget() {
    final bodyWidget = NewLoginpageFormat.bodyWidget;
    NewLoginpageFormat.bodyWidget = null;

    Map<String, dynamic> titleSubtileValue =
        widget.menuItems[NewLoginpageFormat.currentMenuIndex ?? 0]['title'];
    print('v $titleSubtileValue');
    if (titleSubtileValue[
            menuItems[NewLoginpageFormat.currentMenuIndex ?? 0]] ==
        null) {
      titleSubtileValue = widget
          .menuItems[NewLoginpageFormat.currentMenuIndex ?? 0]['subtitle'];
      print('v $titleSubtileValue');
    }
    return bodyWidget ??
        widget.menuItems[NewLoginpageFormat.currentMenuIndex ?? 0]['title']
            [menuItems[NewLoginpageFormat.currentMenuIndex ?? 0]] ??
        widget.menuItems[NewLoginpageFormat.currentMenuIndex ?? 0]['subtitle']
            [subMenuItems[NewLoginpageFormat.currentSubmenuIndex ?? 0]];
  }

  Widget myDrawer() {
    return SizedBox(
      width: isDrawerOpen ? 210 : 70,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            if (isDrawerOpen)
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  myUserImage(),
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
                                NewLoginpageFormat.currentMenuIndex == j
                                    ? Colors.indigo[50]
                                    : Colors.transparent),
                        onPressed: () {
                          setState(() {
                            if (menuItems[j] == 'Logout') {
                              MyFun.navigatToPagewithoutBack(
                                  context, WelcomePage());
                            }
                            NewLoginpageFormat.currentMenuIndex = j;
                            getSubMenuItems();
                          });
                        },
                        child: Row(
                          children: [
                            Icon(
                              widget.menuItems[j]['icon'],
                              size: 28,
                            ),
                            if (isDrawerOpen)
                              myMenuTitle(menuItems[j],
                                  NewLoginpageFormat.currentMenuIndex == j),
                            if (isDrawerOpen) myExpended(),
                            if (isDrawerOpen)
                              if (widget.menuItems[j]['subtitle'] != null)
                                Icon(NewLoginpageFormat.currentMenuIndex == j
                                    ? Icons.remove
                                    : Icons.add)
                          ],
                        )),
                  ),
                  if (j == NewLoginpageFormat.currentMenuIndex && isDrawerOpen)
                    for (int k = 0; k <= subMenuItems.length - 1; k++)
                      TextButton(
                          onPressed: () {
                            setState(() {
                              NewLoginpageFormat.currentSubmenuIndex = k;
                            });
                          },
                          child: Row(
                            children: [
                              SizedBox(
                                width:
                                    NewLoginpageFormat.currentSubmenuIndex == k
                                        ? 18
                                        : 30,
                              ),
                              if (NewLoginpageFormat.currentSubmenuIndex == k)
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 12,
                                ),
                              myMenuTitle(subMenuItems[k],
                                  NewLoginpageFormat.currentSubmenuIndex == k),
                            ],
                          ))
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
      radius: 40,
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
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: isSelectedCondition ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
