import 'dart:convert';

import 'package:apartment_project/shares/custom_color.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.firebaseNavy,
        body: Container(
          child: Center(
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Image.asset(
                    'assets/images/logo.jpeg',
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Contact",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Auth",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Nguyễn Đức Hoàng",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: CustomColors.firebaseYellow,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Email",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "hoangndgcs18383@fpt.edu.vn",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: CustomColors.firebaseYellow,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Phone",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "(84) 96 5285 940",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: CustomColors.firebaseYellow,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
