import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class phoneAuth extends StatefulWidget {
 

  _phoneAuthState createState() => _phoneAuthState();
}

class _phoneAuthState extends State<phoneAuth> {

  String phoneNo,smsCode,verificationID;

  Future<void> verifyPhone() async{
    final PhoneCodeAutoRetrievalTimeout autoRetrive=(String verId){
      this.verificationID=verId;
    };//this is basically automatically taking the opt code but we have set some of
    // the basic time if time passed the codeAutoRetrival will be called
    
    final PhoneCodeSent smsCodeSent=(String verId,[int forceCodeResend]){
      this.verificationID=verId;
         smsCodeDialog(context).then((value){
           print('SignIN');
         });
    };
   
    final PhoneVerificationCompleted verifiedSuccess=(AuthCredential credential){
      print('verified');
    };
    final PhoneVerificationFailed verifiedFail=(AuthException exception){
      print('${exception.message}');
    };
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: this.phoneNo,
      codeAutoRetrievalTimeout: autoRetrive,
      codeSent: smsCodeSent,
      timeout: const Duration(seconds:5 ),
         verificationCompleted: verifiedSuccess,
         verificationFailed: verifiedFail
    );
  }

  Future<bool> smsCodeDialog(BuildContext context){
    return showDialog(
      context: context,barrierDismissible: false,builder:(BuildContext context){
          return new AlertDialog(
            title: Text('Enter OTP'),
            content: TextField(
              onChanged: (value){
                this.smsCode=value;
              },
            ),
            contentPadding:EdgeInsets.all(10.0),
            actions: <Widget>[
              new FlatButton(
                child: Text('Done'),
                onPressed: (){
                  FirebaseAuth.instance.currentUser().then((user){
                  if(user!=null)
                  {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacementNamed('/homepage');

                  }
                  else{
                    Navigator.of(context).pop();
                    signIN();
                                      
                }
              
                   } );
                })],
          );
           
      }
    );
  }

  signIN() async{

      final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationID,
        smsCode: smsCode,
      );
    final FirebaseUser user = await FirebaseAuth.instance.signInWithCredential(credential);
      final FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
      assert(user.uid == currentUser.uid);
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed('/homepage');
    //FirebaseAuth.instance.signInWithPhoneNumber(verificationId:verificationID)
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: new AppBar(
      //   title: new Text('Convo'),
      
     body: Center(
       child: Container(
         padding: EdgeInsets.all(25),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             TextField(
               decoration: InputDecoration(hintText:'Phone No.'),
               onChanged: (value){
                 this.phoneNo=value;
               },
             ),
            
             SizedBox(height: 10.0,),
             RaisedButton(elevation: 8,
             textColor: Colors.white,
             color: Colors.orange,
             child: Text('Verify'),
             onPressed: (){
               verifyPhone();

             },)
           ],
         ),
       ),
     ),

    );
  }
}