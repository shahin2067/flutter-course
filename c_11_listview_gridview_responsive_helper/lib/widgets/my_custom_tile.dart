import 'package:flutter/material.dart';

class MyCustomTile extends StatelessWidget {
  //'Samir'
  String title;
  String? subTitle;
  String? imageUrl;
  String? trailing;
  VoidCallback onClickEvent;
  VoidCallback longPress;


  MyCustomTile({required this.title, this.subTitle,  this.imageUrl, this.trailing, required this.onClickEvent, required this.longPress});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPress,
      onTap: onClickEvent,
      title: Text(title),
      leading: ClipOval(

        child: CircleAvatar(
          child: imageUrl==null?Text(title[0]): Image.network(imageUrl!),
        ),
      ),
      trailing:  Text(trailing??''),
      subtitle: Text(subTitle??''),
    );
  }


}


