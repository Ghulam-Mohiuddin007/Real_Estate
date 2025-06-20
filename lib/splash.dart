import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:project/login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.network(
          "https://tse2.mm.bing.net/th?id=OIP.qXd-0wzaUKdVtUde4fGI1wHaFj&pid=Api&P=0&h=220"),
      title: Text(
        "Property Adviser",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      showLoader: true,
      loadingText: Text("Loading..."),
      navigator: Login(),
      durationInSeconds: 5,
    );
  }
}
