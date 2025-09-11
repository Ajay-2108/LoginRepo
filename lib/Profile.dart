import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  int run = 0;


  load() async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();


    run = await prefs.getInt('counter',)!;


    setState(() {

    });
  }


  @override
  void initState() {
    load();
    super.initState();
  }


  File? imageFile;

  selectFile() async {
    XFile? file = await ImagePicker().pickImage(
        source: ImageSource.gallery);

    if (file != null) {
      setState(() {
        imageFile = File(file.path);
      });
    }
  }

  image() async {
    XFile? file = await ImagePicker().pickImage(
        source: ImageSource.camera);

    if (file != null) {
      setState(() {
        imageFile = File(file.path);
      });
    }
  }

  late var select = ElevatedButton(
      onPressed: selectFile, child: Text("Select a file"));

  late var camera = ElevatedButton(onPressed: image, child: Text("Camera"));


  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Theme"),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Switch(
                  value: theme.darkmode,
                  onChanged: (value) => theme.update(dark: value),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) =>
                    AlertDialog(
                      title: Text("Choose Image Source"),
                      actions: [
                        TextButton(
                            onPressed: selectFile, child: Text("Gallery")),
                        TextButton(onPressed: image, child: Text("Camera")),
                      ],
                    ),
              );
            },
            child: Text("Pick Image"),
          ),
          imageFile != null
              ? Image.file(
                imageFile!,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              )
              : Text("No Image Selected"),
          ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Splashscreen()),
              );
            },
            child: Text("Logout"),
          ),
        ],
      ),
    );
  }
}
