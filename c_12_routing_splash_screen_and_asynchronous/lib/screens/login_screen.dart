import 'package:flutter/material.dart';
import 'package:lecture_12_source_code/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName='/login_screen';

  var myTitle='';


  @override
  Widget build(BuildContext context) {
    
    // var myReceivedData=ModalRoute.of(context)?.settings.arguments as Map;
    //  myTitle=myReceivedData['title'];

    return Scaffold(
      appBar: AppBar(
        title:  Text('Login Screen'),
        actions: [
          IconButton(onPressed: (){

          }, icon: const Icon(Icons.arrow_forward_ios))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          // Text(myReceivedData['username']),
          // Text(myReceivedData['userid']),
          Center(child: RaisedButton(onPressed: (){

            Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => true, arguments: {});

          }, child: const Text('Login'),)),
        ],
      ),

    );
  }
}



