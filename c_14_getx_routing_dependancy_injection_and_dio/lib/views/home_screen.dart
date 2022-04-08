import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_screen_controller.dart';


class HomeScreen extends StatelessWidget {

  static const routeNmae = '/home_screen';

  // final HomeScreenController _controller=HomeScreenController();

  final HomeScreenController _controller=Get.put(HomeScreenController());
  final HomeScreenController _controller2=Get.find<HomeScreenController>(); /// have some problem face


  @override
  Widget build(BuildContext context) {
    print('Build Method called');
    return  Scaffold(
      appBar: AppBar(
        title:Center(child: Obx(()=>Text('${_controller.myValue.value}'))),
      ),

      body: Obx(()=>ListView.builder(
        itemCount: _controller.postList.length,
        itemBuilder: (c, i){
          return ListTile(
            onTap: (){
              _controller.removeItem(i);
            },
            onLongPress: (){
              _controller.updateItem(i);
            },
            title: Text(_controller.postList[i].title.toString()),

          );
        },

      )),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //_controller.increment();
          Get.find<HomeScreenController>().increment();  /// dependancy injection
        },
        child: const Text('Add'),
      ),
    );
  }
}

