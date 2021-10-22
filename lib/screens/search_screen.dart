import 'package:apartment_project/models/apartments.dart';
import 'package:apartment_project/shares/const.dart';
import 'package:apartment_project/shares/custom_color.dart';
import 'package:apartment_project/widgets/custom_detail_item_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLike = false;
    return StreamBuilder<QuerySnapshot>(
      stream: ApartmentData.readApartments(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        } else if (snapshot.hasData || snapshot.data != null){
          return Scaffold(
            backgroundColor: CustomColors.firebaseNavy.withOpacity(0.5),
            body: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: CustomColors.firebaseNavy,
                        ),
                      ),
                      prefixIcon: Icon(Icons.search, color: CustomColors.firebaseOrange,),
                      suffixIcon: Icon(Icons.filter_list, color: Colors.lightBlue,),
                      hintText: "Search...",
                      hintStyle: TextStyle(color: CustomColors.firebaseWhite),
                      focusColor: CustomColors.firebaseOrange,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 32, right: 32, top: 16, bottom: 16),
                  color: CustomColors.firebaseNavy,
                  child: Text(
                    "100 Results Found",
                    style: TextStyle(
                      color: CustomColors.firebaseBlack,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    color: CustomColors.firebaseNavy,
                    child: ListView.separated(
                        itemBuilder: (context, index){
                          var noteInfo = snapshot.data!.docs[index];
                          String docID = snapshot.data!.docs[index].id;
                          String nameApm = noteInfo.get('nameApm');
                          String address = noteInfo.get('address');
                          String type = noteInfo.get('type');
                          int numBed = noteInfo.get('numBed');
                          int numKit = noteInfo.get('numKit');
                          int numBath = noteInfo.get('numBath');
                          int price = noteInfo.get('price');
                          String nameReporter = noteInfo.get('nameOwn');
                          String note = noteInfo.get('note');
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: ()  async {
                                        isLike = true;
                                      },
                                      icon: Icon(Icons.favorite_border, color: isLike == false ? Colors.white : Colors.red,)),
                                  Container(
                                    width: 80,
                                    height: 80,
                                    child: GestureDetector(
                                      child: ClipOval(
                                        child: Image.asset("assets/images/logo.png", fit: BoxFit.cover,),
                                      ),
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context) =>
                                                DetailApartment(index: index,)));
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 20,),
                                  Expanded(
                                      child: Column(
                                        children: <Widget>[
                                          Text(nameApm,
                                            style: styleHeading_1Text.copyWith(color: CustomColors.firebaseOrange)),
                                          Text("Create by $nameReporter",
                                            style: styleHeading_2Text.copyWith(color: CustomColors.firebaseWhite)),
                                          Text("$price\$ per month",
                                            style: styleHeading_3Text.copyWith(color: CustomColors.firebaseYellow))
                                        ],
                                      )),
                                ],
                              ),
                              SizedBox(height: 12,),
                              Container(
                                margin: EdgeInsets.only(left: 32, right: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.bed_outlined , size: 20, color: CustomColors.firebaseBlack,),
                                        SizedBox(width: 4,),
                                        Text("$numBed bedroom", style: TextStyle(color: Colors.white),)
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.kitchen, size: 20, color: CustomColors.firebaseBlack,),
                                        SizedBox(width: 4,),
                                        Text("$numKit kitten", style: TextStyle(color: Colors.white),)
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.bathroom, size: 20, color: CustomColors.firebaseBlack,),
                                        SizedBox(width: 4,),
                                        Text("$numBath bathroom", style: TextStyle(color: Colors.white),)
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                        separatorBuilder: (context, index) => Divider(color: Colors.deepOrangeAccent, height: 20, thickness: 1),
                        itemCount: snapshot.data!.docs.length),
                  ),
                ),
              ],
            ),
          );
        }
        else{
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                CustomColors.firebaseOrange,
              ),
            ),
          );
        }
      }
    );
  }
}
