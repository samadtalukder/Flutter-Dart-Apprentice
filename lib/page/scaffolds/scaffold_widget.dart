import 'package:flutter/material.dart';
import 'package:flutter_dart_apprentice/common_utils.dart';

class ScaffoldWidget extends StatefulWidget {
  const ScaffoldWidget({Key? key}) : super(key: key);

  @override
  _ScaffoldWidgetState createState() => _ScaffoldWidgetState();
}

class _ScaffoldWidgetState extends State<ScaffoldWidget> {
  int selectTabIndex = 0;
  static List<Widget> pages = [
    Container(
      color: Colors.amber,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.cyan,
    ),
    Container(
      color: Colors.brown,
    ),
  ];

  clickBottomNavItem(int index) {
    setState(() {
      selectTabIndex = index;
      debugPrint("TabIndex: $selectTabIndex");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context),
      body: pages[selectTabIndex],
      bottomNavigationBar: bottomNavBarWidget(context),
      drawer: startNavDrawer(context),
    );
  }

  themeBody(BuildContext context) {}

  appBarWidget(BuildContext context) {
    return AppBar(
      title: const Text(
        "Scaffold",
      ),
    );
  }

  bottomNavBarWidget(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      currentIndex: selectTabIndex,
      onTap: clickBottomNavItem,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: "Favorite",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz),
          label: "More",
        ),
      ],
    );
  }

  startNavDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          customNavHeader(),
          customNavListItem(
            icon: Icons.home,
            title: "Home",
          ),
          customNavListItem(
            icon: Icons.favorite,
            title: "Favorite",
          ),
          customNavListItem(
            icon: Icons.person,
            title: "Profile",
          ),
          customNavListItem(
            icon: Icons.more_horiz,
            title: "More",
          ),
          const Divider(),
          const ListTile(
            title: Text("App Version"),
          )
        ],
      ),
    );
  }

  customNavHeader() {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.green[300],
        shape: BoxShape.rectangle,
        //image: DecorationImage(image: Icons.ac_unit)
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 30,
            ),
            child: Text(
              CommonUtils.appName,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  customNavListItem(
      {IconData? icon, String? title, GestureTapCallback? onTapCall}) {
    return ListTile(
      onTap: onTapCall,
      title: Row(
        children: [
          Icon(icon),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title!),
          ),
        ],
      ),
    );
  }
}
