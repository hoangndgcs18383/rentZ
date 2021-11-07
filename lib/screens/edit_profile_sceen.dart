import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? _image;
  FirebaseAuth _auth = FirebaseAuth.instance;



  @override
  Future getImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(() {
      this._image = imageTemporary;
    });
  }

  Future uploadPic(BuildContext context) async {
    String fileName = basename(_image!.path);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(fileName);
    UploadTask uploadTask = firebaseStorageRef.putFile(_image!);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => setState(() {
              print("Profile Picture uploaded");
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
            }));
    return taskSnapshot;
  }

  Widget build(BuildContext context) {

    void _showButtonSheet(){
      showModalBottomSheet(
          context: context,
          builder: (context){
            return Container(
             padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                      size: 30.0,
                    ),
                    onPressed: () {
                      getImage();
                    },
                  ),
                  SizedBox(width: 8,),
                  Text("Camera"),
                ],
              ),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text('Edit Profile'),
      ),
      body: Builder(
        builder: (context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Color(0xff476cfb),
                      child: ClipOval(
                        child: SizedBox(
                          width: 180.0,
                          height: 180.0,
                          child: (_image != null)
                              ? Image.file(
                                  _image!,
                                  fit: BoxFit.fill,
                                )
                              : Image.asset(
                                  'assets/images/logo.png',
                                  fit: BoxFit.fill,
                                ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 60.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        size: 30.0,
                      ),
                      onPressed: () {
                        _showButtonSheet();
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Username',
                                style: TextStyle(
                                    color: Colors.yellow, fontSize: 18.0)),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('${_auth.currentUser!.email}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Password',
                                style: TextStyle(
                                    color: Colors.yellow, fontSize: 18.0)),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('***',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(),
                    onPressed: () async {
                      await uploadPic(context);
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
