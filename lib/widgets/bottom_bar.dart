import 'package:chat_app/exports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  final BuildContext context;
  const BottomBar({Key key, this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 85,
      child: Consumer<BottomMenuState>(
        builder: (context, state, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BottomBarItem(
                img: "assets/icons/person.png",
                onTap: () {
                  state.changeIndex(0);
                },
                isSelected: state.selectedIndex == 0,
              ),
              BottomBarItem(
                img: "assets/icons/comments.png",
                onTap: () {
                  state.changeIndex(1);
                },
                isSelected: state.selectedIndex == 1,
              ),
              BottomBarItem(
                img: "assets/icons/settings.png",
                onTap: () {
                  state.changeIndex(2);
                },
                isSelected: state.selectedIndex == 2,
              ),
            ],
          );
        },
      ),
      decoration: BoxDecoration(
        color: lightGrey,
        border: Border(
          top: BorderSide(
            color: Color.fromARGB(30, 0, 0, 0),
            width: 1.5,
          ),
        ),
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  final String img;
  final Function onTap;
  final bool isSelected;
  const BottomBarItem({
    Key key,
    this.img,
    this.onTap,
    this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(7),
        child: Image.asset(
          img,
          color: isSelected ? mainPurple : Colors.black.withOpacity(0.4),
          height: 36,
        ),
      ),
    );
  }
}
