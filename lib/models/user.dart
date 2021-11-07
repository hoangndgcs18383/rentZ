import 'package:apartment_project/models/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class MyUser{
  String uid;
  MyUser({required this.uid});
}
class UserData{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyUser? _userFormFirebaseUser(User user){
    return user != null ? MyUser(uid: user.uid) : null;
  }
  
  Stream<MyUser?> get user{
    return _auth.authStateChanges()
        .map((User? user) => _userFormFirebaseUser(user!));
  }

  Future signInAnon() async {
    try{
      UserCredential authCredential = await _auth.signInAnonymously();
      User? user = authCredential.user;
      return _userFormFirebaseUser(user!);
    }
    catch(e) {
      print(e.toString());
    }
  }

  Future registerWithEmailAndPassword(TextEditingController email, TextEditingController password) async {
    try{
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email.text, password: password.text);
      User? user = credential.user;
      // await Database(uid: user!.uid).updateUserData('new member', 'assets/images/logo.png', '');
      return _userFormFirebaseUser(user!);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signWithEmailAndPassword(TextEditingController email, TextEditingController password) async{
    try{
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email.text, password: password.text);
      User? user = credential.user;
      return _userFormFirebaseUser(user!);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signOut() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
}



