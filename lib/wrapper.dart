import 'package:apartment_project/authenticate.dart';
import 'package:apartment_project/screens/dashboard_screen.dart';
import 'package:apartment_project/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    if(user == null){
      return Authenticate();
    } else{
      return DashboardScreen();
    }
  }
}
