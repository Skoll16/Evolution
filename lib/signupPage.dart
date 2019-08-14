import 'package:dummyauth/services/usermanagement.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SignUpPage extends StatefulWidget {
 

  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //  final FirebaseAuth _auth=FirebaseAuth.instance;
  //  final GoogleSignIn googleSignIn=new GoogleSignIn();
    String _email,_password;
  
  //  Future<FirebaseUser> _signIn() async{
  //    GoogleSignInAccount googleSignInAccount=await googleSignIn.signIn();
  //    GoogleSignInAuthentication gSa=await googleSignInAccount.authentication;

  //    FirebaseUser user=await _auth.signInWithGoogle(
  //      IdToken:gSa.idToken,
  //      accessToken:gSa.accessToken,
  //    );

  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Center(
        child: Container(
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: 'Email'),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Password'),
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
                obscureText: true,
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text(
                  'SignUp',
                ),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 8,
                onPressed: () {

                //   FirebaseAuth.instance.createUserWithEmailAndPassword(
                //  email:_email,
                //  password: _password, 
                //   ).then((signedInUser) {
                //     UserManagement().storeNewUser(signedInUser ,context);

                //   }).catchError((e){
                //     print(e);
                //   });
                },
              ),
              SizedBox(
                height: 10,
              ),
              
            ],
          ),
        ),
      ),


    );
  }
}