import 'package:flutter/material.dart';
import 'package:lecture_12_source_code/screens/home_screen.dart';
import 'package:lecture_12_source_code/screens/login_screen.dart';
import 'package:lecture_12_source_code/screens/screen_one.dart';
import 'package:lecture_12_source_code/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Route Management',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),



      initialRoute: '/',

      routes: {
        '/':(context)=> SplashScreen(),
        // '/home_screen':(context)=>HomeScreen(),
        HomeScreen.routeName:(context)=>HomeScreen(),
        ScreenOne.routeName:(context)=>ScreenOne(),
        // LoginScreen.routeName:(context)=>LoginScreen(),
      },
    );
  }
}


