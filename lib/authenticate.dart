import 'package:apartment_project/screens/home_page.dart';
import 'package:apartment_project/screens/register_page.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool isToggle = true;
  void toggle(){
   setState(() {
     isToggle = !isToggle;
   });
  }

  @override
  Widget build(BuildContext context) {
    if(isToggle){
      return LoginPage(toggleScreen : toggle);
    }
    else{
      return RegisterPage(toggleScreen: toggle);
    }
  }
}
