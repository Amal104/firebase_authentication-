import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

import 'HomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   @override
 void initState() {
 super.initState();
 Timer(
    Duration(milliseconds: 5005),
    () => Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return HomePage();
            }
            else{
              return LoginPage();
            }
          }
        ))));
}
  @override
  Widget build(BuildContext context) {
   return Scaffold(
        backgroundColor: Color.fromARGB(255, 245, 165, 35),
        body: Center(
          child: Container(
            height: 300,
            width: 300,
            child: Lottie.network(
                  'https://assets8.lottiefiles.com/packages/lf20_x2oi05is.json'),
          ),
        ),
    );
  }
}