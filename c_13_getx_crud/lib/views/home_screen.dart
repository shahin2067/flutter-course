import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_screen_controller.dart';


class HomeScreen extends StatelessWidget {


  // final HomeScreenController _controller=HomeScreenController();

  final HomeScreenController _controller=Get.put(HomeScreenController());


  @override
  Widget build(BuildContext context) {
    print('Build Method called');
    return  Scaffold(
      appBar: AppBar(
        title:Center(child: Obx(()=>Text('${_controller.myValue.value}'))),
      ),

      body: Obx(()=>ListView.builder(
        itemCount: _controller.myUserList.length,
        itemBuilder: (c, i){
          return ListTile(
            onTap: (){
              _controller.removeItem(i);
            },
            onLongPress: (){
              _controller.updateItem(i);
            },
            title: Text(_controller.myUserList[i]),

          );
        },

      )),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.increment();
        },
        child: const Text('Add'),
      ),
    );
  }
}

