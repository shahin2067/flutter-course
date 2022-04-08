import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());

}
class MyApp extends StatelessWidget{
  bool isDark=true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First Project',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: isDark==false? Brightness.light: Brightness.dark, ///Ternary Operator-> condition  ? if true         :   if false
        primarySwatch: Colors.amber,
      ),
    );
  }
}


class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text('Home Page'),
        // backgroundColor: Colors.red,
      ),
      body: Container(
        // color: Colors.amberAccent,
      ),
      // backgroundColor: Colors.green,
      floatingActionButton: FloatingActionButton(

        onPressed: (){
          print('Clicked');
        },
        child: const Icon(Icons.shopping_cart_outlined),

      ),


      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 0,
      //
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home)),
      //   ],
      // ),
    );

  }

}







// class App extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }
//
//
//
//
// }




//
// void myMethod(){
//
// }
//
// int myNeMethod(){
//   return 1;
// }
//
// Widget myNeMethod1(){
//
//   return Container();
// }