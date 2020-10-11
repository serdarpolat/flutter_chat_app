import 'package:chat_app/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Calls extends StatelessWidget {
  const Calls({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      height: s.height,
      width: s.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/no_calls.svg",
            alignment: Alignment.center,
            width: s.width - 80,
          ),
          SizedBox(height: 24),
          Text(
            "No calls yet...",
            style: TextStyle(
              color: darkGrey,
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
