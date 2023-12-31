import 'package:flutter/material.dart';
import 'package:news_app_sas/controller/news_controller.dart';
import 'package:news_app_sas/view/home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen(),)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Center(child: Hero(tag: 'title',child: Image.asset('assets/images/icon.png',))),
    );
  }
}
