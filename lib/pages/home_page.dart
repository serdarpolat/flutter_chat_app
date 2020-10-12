import 'package:chat_app/exports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  final String uid;

  const Home({Key key, this.uid}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Size get s => MediaQuery.of(context).size;
  String message = "";

  ScrollController _scrollController;
  double topBarOffset = 0;

  int pageIndex = 1;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.uid);
    return Scaffold(
      body: Consumer2<TabMenuState, BottomMenuState>(
        builder: (BuildContext context, tabState, bottomState, Widget child) {
          return Container(
            width: s.width,
            height: s.height,
            color: Colors.white,
            child: Stack(
              children: [
                IndexedStack(
                  index: bottomState.selectedIndex,
                  children: [
                    Profiel(),
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 320),
                      left: -s.width * tabState.selectedIndex,
                      top: 0,
                      right: 0,
                      bottom: 0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          MessagesPage(
                            topBarOffset: topBarOffset,
                            scrollController: _scrollController,
                            onNotification: (val) {
                              setState(() {
                                topBarOffset = val.metrics.extentBefore > 70
                                    ? 70
                                    : val.metrics.extentBefore;
                              });
                              return null;
                            },
                          ),
                          Stories(
                            topBarOffset: topBarOffset,
                            onNotification: (val) {
                              setState(() {
                                topBarOffset = val.metrics.extentBefore > 70
                                    ? 70
                                    : val.metrics.extentBefore;
                              });
                              return null;
                            },
                            scrollController: _scrollController,
                          ),
                          Calls(),
                        ],
                      ),
                    ),
                    Settings(),
                  ],
                ),
                bottomState.selectedIndex == 1
                    ? TopBar(
                        topBarOffset: topBarOffset,
                        title: tabBars[tabState.selectedIndex].title,
                        actions: tabBars[tabState.selectedIndex].actions,
                      )
                    : TopBarForOtherPage(),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: BottomBar(
                    context: context,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
