import 'package:dummyauth/caller_msg.dart';
import 'package:dummyauth/homepage.dart';
import 'package:dummyauth/loginPage.dart';
import 'package:dummyauth/phoneAuth.dart';
import 'package:dummyauth/signupPage.dart';
import 'package:dummyauth/tryThis.dart';
import 'package:dummyauth/userInfo.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

//fAtoXmfEkYo:APA91bG5DHnnSFNILzrzVGkS18nnr79ehVKBuozOP53YmY4ezs0u5f3a-
//qXa8pIwUKQ20tbp0Ty28oM3PAu2fGSdoFUeD05dyiZ6iGFKk6H-DpgCu4Q9fW3riBd3KoQ-kk_9nRNiAB_o
void main()=>runApp(new MyApp());

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  
  final FirebaseMessaging _messaging=FirebaseMessaging();
  @override
  void initState() { 
    super.initState();
     _messaging.getToken().then((token){
      print(token);
     });  
  }
@override
Widget build(BuildContext context) {
  
  return new MaterialApp(
   home:LoginPage(),
    routes: <String,WidgetBuilder>{
    '/landingpage':(BuildContext context)=>new MyApp(),
    '/signup':(BuildContext context)=> new SignUpPage(),
    '/homepage':(BuildContext context)=>new HomePage(),
    '/phoneauth':(BuildContext context)=>new phoneAuth(),
    '/userInfo':(BuildContext context)=>new userInfo(),
    '/tryThis':(BuildContext context)=>new TryThis(),
    '/khulja':(BuildContext context)=>new Calller_Msg()
    },

  );
}
}