import 'package:flutter/material.dart';
import 'package:news_app_sas/model/news_data_model.dart';
import 'package:news_app_sas/view/home_screen/home_screen.dart';
import 'package:news_app_sas/widgets/news_screen.dart';
import 'package:news_app_sas/view/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    fetchapidatabreaking();
    fetchapidatasports();
    fetchapidatahealth();
    fetchapidatatechnology();
    fetchapidatacar();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );}}