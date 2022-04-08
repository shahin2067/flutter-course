import 'package:flutter/material.dart';
import 'package:lecture_12_source_code/screens/login_screen.dart';

class ScreenOne extends StatelessWidget {
  static const String routeName='/screen_one';

  var myTitle='Screen one';


  @override
  Widget build(BuildContext context) {

    var myPassedData=ModalRoute.of(context)?.settings.arguments as Map;
    myTitle=myPassedData['title'];
    
    // var myReceivedData=ModalRoute.of(context)?.settings.arguments as Map;
    //  myTitle=myReceivedData['title'];

    return Scaffold(
      appBar: AppBar(
        title:  Text(myTitle),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, LoginScreen.routeName);
          }, icon: const Icon(Icons.arrow_forward_ios))
        ],
      ),


      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text(myPassedData['username']),
          Text(myPassedData['userid']),
          Center(child: RaisedButton(onPressed: (){

            Navigator.pop(context);

          }, child: const Text('Back'),)),
        ],
      ),

    );
  }
}



