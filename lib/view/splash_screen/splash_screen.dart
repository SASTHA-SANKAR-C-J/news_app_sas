import 'package:flutter/material.dart';
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
    Future.delayed(Duration(seconds: 3)).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFF8775fc),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Text('N',style: TextStyle(color: Colors.white,fontSize: 80,fontWeight: FontWeight.bold),),
        Text('e',style: TextStyle(color: Colors.white,fontSize: 80,fontWeight: FontWeight.bold),),
        Text('w',style: TextStyle(color: Colors.white,fontSize: 80,fontWeight: FontWeight.bold),),
        Text('s',style: TextStyle(color: Colors.white,fontSize: 80,fontWeight: FontWeight.bold),),
        Text('y',style: TextStyle(color: Colors.white,fontSize: 80,fontWeight: FontWeight.bold),),
      ],)),
    );
  }
}
