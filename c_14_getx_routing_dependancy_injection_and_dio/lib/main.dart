import 'package:final_project/utils/di.dart';
import 'package:final_project/views/home_screen.dart';
import 'package:final_project/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home:  HomeScreen(),
      initialBinding: MyDI(),
      smartManagement: SmartManagement.full,
      getPages: [
        GetPage(name: '/', page: ()=> SplashScreen()),
        GetPage(name: HomeScreen.routeNmae, page: ()=> HomeScreen())
      ],

    );
  }


}


