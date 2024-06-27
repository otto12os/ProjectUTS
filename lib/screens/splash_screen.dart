import "package:flutter/material.dart";
import "package:projectuts/screens/login_page.dart";
import "package:lottie/lottie.dart";
import "package:get/get.dart";
import "dart:async";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: ((context) => const MyLogin())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("images/logo_video.json", height: 50),
      ),
    );
  }
}
