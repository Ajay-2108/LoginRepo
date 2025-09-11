import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login/home.dart';


class File1 extends StatefulWidget {
  const File1({super.key});

  @override
  State<File1> createState() => _File1State();
}


class _File1State extends State<File1> {


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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: ElevatedButton(onPressed: (){
              signInWithGoogle(context);
            }, child: Text("signin with google"),
            ),
          ),
        ],
      ),
    );
  }
}
