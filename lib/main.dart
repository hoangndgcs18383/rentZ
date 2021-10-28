import 'package:apartment_project/models/user.dart';
import 'package:apartment_project/shares/custom_color.dart';
import 'package:apartment_project/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      value: UserData().user,
      initialData: null,
      catchError: (User, MyUser) => null,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Apartment Rent',
          theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          scaffoldBackgroundColor: CustomColors.googleBackground.withOpacity(0.7),
            textTheme: Theme.of(context).textTheme.copyWith(
              bodyText1: Theme.of(context).textTheme.bodyText1?.apply(color: CustomColors.firebaseWhite),
            )
      ),
      home: Wrapper()),
    );
  }
}



