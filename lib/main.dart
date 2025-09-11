import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/Login.dart';
import 'package:login/firebase_options.dart';
import 'package:login/home.dart';
import 'package:login/Profile.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create: (BuildContext context)=>ThemeProvider(),
       child: const MyApp()));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    var theme = Provider.of<ThemeProvider>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      theme: theme.darkmode ? ThemeData.dark() : ThemeData.light(),
      home: Splashscreen()
    );
  }
}


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

var user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {

    Future.delayed(Duration(seconds: 3),(){

      if(user != null)
        {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
        }else
          {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
          }


    });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(image:
                NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS89iW_B9z3G8cAJjyYXThkKW13mRHPaJFzaQ&s"),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}





class ThemeProvider extends ChangeNotifier
{
  bool darkmode =  true;

  update({required bool dark}) async
  {
    darkmode = dark;

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('darkmode',dark);

    notifyListeners();
  }



  reboot()  async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    darkmode = await prefs.getBool('darkmode',)!;

    notifyListeners();
  }

}