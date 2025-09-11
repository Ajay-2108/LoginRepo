import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login/signin.dart';

import 'home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();


  final GoogleSignIn  googleSignIn = GoogleSignIn(
    clientId:
    "63664431109-a70a9c71r9a573h2kk354pih0gck8phb.apps.googleusercontent.com",
  );

  Future<User?> signInWithGoogle(BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential;
      if (kIsWeb) {
        var googleProvider = GoogleAuthProvider();
        userCredential = await _auth.signInWithPopup(googleProvider);
      } else {
        GoogleSignInAccount googleUser = (await GoogleSignIn().signIn())!;
        final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
        final googleAuthCredential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        userCredential = await _auth.signInWithCredential(googleAuthCredential);
      }
      final user = userCredential.user;
      if (user != null) {

        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context)=>home()),(route)
        {
          return false;
        });

      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> abc() async
  {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: mail.text,
          password: password.text);

      Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
    }catch(e){

      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid Password")));
    }

  }

  bool con = false;

  qwe(){
    mail.text.isNotEmpty && password.text.isNotEmpty ? con = false : con = true;
  }

  bool _isVisible =true;

  Future<void> pro()async
  {
   try{
     await FirebaseAuth.instance.signInWithEmailAndPassword(
         email: mail.text,
         password: password.text);

     Navigator.push(context, MaterialPageRoute(
         builder:(context)=> home()));
   }catch(e)
    {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
                label: Text("Enter Mail ID"),
              ),
              validator: (i){
                if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(i!))
                {
                  return'Please enter the valid Email ID';
                }
                return null;
              },
              controller: mail,
              onChanged: (i){
                setState(() {
                  qwe();
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: _isVisible,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.key),
                suffixIcon: IconButton(icon:
                Icon(_isVisible? Icons.visibility : Icons.visibility_off),
                  onPressed:() {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                  },),
                border: OutlineInputBorder(),
                label: Text("Enter Password"),
              ),
              validator: (i){
                if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$').hasMatch(i!))
                {
                  return 'Please enter valid Password';
                }
                return null;
              },
              controller: password,
              onChanged: (i){
                setState(() {
                  qwe();
                });
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: (){
              pro();
            }, child: Text("Login"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> signup()));
            }, child: Text("Signup"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  signInWithGoogle(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Sign in with  "),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("https://cdn2.hubspot.net/hubfs/53/image8-2.jpg"),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
