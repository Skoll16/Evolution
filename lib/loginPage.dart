import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  

 
  //getting token for the device on which we wanna shoot notification

  
  String _email, _password;
  FacebookLogin fblogin = new FacebookLogin();
 
  bool isLoggedIn = false;
  void onLoginStatusChanged(bool isLoggedIn) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
    });
  }

  void initiateFacebookLogin() async {
     String email,profile;
    var facebookLogin = FacebookLogin();
    var facebookLoginResult = await facebookLogin
        .logInWithReadPermissions(['email', 'public_profile']);
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        print("Error");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("CancelledByUser");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        print("LoggedIn");
        onLoginStatusChanged(true);
        break;
    }
     
    
  }

   @override
  Widget build(BuildContext context) {
//     FirebaseAuth.instance.currentUser().then((firebaseUser){
//   if(firebaseUser == null)
//    {
//      Navigator.of(context).pushNamed('/landingpage');
//    }
//    else{
//        Navigator.of(context).pushReplacementNamed('/homepage');

//   }
// });
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
                height: 10,
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
                height: 10,
              ),
              RaisedButton(
                child: Text(
                  'Login',
                ),
                color: Colors.blueAccent,
                textColor: Colors.white,
                elevation: 8,
                onPressed: () {
                   FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                    email: _email,
                    password: _password,
                  )
                      .then((FirebaseUser user) {
                    Navigator.of(context).pushReplacementNamed('/userInfo');
                  }).catchError((e) {
                    Text(e.toString());
                    print(e);
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                  child: Text(
                    'Login With Phone',
                  ),
                  color: Colors.white,
                  textColor: Colors.red,
                  elevation: 8,
                  onPressed: () {
                   Navigator.of(context).pushReplacementNamed('/khulja');
                     
                  }),

                  SizedBox(
                height: 10,
              ),
              RaisedButton(
                  child: Text(
                    'Something Something!!',
                  ),
                  color: Colors.white,
                  textColor: Colors.red,
                  elevation: 8,
                  onPressed: () {
                   Navigator.of(context).pushReplacementNamed('/khulja');
                     
                  }),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                  child: Text(
                    'Login With Facebook',
                  ),
                  color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 8,
                  onPressed: () {
                    initiateFacebookLogin();
                    Navigator.of(context).pushReplacementNamed('/homepage');
                  }),
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
                  Navigator.of(context).pushNamed('/khulja');
                },
              ),
              
               RaisedButton(
                child: Text('Try Me'),
                color: Colors.orange,
                textColor: Colors.white,
                elevation: 8,
                onPressed: () {
                  Navigator.of(context).pushNamed('/khulja');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
