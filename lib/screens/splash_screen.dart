import "package:flutter/material.dart";
import "package:projectuts/screens/login_page.dart";
import "package:lottie/lottie.dart";
import "dart:async";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: ((context) => const MyLogin())));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: Tween(begin: 1.0, end: 1.5).animate(CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOut,
          )),
          child: Lottie.asset(
            "images/logo_video.json",
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
