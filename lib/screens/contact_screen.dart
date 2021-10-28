import 'package:apartment_project/models/apartments.dart';
import 'package:apartment_project/models/user.dart';
import 'package:apartment_project/widgets/custom_detail_item_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserData user = UserData();
    return Center(
        child: IconButton(
            onPressed: () async {
              await user.signOut();
            },
            icon: Icon(Icons.logout))
    );
  }
}
