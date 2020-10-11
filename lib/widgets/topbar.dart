import 'package:chat_app/exports.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TopBar extends StatelessWidget {
  final double topBarOffset;
  final String title;
  final List<Widget> actions;
  const TopBar({
    Key key,
    this.topBarOffset,
    this.title,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      width: s.width,
      height: 130 + MediaQuery.of(context).padding.top - topBarOffset,
      child: Stack(
        children: [
          Positioned(
            top: 0 - topBarOffset,
            left: 0,
            right: 0,
            child: Container(
              color: mainPurple,
              child: Column(
                children: [
                  Container(
                    width: s.width,
                    height: 70 + MediaQuery.of(context).padding.top,
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 6,
                      top: 9 + MediaQuery.of(context).padding.top,
                      bottom: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.sourceSansPro(
                            color: textWhite,
                            fontWeight: FontWeight.w800,
                            fontSize: 38,
                          ),
                        ),
                        Row(
                          children: actions,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: s.width,
                    height: 60,
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Stack(
                      children: [
                        Consumer<TabMenuState>(
                          builder: (BuildContext context, state, Widget child) {
                            return Container(
                              width: s.width - 40,
                              height: 60,
                              child: Row(
                                children: [
                                  TabMenuItem(
                                    title: "Messages",
                                    onTap: () {
                                      state.changeIndex(0);
                                    },
                                    isSelected: state.selectedIndex == 0,
                                  ),
                                  TabMenuItem(
                                    title: "Stories",
                                    onTap: () {
                                      state.changeIndex(1);
                                    },
                                    isSelected: state.selectedIndex == 1,
                                  ),
                                  TabMenuItem(
                                    title: "Calls",
                                    onTap: () {
                                      state.changeIndex(2);
                                    },
                                    isSelected: state.selectedIndex == 2,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        Consumer<TabMenuState>(builder:
                            (BuildContext context, state, Widget child) {
                          return AnimatedPositioned(
                            duration: Duration(milliseconds: 180),
                            left: (s.width - 20) / 3 * state.selectedIndex,
                            bottom: 0,
                            child: Container(
                              width: (s.width - 20) / 3,
                              height: 3,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).padding.top,
              color: mainPurple,
            ),
          ),
        ],
      ),
    );
  }
}

class TabMenuItem extends StatelessWidget {
  final String title;
  final Function onTap;
  final bool isSelected;
  const TabMenuItem({
    Key key,
    this.title,
    this.onTap,
    this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: (s.width - 40) / 3,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: isSelected
                          ? textWhite
                          : Colors.white.withOpacity(0.6),
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 4),
                  isSelected
                      ? Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: textWhite,
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
