import 'package:apartment_project/screens/about_screen.dart';
import 'package:apartment_project/screens/edit_profile_sceen.dart';
import 'package:apartment_project/shares/custom_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../authenticate.dart';

class NavBarMenu extends StatefulWidget {
  const NavBarMenu({Key? key}) : super(key: key);

  @override
  State<NavBarMenu> createState() => _NavBarMenuState();
}

class _NavBarMenuState extends State<NavBarMenu> {


  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text("Email", style: TextStyle(fontWeight: FontWeight.bold),),
              accountEmail: Text("${_auth.currentUser!.email}"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('assets/images/logo.png',
                width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://i.pinimg.com/474x/2a/18/77/2a18772255c00b157137fcd1f06c00b4--calming-photos-beautiful-nature-photography.jpg',
                ),
                fit: BoxFit.cover
              )
            ),
          ),
          ListTile(
            tileColor: CustomColors.firebaseOrange,
            leading: Icon(Icons.person),
            title: Text('Edit profile'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditProfile()));
            },
          ),
          ListTile(
            tileColor: CustomColors.firebaseOrange,
            leading: Icon(Icons.account_box_outlined),
            title: Text('About'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)
              => AboutScreen()));
            },
          ),
          ListTile(
            tileColor: CustomColors.firebaseOrange,
            leading: Icon(Icons.exit_to_app),
            title: Text('Sign Out'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)
              => Authenticate()));
            },
          )
        ],
      ),
    );
  }
}
