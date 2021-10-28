import 'package:flutter/material.dart';

class MenuItems{
  static List<MenuItem> itemFirst = [
    itemSetting,
    itemShare,
  ];

  static List<MenuItem> itemSecond = [
    itemLogout
  ];

  static MenuItem itemSetting = MenuItem(
    text: "Setting",
    icon: Icons.settings
  );

  static MenuItem itemShare = MenuItem(
      text: "Share",
      icon: Icons.share
  );
  static MenuItem itemLogout = MenuItem(
      text: "Logout",
      icon: Icons.logout
  );
}

class MenuItem{
  final String text;
  final IconData icon;

  MenuItem({required this.text, required this.icon});
}