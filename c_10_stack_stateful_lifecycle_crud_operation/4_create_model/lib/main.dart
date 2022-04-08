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


// class HomeScreen extends StatefulWidget{
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   List<String> userList=['Home', 'Category', 'Favorite'];
//
//   var headerTitle = 'Home Screen';
//
//   @override
//   Widget build(BuildContext context) {
//     print('Build method called');
//
//     return Scaffold(
//       drawer:  _myDrawer(context),
//       appBar: _myAppBar(context),
//       body: _body(context),
//       floatingActionButton:_floatingActinButton(context),
//     );
//   }
//
//   _myAppBar(BuildContext context) {
//     return AppBar(
//       title: Text(headerTitle),
//       elevation: 10.0,
//       actions: [
//         IconButton(
//             onPressed: (){
//               print('Before Changed: $headerTitle');
//
//               setState(() {
//                 headerTitle = 'Dashboard';
//               });
//               print('After Changed: $headerTitle');
//               Fluttertoast.showToast(msg: 'Screen Name Changed');
//             },
//
//             icon: const Icon(Icons.search_outlined)
//
//         ),
//         IconButton(
//             onPressed: (){
//               print('IconButton Clicked');
//               Fluttertoast.showToast(msg: 'Shopping Cart clicked');
//             },
//
//             icon: const Icon(Icons.shopping_cart_outlined)
//
//         ),
//         IconButton(
//             onPressed: (){
//               Fluttertoast.showToast(msg: 'User Icon clicked');
//             },
//
//             icon: const Icon(Icons.person_outlined)
//
//         ),
//       ],
//     );
//   }
//
//
//
//   Widget _myDrawer(BuildContext context) {
//
//     return Drawer(
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             const UserAccountsDrawerHeader(
//
//               accountName: Text('Gias Uddin Samir'),
//               accountEmail: Text('giasuddin2548@gmail.com'),
//               currentAccountPicture: CircleAvatar(
//                 child: Icon(Icons.person),
//               ),
//             ),
//             MyCustomTile(title: userList[0], icon:  Icons.person, onClickEvent: (){
//               Navigator.pop(context);
//             }),
//             MyCustomTile(title: userList[2], icon:  null, onClickEvent: (){
//               Navigator.pop(context);
//               Fluttertoast.showToast(msg: userList[1]);
//             },
//               subTitle: '30 min ago',
//               trailing: '10',
//             ),
//             MyCustomTile(title: userList[1], icon:  null, onClickEvent: (){
//               Navigator.pop(context);
//               Fluttertoast.showToast(msg: userList[1]);
//             },
//               subTitle: '30 min ago',
//               trailing: '10',
//             ),
//             MyCustomTile(title: userList[1], icon:  null, onClickEvent: (){
//               Navigator.pop(context);
//               Fluttertoast.showToast(msg: userList[1]);
//             },
//               subTitle: '30 min ago',
//               trailing: '10',
//             ),
//             MyCustomTile(title: userList[1], icon:  null, onClickEvent: (){
//               Navigator.pop(context);
//               Fluttertoast.showToast(msg: userList[1]);
//             },
//               subTitle: '30 min ago',
//               trailing: '10',
//             ),
//             MyCustomTile(title: userList[1], icon:  null, onClickEvent: (){
//               Navigator.pop(context);
//               Fluttertoast.showToast(msg: userList[1]);
//             },
//               subTitle: '30 min ago',
//               trailing: '10',
//             ),
//             MyCustomTile(title: userList[1], icon:  null, onClickEvent: (){
//               Navigator.pop(context);
//               Fluttertoast.showToast(msg: userList[1]);
//             },
//               subTitle: '30 min ago',
//               trailing: '10',
//             ),
//             MyCustomTile(title: userList[1], icon:  null, onClickEvent: (){
//               Navigator.pop(context);
//               Fluttertoast.showToast(msg: userList[1]);
//             },
//               subTitle: '30 min ago',
//               trailing: '10',
//             ),
//             MyCustomTile(title: userList[1], icon:  null, onClickEvent: (){
//               Navigator.pop(context);
//               Fluttertoast.showToast(msg: userList[1]);
//             },
//               subTitle: '30 min ago',
//               trailing: '10',
//             ),
//             MyCustomTile(title: userList[1], icon:  null, onClickEvent: (){
//               Navigator.pop(context);
//               Fluttertoast.showToast(msg: userList[1]);
//             },
//               subTitle: '30 min ago',
//               trailing: '10',
//             ),
//             MyCustomTile(title: userList[1], icon:  null, onClickEvent: (){
//               Navigator.pop(context);
//               Fluttertoast.showToast(msg: userList[1]);
//             },
//               subTitle: '30 min ago',
//               trailing: '10',
//             ),
//             MyCustomTile(title: userList[1], icon:  null, onClickEvent: (){
//               Navigator.pop(context);
//               Fluttertoast.showToast(msg: userList[1]);
//             },
//               subTitle: '30 min ago',
//               trailing: '10',
//             ),
//             MyCustomTile(title: userList[1], icon:  null, onClickEvent: (){
//               Navigator.pop(context);
//               Fluttertoast.showToast(msg: userList[1]);
//             },
//               subTitle: '30 min ago',
//               trailing: '10',
//             ),
//             MyCustomTile(title: userList[1], icon:  null, onClickEvent: (){
//               Navigator.pop(context);
//               Fluttertoast.showToast(msg: userList[1]);
//             },
//               subTitle: '30 min ago',
//               trailing: '10',
//             ),
//           ],
//         ),
//       ),
//
//
//       // child: ListView(
//       //   children: [
//       //     const UserAccountsDrawerHeader(
//       //
//       //       accountName: Text('Gias Uddin Samir'),
//       //       accountEmail: Text('giasuddin2548@gmail.com'),
//       //       currentAccountPicture: CircleAvatar(
//       //         child: Icon(Icons.person),
//       //       ),
//       //     ),
//       //     MyCustomTile(title: userList[0], icon:  Icons.person, onClickEvent: (){
//       //       Navigator.pop(context);
//       //     }),
//       //     MyCustomTile(title: userList[1], icon:  null, onClickEvent: (){
//       //       Navigator.pop(context);
//       //       Fluttertoast.showToast(msg: userList[1]);
//       //     },
//       //       subTitle: '30 min ago',
//       //       trailing: '10',
//       //     ),
//       //
//       //
//       //   ],
//       // ),
//     );
//   }
//
//   _floatingActinButton(BuildContext context) {
//     return  FloatingActionButton(
//
//       onPressed: (){
//         print('Clicked');
//       },
//       child: const Icon(Icons.shopping_cart_outlined),
//
//     );
//   }
//
//   // Widget _body(BuildContext context) {
//  _body(BuildContext context) {
//
//   }
// }