import 'package:apartment_project/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';



final CollectionReference _mainCollection =  FirebaseFirestore.instance.collection('rentalZ');

class ApartmentField{
  static const createdTime = 'createdTime';
}

class ApartmentData{
  static String? username;
  static MyUser user = MyUser(uid: 'uid');

  static Future<void> addApartment({
    required String nameOwn,
    required String nameApm,
    required String address,
    required String furniture,
    required String type,
    required int numBed,
    required int numKit,
    required int numBath,
    required int price,
    required String note}) async{
    DocumentReference docApartment = _mainCollection.doc(user.uid).collection("data").doc();

    Map<String, dynamic> apartmentData = <String,dynamic>{
        'nameOwn' : nameOwn,
        'nameApm' : nameApm,
        'address': address,
        'furniture': furniture,
        'type' : type,
        'numBed' : numBed,
        'numKit': numKit,
        'numBath' : numBath,
        'price' : price,
        'note': note,
    };
    await docApartment
        .set(apartmentData).whenComplete(() => print("The apartment update $nameApm"))
        .catchError((error) => print(error));
  }
  static Stream<QuerySnapshot> readApartments() {
    CollectionReference docApartment =
    _mainCollection.doc(user.uid).collection("data");
    return docApartment.snapshots();
  }



  static Future<void> updateApartment({
    required String docId,
    required String nameOwn,
    required String nameApm,
    required String address,
    required String furniture,
    required String type,
    required int numBed,
    required int numKit,
    required int numBath,
    required int price,
    required String note}) async{
    DocumentReference docApartment = _mainCollection.doc(user.uid).collection('data').doc(docId);

    Map<String, dynamic> apartmentData = <String,dynamic>{
      'nameOwn' : nameOwn,
      'nameApm' : nameApm,
      'address': address,
      'furniture': furniture,
      'type' : type,
      'numBed' : numBed,
      'numKit': numKit,
      'numBath' : numBath,
      'price' : price,
      'note': note,
    };
    await docApartment
        .set(apartmentData).whenComplete(() => print("The apartment added $nameApm"))
        .catchError((error) => print(error));
  }

  static Future<void> deleteApartment({
    required String docId
    }) async{
    DocumentReference docApartment = _mainCollection.doc(user.uid).collection('data').doc(docId);

    await docApartment
        .delete().whenComplete(() => print("The apartment deleted"))
        .catchError((error) => print(error));
  }

}

