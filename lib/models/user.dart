import 'package:firebase_auth/firebase_auth.dart';

class MyUser{
  String uid;
  MyUser({required this.uid});
}
class UserData{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyUser? _userFormFirebaseUser(User user){
    return user != null ? MyUser(uid: user.uid) : null;
  }

  Future signInAnon() async {
    try{
      UserCredential authCredential = await _auth.signInAnonymously();
      User? firebaseAuth = authCredential.user;
      return _userFormFirebaseUser(firebaseAuth!);
    }
    catch(e) {
      print(e.toString());
    }
  }
}



