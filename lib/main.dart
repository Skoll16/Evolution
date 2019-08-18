import 'package:dummyauth/homepage.dart';
import 'package:dummyauth/loginPage.dart';
import 'package:dummyauth/phoneAuth.dart';
import 'package:dummyauth/signupPage.dart';
import 'package:flutter/material.dart';

void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget{
@override
Widget build(BuildContext context) {
  return new MaterialApp(
   home:LoginPage(),
    routes: <String,WidgetBuilder>{
    '/landingpage':(BuildContext context)=>new MyApp(),
    '/signup':(BuildContext context)=> new SignUpPage(),
    '/homepage':(BuildContext context)=>new HomePage(),
    '/phoneauth':(BuildContext context)=>new phoneAuth(),
    },

  );
}

}