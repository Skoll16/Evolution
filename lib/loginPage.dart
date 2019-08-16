import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  FacebookLogin fblogin = new FacebookLogin();
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
                  'Login With Facebook',
                ),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 8,
                onPressed: () {
                  // void initiateFacebookLogin() async {
                  //   var facebookLogin = FacebookLogin();
                  //   var facebookLoginResult =
                  //       await facebookLogin.logInWithReadPermissions(['email','public_profile']);
                  //   switch (facebookLoginResult.status) {
                  //     case FacebookLoginStatus.error:
                  //       print("Error");
                  //                    break;
                  //      case FacebookLoginStatus.cancelledByUser:
                  //       print("CancelledByUser");
                        
                  //       break;
                  //     case FacebookLoginStatus.loggedIn:
                  //       print("LoggedIn");
                  //       Navigator.of(context).pushReplacementNamed('/homepage');
                  //       //onLoginStatusChanged(true);
                  //       break;
                  //   }
                  // }

                  //  fblogin.logInWithReadPermissions(['email' , 'public_profile']).then(
                  //    (result){
                  //     switch(result.status){
                  //       case FacebookLoginStatus.loggedIn:
                  //       FacebookAccessToken myToken = facebookLoginResult.accessToken;

                  //     }
                  //    }
                  //  ).catchError((e){
                  //    print(e);
                  //  });

                   FirebaseAuth.instance.signInWithEmailAndPassword(
                     email: _email,password: _password,
                   ).then((FirebaseUser user){
                        Navigator.of(context).pushReplacementNamed('/homepage');
                   }).catchError((e){
                     print(e);
                   });
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text('Don\'t Have a Account? SignUp'),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                child: Text('SignUp'),
                color: Colors.orange,
                textColor: Colors.white,
                elevation: 8,
                onPressed: () {
                  Navigator.of(context).pushNamed('/signup');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
