import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() {
    print('createState Method Called');
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  var title = '';
  var scroll = ScrollController();

  @override
  void initState() {
    title = 'Home Page';
    print('initState Method Called');
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Build Method Called');

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
              onPressed: (){
                setState(() {
                  print('setState Method Called');
                  title = 'Home Screen';
                });
              },
              icon: Icon(Icons.add)
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    print('dispose method called');
    title = '';
    scroll.removeListener(() { });
    // TODO: implement dispose
    super.dispose();
  }
}
