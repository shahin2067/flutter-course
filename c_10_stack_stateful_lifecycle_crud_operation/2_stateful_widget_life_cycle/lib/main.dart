import 'package:class_10/home_screen.dart';
import 'package:class_10/widgets/my_custom_tile.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  bool isDark=false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First Project',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: isDark==false? Brightness.light : Brightness.dark, ///Ternary Operator-> condition  ? if true         :   if false
        primarySwatch: Colors.amber,
      ),
    );
  }
}
