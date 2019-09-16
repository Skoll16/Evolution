import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class TryThis extends StatefulWidget {
  TryThis({Key key}) : super(key: key);

  _TryThisState createState() => _TryThisState();
}

class _TryThisState extends State<TryThis> {
  int _loginType=0;
 String loginType;

 void _handleLoginType(int value){
   setState(() {
    _loginType=value;
    switch(_loginType){
      case 1:
      loginType='User';
      break;
      case 2:
      loginType='Mentor';
      break;
      case 3:
      loginType='Admin';

    } 
   });
 }

   checkLogin(){
    StreamBuilder(
      stream: Firestore.instance.collection(loginType).document(_phoneNumber).snapshots(),
      builder: (context,snapshot){
        if(!snapshot.hasData) return Text('hi');
        return Column(children: <Widget>[
          
           Text(snapshot.data.documnets[0]['email'])
                   ],);
        //{
        //   print('Use correct details');
        // }
        // else
        // {
        //   if(_email==snapshot.data.documents[0]['email'].toString())
        //   {
        //     Navigator.of(context).pushNamed('/homepage');
        //   }
        // }
      },
    );
   }

  createAccount(){
    DocumentReference dRef=Firestore.instance.collection(loginType).document(_phoneNumber);
    Map<String,dynamic> tasks=<String,dynamic>{
    
    "email":_email,
    "password":_password,
    "phoneNumber":_phoneNumber,
    
    
    };
    dRef.setData(tasks).whenComplete((){
      //Text('Sign Up Successfully');
     // Navigator.of(context).popAndPushNamed('/homepage');
      print('SignUp Done');
    }).catchError((e)=>print(e));
  //  Firestore.instance.collection('/Account').add({
  //    'email':_email,
  //    'password':_password


  //  }
     
  //  ).then((value){
  //    Navigator.of(context).popAndPushNamed('/homepage');
  //  }).catchError((e)=>print(e));
  
    // Map<String,String> data={
    // 'email':_email,
    // 'password':_password
  
    // };
    // dRef.setData(data).whenComplete((){
    //   print('completed storing data');
    // }

  // ).catchError((e)=>print(e));
   }
  String _email,_password,_phoneNumber;
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
                decoration: InputDecoration(hintText: 'Phone NUmber'),
                onChanged: (value) {
                  setState(() {
                    _phoneNumber = value;
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
                child: Text('login'),
                onPressed: (){
                  checkLogin();
                },
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text('SignUp'),
                onPressed: (){
                  createAccount();
                },
              ),
               SizedBox(height: 20,),
                Center(
                  child: Text('Select Login/SignUp Type:',
                style: 
                TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: <Widget>[
                     Radio(
                       value:1,
                       groupValue: _loginType,
                       onChanged: _handleLoginType,
                       activeColor: Colors.blue,
                     ),
                     Text('Users',
                     style:TextStyle(fontSize:16))
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: <Widget>[
                     Radio(
                       value:2,
                       groupValue: _loginType,
                       onChanged: _handleLoginType,
                       activeColor: Colors.blue,
                     ),
                     Text('Mentor',
                     style:TextStyle(fontSize:16))
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: <Widget>[
                     Radio(
                       value:3,
                       groupValue: _loginType,
                       onChanged: _handleLoginType,
                       activeColor: Colors.blue,
                     ),
                     Text('Admin',
                     style:TextStyle(fontSize:16))]
                   
                 ),
              
              
               ],
          ),
            ]),
      ),


    ));
  }
}