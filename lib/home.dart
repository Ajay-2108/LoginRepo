import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/File6.dart';
import 'package:login/Profile.dart';
import 'package:login/Spotify.dart';
import 'package:login/Zomato.dart';
import 'package:login/home.dart';


class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  int _index = 0;

  final page = [
    File6(),
    Spotify(),
    Profile(),
  ];

  var name = FirebaseAuth.instance.currentUser;

  void tap (index){
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:page[_index],
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.cyan,),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.music_video_rounded),label: "Music"),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
      ],
        currentIndex: _index,
        onTap: tap,
      ),
    );
  }
}

