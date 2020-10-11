import 'package:flutter/material.dart';
import 'package:chat_app/exports.dart';

class TabBarModel {
  String title;
  List<Widget> actions;

  TabBarModel(this.title, this.actions);
}

List<TabBarModel> tabBars = [
  TabBarModel(
    "All Chats",
    [
      IconButton(
        icon: Icon(Icons.person_add),
        onPressed: () {},
        color: textWhite,
        iconSize: 34,
      ),
      SizedBox(width: 4),
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {},
        color: textWhite,
        iconSize: 34,
      ),
    ],
  ),
  TabBarModel(
    "Stories",
    [
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {},
        color: textWhite,
        iconSize: 34,
      ),
    ],
  ),
  TabBarModel(
    "Recent Calls",
    [
      IconButton(
        icon: Icon(Icons.phone),
        onPressed: () {},
        color: textWhite,
        iconSize: 34,
      ),
      SizedBox(width: 4),
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {},
        color: textWhite,
        iconSize: 34,
      ),
    ],
  ),
];
