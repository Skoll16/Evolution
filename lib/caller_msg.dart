import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
class Calller_Msg extends StatefulWidget {
  _Calller_MsgState createState() => _Calller_MsgState();
}

class _Calller_MsgState extends State<Calller_Msg> {
  File _image;
  TextEditingController _url = new TextEditingController();

  Future getImageFromFile() async{
    File img=await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
     _image=img; 
    });
  }
Future getImage() async{
File img=await ImagePicker.pickImage(source: ImageSource.camera);
setState(() {
 _image=img; 
});


}
  Future _openDialer() async {
    var url = 'tel:$_url.text';
    if (await canLaunch(url))
      launch(url);
    else
      print('pta nhi scene');
  }

  Future _opemMsg() async {
    var url = 'sms:$_url.text';
    if (await canLaunch(url))
      launch(url);
    else
      print('pta nhi scene');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _url,
              decoration: InputDecoration(hintText: 'Enter No.'),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(child: Text('Call'), onPressed: _openDialer),
            SizedBox(
              height: 10,
            ),
            RaisedButton(child: Text('Msg'), onPressed: _opemMsg),
            SizedBox(height: 20,),
            CircleAvatar(
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
                      Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: IconButton(
                      icon: Icon(
                       Icons.camera
                        
                      ),
                      onPressed: () {
                        getImage();
                      },
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.only(top: 55),
                    child: IconButton(
                      icon: Icon(
                       Icons.filter
                        
                      ),
                      onPressed: () {
                        getImageFromFile();
                      },
                    ),
                  )
            ]),

      ),
        
      
    );
  }
}
