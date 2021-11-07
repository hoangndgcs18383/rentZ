import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// class Database{
//   final CollectionReference data = FirebaseFirestore.instance.collection('data');
//
//   String uid;
//   Database({required this.uid});
//
//   Future updateUserData(String name, String file, String  message) async{
//     return await data.doc(uid).collection('user').doc().set({
//       'name': name,
//       'file': file,
//       'message': message,
//     });
//   }
// }