import 'package:flutter/material.dart';
import 'package:lecture_12_source_code/screens/screen_one.dart';
class HomeScreen extends StatelessWidget {
  static const String routeName='/home_screen';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          // Text(myReceivedData['username']),
          // Text(myReceivedData['userid']),
          Center(child: RaisedButton(onPressed: (){

            Navigator.pushNamed(context, ScreenOne.routeName, arguments:{
              'title':'Second Screen',
              'username':'Gias Uddin Samir',
              'userid':'110',
            } );

          }, child: const Text('Screen One'),)),
        ],
      ),
    );
  }
}



