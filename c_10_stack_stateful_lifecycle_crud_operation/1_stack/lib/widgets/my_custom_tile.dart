import 'package:flutter/material.dart';

class MyCustomTile extends StatelessWidget {
  String title;
  String? subTitle;
  IconData? icon;
  String? trailing;
  VoidCallback onClickEvent;

  MyCustomTile({
    required this.title,
    this.subTitle,
    this.icon,
    this.trailing,
    required this.onClickEvent
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: onClickEvent,
      leading: CircleAvatar(
          child: icon==null ? Text(title[0]) : Icon(icon)
      ),
      trailing: Text(trailing ?? ''),
      subtitle: Text(subTitle ?? ''),
    );
  }
}

