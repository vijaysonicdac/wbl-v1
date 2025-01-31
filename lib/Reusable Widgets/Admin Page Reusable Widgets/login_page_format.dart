// ignore_for_file: non_constant_identifier_names, unused_element, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:wbl/Pages/Welcome%20Page/welcome_page.dart';
import 'package:wbl/Reusable%20Functions/reusable_function.dart';

class LoginPageFormat extends StatefulWidget {
  const LoginPageFormat({
    super.key,
    this.user,
    required this.menuItems,
  });

  static String? selectedMenuItem;
  static String? selectedsubMenuItem;
  static double sidebarWidth = 250;
  static Widget? bodyWidget;
  static String? selectedButtonName;
  final List<Map<String, dynamic>> menuItems;
  final Map<String, dynamic>? user;

  @override
  State<LoginPageFormat> createState() => _LoginPageFormatState();
}

class _LoginPageFormatState extends State<LoginPageFormat> {
  bool _isDrawerOpen = true;
  double openSidebarwidth = 250;
  double closedSidebarwidth = 80;
  int currentIndex = 0;

  @override
  void initState() {
    LoginPageFormat.selectedMenuItem ??=
        widget.menuItems[0]['title'].keys.first;
    if (LoginPageFormat.selectedsubMenuItem == null) {
      if (widget.menuItems[0]['subtitle'] == null) {
        LoginPageFormat.selectedsubMenuItem = '';
      } else {
        LoginPageFormat.selectedsubMenuItem =
            widget.menuItems[0]['subtitle'].keys.first;
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= 600) {
      _isDrawerOpen = false;
    }
    LoginPageFormat.sidebarWidth =
        _isDrawerOpen ? openSidebarwidth : closedSidebarwidth;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (_isDrawerOpen)
              SizedBox(
                width: 235,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    myImage("assets/images/wblLogo.png"),
                    Text(
                      'WBL',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            if (_isDrawerOpen)
              Container(
                color: Colors.grey[300],
                width: 1,
                height: 40,
              ),
            MyFun.isMobiledevice()
                ? SizedBox(width: 50, child: myUserImage())
                : IconButton(
                    icon: const Icon(
                      Icons.menu,
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        _isDrawerOpen = !_isDrawerOpen;
                      });
                    },
                  ),
            myExpended(),
            if (MediaQuery.of(context).size.width >= 800) ...[
              myImage("assets/images/miety.png"),
              myImage('assets/images/G20Logo.png'),
              myImage("assets/images/cdacLogo.png"),
            ] else
              myImage("assets/images/wblLogo.png"),
            myExpended(),
            IconButton(
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
                        MyFun.navigatToPagewithoutBack(
                            context, widget.user!['profile']);
                      },
                    ),
                    PopupMenuItem(
                      child: const Text('Logout'),
                      onTap: () {
                        LoginPageFormat.selectedMenuItem = null;
                        LoginPageFormat.selectedsubMenuItem = null;
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
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyFun.isMobiledevice()
          ? BottomNavigationBar(
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              currentIndex: currentIndex,
              onTap: (value) {
                setState(() {
                  currentIndex = value;
                  Map<String, dynamic> titleValue =
                      widget.menuItems[currentIndex]['title'];
                  String title = titleValue.keys.first;
                  Map<String, dynamic> subtitleValue =
                      widget.menuItems[currentIndex]['subtitle'] ?? {};
                  List subtitles =
                      (widget.menuItems[currentIndex]['subtitle'] ?? {})
                          .keys
                          .toList();
                  LoginPageFormat.selectedMenuItem = title;
                  LoginPageFormat.selectedsubMenuItem =
                      subtitles.isNotEmpty ? subtitles.first : null;
                  LoginPageFormat.bodyWidget =
                      titleValue[title] ?? subtitleValue[subtitles.first];
                  LoginPageFormat.selectedButtonName = null;
                  if (title == 'Logout') {
                    LoginPageFormat.selectedMenuItem = null;
                    LoginPageFormat.selectedsubMenuItem = null;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LoginPageFormat.bodyWidget ??
                              const WelcomePage()),
                    );
                  }
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (MyFun.isMobiledevice() == false) myDrawer(),
          Expanded(
            child: Column(
              children: [
                Divider(
                  height: 1,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: mySubmenu(
                        widget.menuItems[currentIndex]['subtitle'], 200),
                  ),
                ),
                Container(
                  color: Colors.grey[200],
                  child: showSelectedMenuSubmenu(),
                ),
                Expanded(
                  child: _getwidgettodisplay(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget myDrawer() {
    return SizedBox(
      width: _isDrawerOpen ? openSidebarwidth : closedSidebarwidth,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            if (_isDrawerOpen) myUserImage(),
            if (_isDrawerOpen)
              Text(
                '${widget.user!['firstName']} ${widget.user!['lastName']} (Manager)',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (_isDrawerOpen) Text(widget.user!['center']),
            if (_isDrawerOpen) const Divider(),
            for (int i = 0; i < widget.menuItems.length; i++)
              MenuItem(
                icon: widget.menuItems[i]['icon'],
                titleValue: widget.menuItems[i]['title'],
                subtitleValue: widget.menuItems[i]['subtitle'] ?? {},
              ),
          ],
        ),
      ),
    );
  }

  Widget MenuItem({
    final IconData? icon,
    required Map<String, dynamic> titleValue,
    required Map<String, dynamic> subtitleValue,
  }) {
    String title = titleValue.keys.first;
    List<String> subtitles = subtitleValue.keys.toList();
    return Column(
      children: [
        ListTile(
          tileColor: LoginPageFormat.selectedMenuItem == title
              ? Colors.grey[200]
              : Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.all(6),
            child: Icon(icon),
          ),
          title: _isDrawerOpen
              ? Text(title, style: const TextStyle(fontSize: 14))
              : null,
          trailing: _isDrawerOpen && subtitles.isNotEmpty
              ? LoginPageFormat.selectedMenuItem == title
                  ? const Icon(Icons.remove)
                  : const Icon(Icons.add)
              : null,
          onTap: () {
            setState(() {
              LoginPageFormat.selectedMenuItem = title;
              LoginPageFormat.selectedsubMenuItem =
                  subtitles.isNotEmpty ? subtitles.first : null;
              LoginPageFormat.bodyWidget =
                  titleValue[title] ?? subtitleValue[subtitles.first];
              LoginPageFormat.selectedButtonName = null;
              if (title == 'Logout') {
                LoginPageFormat.selectedMenuItem = null;
                LoginPageFormat.selectedsubMenuItem = null;
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LoginPageFormat.bodyWidget ?? const WelcomePage()),
                );
              }
            });
          },
        ),
        if (_isDrawerOpen && LoginPageFormat.selectedMenuItem == title)
          Column(
            children: mySubmenu(subtitleValue, double.maxFinite),
          )
      ],
    );
  }

  Widget _getwidgettodisplay() {
    return LoginPageFormat.bodyWidget ??
        widget.menuItems[0]['title'].values.first ??
        widget.menuItems[0]['subtitle'].values.first;
  }

  Widget myResponsiveWidget(List<Widget> children) {
    return MediaQuery.of(context).size.width <= 600
        ? Wrap(children: children)
        : Row(children: children);
  }

  Widget showSelectedMenuSubmenu() {
    return myResponsiveWidget([
      Text(
        '${LoginPageFormat.selectedMenuItem ?? ""}'
        '${(LoginPageFormat.selectedsubMenuItem != null && LoginPageFormat.selectedsubMenuItem != LoginPageFormat.selectedMenuItem) ? " > ${LoginPageFormat.selectedsubMenuItem}" : ""}'
        '${(LoginPageFormat.selectedButtonName?.isNotEmpty ?? false) ? " > ${LoginPageFormat.selectedButtonName}" : ""}',
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      Expanded(
        child: Center(
          child: Text(
            '${widget.user!['center']!} (${widget.user!['center type']!})',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ]);
  }

  Widget myImage(String assetLocation) {
    return Image(
      image: AssetImage(assetLocation),
      height: 40,
    );
  }

  Widget myExpended() {
    return const Expanded(
      child: SizedBox(
        width: 1,
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

  List<Widget> mySubmenu(subtitleValue, double width) {
    List<String> subtitles = subtitleValue.keys.toList();
    return [
      for (var subtitle in subtitles)
        SizedBox(
          width: width,
          child: ListTile(
            tileColor: LoginPageFormat.selectedsubMenuItem == subtitle
                ? Colors.grey[200]
                : Colors.transparent,
            title: Text(
              subtitle,
              style: const TextStyle(fontSize: 14),
            ),
            leading: LoginPageFormat.selectedsubMenuItem == subtitle
                ? const Icon(Icons.arrow_forward_ios_outlined, size: 15)
                : SizedBox(
                    width: 5,
                  ),
            onTap: () {
              setState(() {
                LoginPageFormat.selectedsubMenuItem = subtitle;
                LoginPageFormat.selectedButtonName = null;
                LoginPageFormat.bodyWidget = subtitleValue[subtitle];
              });
            },
          ),
        ),
    ];
  }
}
