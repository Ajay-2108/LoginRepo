import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/home.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future<void> pqr() async
  {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: pass.text);

      Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
    }catch(e){

      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid Password")));
    }

  }

  bool con = false;

  asd(){
    email.text.isNotEmpty && pass.text.isNotEmpty ? con = false : con = true;
  }

  bool _ispasswordvisible =true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true
      ),
      body:
      Column(
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
              controller: email,
              onChanged: (i){
                setState(() {
                  asd();
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: _ispasswordvisible,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.key),
                suffixIcon: IconButton(icon:
                Icon(_ispasswordvisible? Icons.visibility : Icons.visibility_off),
                  onPressed:() {
                    setState(() {
                      _ispasswordvisible = !_ispasswordvisible;
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
              controller: pass,
              onChanged: (i){
                setState(() {
                  asd();
                });
              },
            ),
          ),
          ElevatedButton(onPressed: (){
            pqr();
          }, child: Text("Signin"))
        ],
      ),
    );
  }
}