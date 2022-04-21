
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_screen_controller.dart';


class HomeScreen extends StatelessWidget {
  static const routeName='/home_screen';

  // final HomeScreenController _controller=HomeScreenController();

  final HomeScreenController _controller=Get.put(HomeScreenController());

 // final HomeScreenController _controller2=Get.find<HomeScreenController>();


  @override
  Widget build(BuildContext context) {
    _controller.getPaginationData(pageNo: 1);
    return  Scaffold(
      appBar: AppBar(
        title:Center(child: Obx(()=>Text('${_controller.myValue.value}'))),
      ),
      body: Obx(()=>ListView.builder(
        itemCount: _controller.picSumDataList.length,
        itemBuilder: (c, i){
          return ListTile(
            onTap: (){
              _controller.removeItem(i);
            },
            onLongPress: (){
              _controller.updateItem(i);
            },
            title: Text(_controller.picSumDataList[i].author.toString()),

          );
        },

      )),
      bottomSheet: Container(
        height: 60,
        color: Colors.white,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (c, i)=>  InkWell(
              onTap: (){
                _controller.getPaginationData(pageNo: i+1);
                print(i+1);
              },

              child: Chip(
                  label: Text(' ${i+1} ')),
            ),
        
        ),
      ),
    );
  }
}

