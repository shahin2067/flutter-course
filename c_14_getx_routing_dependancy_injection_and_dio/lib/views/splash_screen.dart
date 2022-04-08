import 'package:final_project/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    goHomeScreen(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Splash Screen'),
        actions: [
          IconButton(onPressed: (){


            // Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            // Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);



          }, icon: Icon(Icons.arrow_forward)),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children:  [

          Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child: Image.asset('assets/icons/fb.png'),

            ),
          ),
          Container(
            height: 10,
          ),
          const Center(
            child: SizedBox(
              height: 40,
              width: 40,
              child: CircularProgressIndicator(),
            ),
          )

        ],
      ),

    );
  }

  void goHomeScreen(BuildContext context)  async{

    // Navigator.pushReplacementNamed(context, '/home_screen');
    // Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    await Future.delayed(Duration(seconds: 2));
    //Get.toNamed(HomeScreen.routeNmae);

    //Get.offAll(HomeScreen.routeNmae);
    Get.offNamedUntil(HomeScreen.routeNmae, (route) => false);
  }




// Future<void> gotoHomeScreen(BuildContext context) async{
//
//   await Future.delayed(const Duration(seconds: 5));
//
//   // Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false, arguments: {
//   //   'title':'Second Screen',
//   //   'username':'Gias Uddin Samir',
//   //   'userid':'110',
//   // });
//
//   Navigator.pushReplacementNamed(context, HomeScreen.routeName, arguments: {
//     'title':'Second Screen',
//     'username':'Gias Uddin Samir',
//     'userid':'110',
//   }
//   );
//
// }


}