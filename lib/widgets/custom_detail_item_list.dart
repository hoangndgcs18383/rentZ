import 'package:apartment_project/models/apartments.dart';
import 'package:apartment_project/shares/const.dart';
import 'package:apartment_project/shares/custom_color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailApartment extends StatelessWidget {
  final int index;
  const DetailApartment({Key? key, required this.index}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    late int currentIndex = index;
    return StreamBuilder<QuerySnapshot>(
      stream: ApartmentData.readApartments(),
      builder: (context, snapshot) {
        var noteInfo = snapshot.data!.docs[currentIndex];
        String nameApm = noteInfo.get('nameApm');
        String address = noteInfo.get('address');
        String type = noteInfo.get('type');
        String furniture = noteInfo.get('furniture');
        int numBed = noteInfo.get('numBed');
        int numKit = noteInfo.get('numKit');
        int numBath = noteInfo.get('numBath');
        int price = noteInfo.get('price');
        String nameReporter = noteInfo.get('nameOwn');
        String note = noteInfo.get('note');
        return Scaffold(
          body: Column(
            children: <Widget>[
              SizedBox(
                height: 330,
                child: Stack(
                  children: <Widget>[
                    SizedBox(
                      height: 330,
                      child: Image.asset("assets/images/logo.png", fit: BoxFit.cover,),
                    ),
                    Positioned(
                      top: 42,
                      left: 16,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          color: Colors.grey
                        ),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios, color: CustomColors.firebaseWhite,),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    )
                  ],
                )
              ),
              Expanded(
                  child: SingleChildScrollView(
                    controller: ScrollController(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 32, right: 32, top: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: media.size.width-112,
                                    child: Text("$address, $nameApm",
                                      style: styleHeading_1Text.copyWith(color: CustomColors.firebaseYellow),
                                    ),
                                  ),
                                  SizedBox(height: 8,),
                                  Text("\"$note\"",
                                    style: styleHeading_2Text.copyWith(color: CustomColors.firebaseWhite),
                                  ),
                                  SizedBox(height: 16,),
                                  Text("$price\$ per month",
                                    style: styleHeading_3Text,
                                  ),
                                ],
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.navigation))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 32, right: 32, top: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.bed, size: 20, color: Colors.white,),
                                  SizedBox(width: 4,),
                                  Text("$numBed Bedroom", style: TextStyle(fontSize: 16 ,color: CustomColors.googleBackground, fontWeight: FontWeight.bold),)
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.kitchen, size: 20, color: Colors.white,),
                                  SizedBox(width: 4,),
                                  Text("$numKit Kitten", style: TextStyle(fontSize: 16 ,color: CustomColors.googleBackground, fontWeight: FontWeight.bold),)
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.bathroom, size: 20, color: Colors.white,),
                                  SizedBox(width: 4,),
                                  Text("$numBath Bath", style: TextStyle(fontSize: 16 ,color: CustomColors.googleBackground, fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8,),
                        Divider(),
                        Container(
                          margin: EdgeInsets.only(
                            left: 32, right: 32),
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                child: ClipRRect(
                                  child: Image.asset("assets/images/logo.png"),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              SizedBox(width: 16,),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(nameReporter, style: TextStyle(
                                        color: CustomColors.firebaseYellow,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                      Text("Owner", style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      ),)
                                    ],
                              )),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    onPrimary: Colors.white,
                                  ),
                                  onPressed: () {},
                                  child: Text("Contact", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),)
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8,),
                        Divider(),
                        SizedBox(height: 8,),
                        Container(
                          margin: EdgeInsets.only(left: 32, right: 32),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Property Type : $type", style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),),
                            ],
                          ),
                        ),
                        SizedBox(height: 8,),
                        Container(
                          margin: EdgeInsets.only(left: 32, right: 32),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Property Furniture : $furniture", style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),),
                            ],
                          ),
                        ),
                        SizedBox(height: 8,),
                        //UI
                        Container(
                          margin: EdgeInsets.only(left: 32, right: 32),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Features", style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),),
                              SizedBox(height: 16,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.wifi, color: Colors.green,),
                                      SizedBox(width: 4,),
                                      Text("Wifi", style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),)
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.fitness_center, color: Colors.black38,),
                                      SizedBox(width: 4,),
                                      Text("Gym", style: TextStyle(
                                        color: CustomColors.googleBackground,
                                        fontWeight: FontWeight.w500,
                                      ),)
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.local_cafe_rounded, color: Colors.brown,),
                                      SizedBox(width: 4,),
                                      Text("Cafe", style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),)
                                    ],
                                  ),

                                ],
                              ),
                              SizedBox(height: 8,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.wifi, color: Colors.green,),
                                      SizedBox(width: 4,),
                                      Text("Wifi", style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),)
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.bed, color: Colors.green,),
                                      SizedBox(width: 4,),
                                      Text("Bed", style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),)
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.local_cafe_rounded, color: Colors.green,),
                                      SizedBox(width: 4,),
                                      Text("Cafe", style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),)
                                    ],
                                  ),

                                ],
                              ),
                              SizedBox(height: 8,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.wifi, color: Colors.green,),
                                      SizedBox(width: 4,),
                                      Text("Wifi", style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),)
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.bed, color: Colors.green,),
                                      SizedBox(width: 4,),
                                      Text("Bed", style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),)
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.local_cafe_rounded, color: Colors.green,),
                                      SizedBox(width: 4,),
                                      Text("Cafe", style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),)
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),

                      ],
                    ),
                  )),
              Container(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {},
                    child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text("Book Now", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),))
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
