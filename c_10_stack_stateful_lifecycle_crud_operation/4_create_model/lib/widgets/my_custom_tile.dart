import 'package:flutter/material.dart';

class MyCustomTile extends StatelessWidget {
  String title;
  String? subTitle;
  String? imageUrl;
  String? trailing;
  VoidCallback onClickEvent;
  VoidCallback longPress;

  MyCustomTile({
    required this.title,
    this.subTitle,
    this.imageUrl,
    this.trailing,
    required this.onClickEvent,
    required this.longPress
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPress,
      title: Text(title),
      onTap: onClickEvent,
      leading: ClipOval(
        child: CircleAvatar(
            child: imageUrl==null ? Text(title[0]) : Image.network(imageUrl!)
        ),
      ),
      trailing: Text(trailing ?? ''),
      subtitle: Text(subTitle ?? ''),
    );
  }
}

