import 'package:flutter/material.dart';
import 'package:ripl_rinkesh_practical/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'loginP.dart';
import 'dashBoard.dart';
import 'register.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();

  Constant.pref=await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool isLoggedIn=false;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Practical',
      theme: ThemeData(

        primarySwatch: Colors.lightBlue,
      ),
      routes: {
        "/login":(context)=>Login(),
        "/register":(context)=>RegitF(),
        "/dashB":(context)=>DashB(),
      },
      home: Constant.pref.getBool("isLoggedIn")== true?DashB():Login(),
    );
  }
}

