import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Dummy_Auth'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('Welcome User!!'),
              SizedBox(
                height: 15,
              ),
              new OutlineButton(
                borderSide: BorderSide(
                    color: Colors.red, style: BorderStyle.solid, width: 3),
                child: Text('Logout'),
                onPressed: () {
                    FirebaseAuth.instance.signOut().then((value){}).catchError((e){print(e);});

                },
              )
            ],
          ),
        ),
      ),
    );
  }
}