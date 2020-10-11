import 'package:chat_app/exports.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopBarForOtherPage extends StatelessWidget {
  const TopBarForOtherPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      width: s.width,
      height: 130 + MediaQuery.of(context).padding.top,
      color: lightGrey,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: s.width,
                height: 70 + MediaQuery.of(context).padding.top,
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 9 + MediaQuery.of(context).padding.top,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Search",
                      style: GoogleFonts.sourceSansPro(
                        color: textBlack,
                        fontWeight: FontWeight.w800,
                        fontSize: 38,
                      ),
                    ),
                    Text(
                      "Reset",
                      style: GoogleFonts.sourceSansPro(
                        color: Colors.blue,
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: TextStyle(
                    color: textBlack,
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0.0),
                    prefixIcon: Icon(
                      Icons.search,
                      color: darkGrey,
                      size: 20,
                    ),
                    suffixIcon: Icon(
                      Icons.close,
                      color: darkGrey,
                      size: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(90.0)),
                      borderSide: BorderSide.none,
                    ),
                    hintStyle: TextStyle(
                      color: darkGrey,
                      fontSize: 14,
                    ),
                    filled: true,
                    fillColor: mainGrey.withOpacity(0.3),
                    hintText: 'Search Settings',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
