import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart'; //get unique names of files name

class userInfo extends StatefulWidget {
  _userInfoState createState() => _userInfoState();
}

class _userInfoState extends State<userInfo> {
  File _image;
  String _downloadUrl;
  String _name,_about;
  FirebaseDatabase database=FirebaseDatabase.instance;
  @override
  Widget build(BuildContext context) {
    Future uploadPic(BuildContext context) async{

    String fileName=basename(_image.path);
    StorageReference mRef=FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask=mRef.putFile(_image);
    //StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete.then((value){
   
    String add= mRef.getDownloadURL().toString();
   setState(() {
    _downloadUrl=add; 
   });
    setState(() {
     Scaffold.of(context).showSnackBar(SnackBar(content:Text('Profile Image Updated Successfully!!'))
     
     );
       
      });


    }
    
    Future getImage() async{
      var userImage =await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
       _image=userImage; 
      });
    }
    
    return Scaffold(
      appBar: AppBar(title: Text('User Info')),
      body: Builder(
        builder: (context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.blueGrey,
                      child: ClipOval(
                        child: SizedBox(
                          height: 200,
                          width: 200,
                          child:(_image!=null)?Image.file(_image,fit:BoxFit.fill):
                          
                          Image.network(
                            "https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.camera,
                        size: 30,
                      ),
                      onPressed: () {
                        getImage();
                      },
                    ),
                  )
                ],
              ),

              SizedBox(height: 25,),
              Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 TextField(decoration: InputDecoration(hintText: 'Name'),
                  onChanged: (value){
                   setState(() {
                    _name=value; 
                   });
                 },),
                 SizedBox(height: 20,),
                 TextField(
                   decoration: InputDecoration(
                     hintText:'About'
                   ),
                   onChanged: (value){
                     setState(() {
                      _about=value; 
                     });
                   },
                 )
               ],
   
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.lightBlue,
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    elevation: 7,
                    splashColor: Colors.blue,
                    child: Text('Cancel',
                    style: TextStyle(color: Colors.white,fontSize: 16),),
                  ),
                  //SizedBox(width: 170,),
                  RaisedButton(
                    color: Colors.lightBlue,
                    onPressed: (){
                      uploadPic(context);
                    },
                    elevation: 7,
                    splashColor: Colors.blue,
                    child: Text('Submit',
                    style: TextStyle(color: Colors.white,fontSize: 16),),

                  )
                ],
              ),

              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Next'),
                    onPressed: (){
                        Navigator.of(context).pushReplacementNamed('/homepage');
                    },
                  )
                ],
              )
            
            ],
          ),
        ),
      ),
    );
  }
}
