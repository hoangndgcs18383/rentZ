import 'package:apartment_project/authenticate.dart';
import 'package:apartment_project/models/menu_item.dart';
import 'package:apartment_project/models/user.dart';
import 'package:apartment_project/screens/search_screen.dart';
import 'package:apartment_project/shares/custom_color.dart';
import 'package:apartment_project/widgets/custom_appbar.dart';
import 'package:apartment_project/widgets/item_list.dart';
import 'package:apartment_project/widgets/search_bar/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'about_screen.dart';
import 'add_screen.dart';
import 'contact_screen.dart';
import 'list_screen.dart';
import 'package:animations/animations.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final UserData user = UserData();
  int currentIndex = 0;
  final screens = [
    ListScreen(),
    AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.firebaseNavy,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColors.firebaseNavy,
        title: AppBarTitle(),
        actions: [
          SearchBar(),
          PopupMenuButton<MenuItem>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) =>
            [
              ...MenuItems.itemFirst.map((buildItem)).toList(),
              ...MenuItems.itemSecond.map((buildItem)).toList()
            ]
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddScreen(),
            ),
          );
        },
        backgroundColor: CustomColors.firebaseOrange,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),
      body: PageTransitionSwitcher(
        duration: Duration(seconds: 1),
          transitionBuilder: (child, animation, secondaryAnimation) =>
            FadeThroughTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                child: child,
            )
          ,
          child: screens[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) => setState(() {
            currentIndex = index;
          }),
          currentIndex: currentIndex,
          backgroundColor: CustomColors.firebaseNavy,
          selectedItemColor: CustomColors.firebaseOrange,
          selectedFontSize: 16,
          unselectedItemColor: CustomColors.firebaseBlack,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_mail),
              label: 'Contact'
              ,),
          ]),
    );
  }

  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem<MenuItem>(
    value: item,
    child: Row(
      children: [
        Icon(
          item.icon, color: Colors.white70, size: 20,
        ),
        Text(item.text),
      ],
    ),
  );

  Future<void> onSelected(BuildContext context, MenuItem item) async {
    if(item == MenuItems.itemSetting){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)
       => Authenticate()));
    }
    else if(item == MenuItems.itemShare){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)
      => Authenticate()));
    }
    else if(item == MenuItems.itemLogout){
      await user.signOut();
      Navigator.pop(context);
    }
  }
}