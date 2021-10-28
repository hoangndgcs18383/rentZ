import 'package:apartment_project/models/apartments.dart';
import 'package:apartment_project/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../custom_detail_item_list.dart';

class Search extends SearchDelegate{
  static MyUser user = MyUser(uid: 'uid');
  final CollectionReference _collectionReference = FirebaseFirestore.instance.collection('rentalZ')
      .doc('uid').collection('data');


  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
      IconButton(
        icon: const Icon(Icons.filter_list),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
            showSuggestions(context);
          }
        },
      );
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _collectionReference.snapshots().asBroadcastStream(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return const Center(
                child: CircularProgressIndicator()
            );
          }
          else{
            return ListView(
              children: [
                ...snapshot.data!.docs.where((QueryDocumentSnapshot<Object?> element) =>
                    element['address']
                        .toString()
                        .toLowerCase()
                        .contains(query.toLowerCase())).map((QueryDocumentSnapshot<Object?> data) {
                  final String address = data.get('address');
                  final String nameApm = data.get('nameApm');
                  final int price = data.get('price');

                  return ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>
                              DetailApartment(data: data))
                      );
                    },
                    leading: Icon(Icons.home_work, size: 64,),
                    title: Text('Rental: $nameApm - Cost: $price\$'),
                    subtitle: Text("Address: $address"),
                    trailing: Icon(Icons.access_alarm),
                    tileColor: Colors.lightBlueAccent,
                    contentPadding: EdgeInsets.all(8),
                    focusColor: Colors.lightBlue,
                  );
                })
              ],
            );
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return StreamBuilder<QuerySnapshot>(
        stream: _collectionReference.snapshots().asBroadcastStream(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return const Center(
                child: CircularProgressIndicator()
            );
          }
          else if(snapshot.data!.docs.where((QueryDocumentSnapshot<Object?> element) =>
              element['address']
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase())).isEmpty)
            {
              return Center(
                child: Text("No search found!"),
              );
            }

          else{
            return ListView(
              children: [
                ...snapshot.data!.docs.where((QueryDocumentSnapshot<Object?> element) =>
                    element['address']
                        .toString()
                        .toLowerCase()
                        .contains(query.toLowerCase())).map((QueryDocumentSnapshot<Object?> data) {
                  final String address = data.get('address');
                  final String nameApm = data.get('nameApm');
                  final int price = data.get('price');

                  return ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>
                              DetailApartment(data: data))
                      );
                    },
                    leading: Icon(Icons.home_work, size: 64,),
                    title: Text('Rental: $nameApm - Cost: $price\$'),
                    subtitle: Text("Address: $address"),
                    trailing: Icon(Icons.access_alarm),
                    tileColor: Colors.lightBlueAccent.withOpacity(0.5),
                    contentPadding: EdgeInsets.all(8),
                  );
                })
              ],
            );
          }
        });
  }}
