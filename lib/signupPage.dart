import 'package:dummyauth/services/usermanagement.dart';
import 'package:flutter/material.dart';
//import 'package:google_sign_in/google_sign_in.dart';
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
  //keytool -list -v -keystore "C:\Users\PLAYBOY\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android

  //    );

  // }
 //C:\Program Files\Java\jdk-10.0.2\bin

  /*
Microsoft Windows [Version 6.3.9600]
(c) 2013 Microsoft Corporation. All rights reserved.

C:\Users\PLAYBOY>keytool -list -v -keystore "C:\Users\PLAYBOY\.android\debug.key
store" -alias androiddebugkey -storepass android -keypass android
Alias name: androiddebugkey
Creation date: Aug 31, 2018
Entry type: PrivateKeyEntry
Certificate chain length: 1
Certificate[1]:
Owner: C=US, O=Android, CN=Android Debug
Issuer: C=US, O=Android, CN=Android Debug
Serial number: 1
Valid from: Fri Aug 31 19:34:26 IST 2018 until: Sun Aug 23 19:34:26 IST 2048
Certificate fingerprints:
         SHA1: D9:36:CE:5C:8A:1C:63:5E:40:10:C1:62:7C:4E:C3:DE:1C:50:44:34
         SHA256: 33:11:DF:B4:BD:53:91:BB:E9:8F:4F:7C:55:60:11:91:8C:FA:48:21:9B:
08:B8:6B:78:69:A9:E1:8F:B4:1E:E5
Signature algorithm name: SHA1withRSA
Subject Public Key Algorithm: 1024-bit RSA key
Version: 1


      
      
keytool -exportcert -alias androiddebugkey -keystore "C:\Users\PLAYBOY\.android\debug.keystore" | "D9:36:CE:5C:8A:1C:63:5E:40:10:C1:62:7C:4E:C3:DE:1C:50:44:34" sha1 -binary | "C:\Program Files\Java\jdk-10.0.2\bin" base64
      

Warning:
The JKS keystore uses a proprietary format. It is recommended to migrate to PKCS
12 which is an industry standard format using "keytool -importkeystore -srckeyst
ore C:\Users\PLAYBOY\.android\debug.keystore -destkeystore C:\Users\PLAYBOY\.and
roid\debug.keystore -deststoretype pkcs12".

C:\Users\PLAYBOY>


      
keytool -exportcert -alias androiddebugkey -keystore "C:\Users\PLAYBOY\.android\debug.keystore" | "C:\openssl\bin" sha1 -binary | "C:\openssl\bin" base64
      
Microsoft Windows [Version 6.3.9600]
(c) 2013 Microsoft Corporation. All rights reserved.

C:\Users\PLAYBOY>keytool -list -v -keystore "C:\Users\PLAYBOY\.android\debug.key
store" -alias androiddebugkey -storepass android -keypass android
Alias name: androiddebugkey
Creation date: Aug 31, 2018
Entry type: PrivateKeyEntry
Certificate chain length: 1
Certificate[1]:
Owner: C=US, O=Android, CN=Android Debug
Issuer: C=US, O=Android, CN=Android Debug
Serial number: 1
Valid from: Fri Aug 31 19:34:26 IST 2018 until: Sun Aug 23 19:34:26 IST 2048
Certificate fingerprints:
         SHA1: D9:36:CE:5C:8A:1C:63:5E:40:10:C1:62:7C:4E:C3:DE:1C:50:44:34
         SHA256: 33:11:DF:B4:BD:53:91:BB:E9:8F:4F:7C:55:60:11:91:8C:FA:48:21:9B:
08:B8:6B:78:69:A9:E1:8F:B4:1E:E5
Signature algorithm name: SHA1withRSA
Subject Public Key Algorithm: 1024-bit RSA key
Version: 1

Warning:
The JKS keystore uses a proprietary format. It is recommended to migrate to PKCS
12 which is an industry standard format using "keytool -importkeystore -srckeyst
ore C:\Users\PLAYBOY\.android\debug.keystore -destkeystore C:\Users\PLAYBOY\.and
roid\debug.keystore -deststoretype pkcs12".

C:\Users\PLAYBOY>clear
'clear' is not recognized as an internal or external command,
operable program or batch file.

C:\Users\PLAYBOY>clear
'clear' is not recognized as an internal or external command,
operable program or batch file.

C:\Users\PLAYBOY>keytool -exportcert -alias androiddebugkey -keystore "C:\Users\
PLAYBOY\.android\debug.keystore" | "PATH_TO_OPENSSL_LIBRARY\bin\openssl" sha1 -b
inary | "PATH_TO_OPENSSL_LIBRARY\bin\openssl" base64
The system cannot find the path specified.

C:\Users\PLAYBOY>keytool -exportcert -alias androiddebugkey -keystore "C:\Users\
PLAYBOY\.android\debug.keystore" | "D9:36:CE:5C:8A:1C:63:5E:40:10:C1:62:7C:4E:C3
:DE:1C:50:44:34" sha1 -binary | "C:\Program Files\Java\jdk-10.0.2\bin" base64
The filename, directory name, or volume label syntax is incorrect.

C:\Users\PLAYBOY>
C:\Users\PLAYBOY>keytool -exportcert -alias androiddebugkey -keystore "C:\Users\
PLAYBOY\.android\debug.keystore" | "PATH_TO_OPENSSL_LIBRARY\bin\openssl" sha1 -b
inary | "PATH_TO_OPENSSL_LIBRARY\bin\openssl" base64
The system cannot find the path specified.

C:\Users\PLAYBOY>clean
'clean' is not recognized as an internal or external command,
operable program or batch file.

C:\Users\PLAYBOY>keytool -list -v -keystore "C:\Users\PLAYBOY\.android\debug.key
store" -alias androiddebugkey -storepass android -keypass android
Alias name: androiddebugkey
Creation date: Aug 31, 2018
Entry type: PrivateKeyEntry
Certificate chain length: 1
Certificate[1]:
Owner: C=US, O=Android, CN=Android Debug
Issuer: C=US, O=Android, CN=Android Debug
Serial number: 1
Valid from: Fri Aug 31 19:34:26 IST 2018 until: Sun Aug 23 19:34:26 IST 2048
Certificate fingerprints:
         SHA1: D9:36:CE:5C:8A:1C:63:5E:40:10:C1:62:7C:4E:C3:DE:1C:50:44:34
         SHA256: 33:11:DF:B4:BD:53:91:BB:E9:8F:4F:7C:55:60:11:91:8C:FA:48:21:9B:
08:B8:6B:78:69:A9:E1:8F:B4:1E:E5
Signature algorithm name: SHA1withRSA
Subject Public Key Algorithm: 1024-bit RSA key
Version: 1

Warning:
The JKS keystore uses a proprietary format. It is recommended to migrate to PKCS
12 which is an industry standard format using "keytool -importkeystore -srckeyst
ore C:\Users\PLAYBOY\.android\debug.keystore -destkeystore C:\Users\PLAYBOY\.and
roid\debug.keystore -deststoretype pkcs12".

C:\Users\PLAYBOY>keytool -list -v -keystore "C:\Users\PLAYBOY\.android\debug.key
store" -alias androiddebugkey -storepass android -keypass android
Alias name: androiddebugkey
Creation date: Aug 31, 2018
Entry type: PrivateKeyEntry
Certificate chain length: 1
Certificate[1]:
Owner: C=US, O=Android, CN=Android Debug
Issuer: C=US, O=Android, CN=Android Debug
Serial number: 1
Valid from: Fri Aug 31 19:34:26 IST 2018 until: Sun Aug 23 19:34:26 IST 2048
Certificate fingerprints:
         SHA1: D9:36:CE:5C:8A:1C:63:5E:40:10:C1:62:7C:4E:C3:DE:1C:50:44:34
         SHA256: 33:11:DF:B4:BD:53:91:BB:E9:8F:4F:7C:55:60:11:91:8C:FA:48:21:9B:
08:B8:6B:78:69:A9:E1:8F:B4:1E:E5
Signature algorithm name: SHA1withRSA
Subject Public Key Algorithm: 1024-bit RSA key
Version: 1

Warning:
The JKS keystore uses a proprietary format. It is recommended to migrate to PKCS
12 which is an industry standard format using "keytool -importkeystore -srckeyst
ore C:\Users\PLAYBOY\.android\debug.keystore -destkeystore C:\Users\PLAYBOY\.and
roid\debug.keystore -deststoretype pkcs12".
Microsoft Windows [Version 6.3.9600]
(c) 2013 Microsoft Corporation. All rights reserved.

C:\Windows\system32>cd C:\Program Files\Java\jdk-10.0.2\bin

C:\Program Files\Java\jdk-10.0.2\bin>keytool -exportcert -alias androiddebugkey
-keystore "C:\Users\PLAYBOY\.android\debug.keystore" | "D9:36:CE:5C:8A:1C:63:5E:
40:10:C1:62:7C:4E:C3:DE:1C:50:44:34" sha1 -binary | "C:\Program Files\Java\jdk-1
0.0.2\bin" base64
The filename, directory name, or volume label syntax is incorrect.

C:\Program Files\Java\jdk-10.0.2\bin>keytool -exportcert -alias androiddebugkey
-keystore "C:\Users\PLAYBOY\.android\debug.keystore" | "C:\openssl\bin" sha1 -bi
nary | "C:\openssl\bin" base64
'"C:\openssl\bin"' is not recognized as an internal or external command,
operable program or batch file.

C:\Program Files\Java\jdk-10.0.2\bin>keytool -exportcert -alias androiddebugkey
-keystore "C:\Users\PLAYBOY\.android\debug.keystore" | "C:\openssl\bin\openssl.e
xe" sha1 -binary | "C:\openssl\bin\openssl.exe" base64
Enter keystore password:  android
s0/1XcV1vzLMbWtGbyxeeUAAvY0=

Warning:
The JKS keystore uses a proprietary format. It is recommended to migrate to PKCS
12 which is an industry standard format using "keytool -importkeystore -srckeyst
ore C:\Users\PLAYBOY\.android\debug.keystore -destkeystore C:\Users\PLAYBOY\.and
roid\debug.keystore -deststoretype pkcs12".

C:\Program Files\Java\jdk-10.0.2\bin>
  */
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

                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                 email:_email,
                 password: _password, 
                  ).then((signedInUser) {
                    UserManagement().storeNewUser(signedInUser ,context);
                    Navigator.of(context).pushReplacementNamed('/homepage');

                  }).catchError((e){
                    Text(e.toString());
                    print(e);
                  });
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