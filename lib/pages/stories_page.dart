import 'package:chat_app/exports.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final double topBarOffset;
  final ScrollController scrollController;
  final Function onNotification;
  const Stories({
    Key key,
    this.topBarOffset,
    this.scrollController,
    this.onNotification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return NotificationListener<ScrollNotification>(
      onNotification: onNotification,
      child: SingleChildScrollView(
        controller: scrollController,
        child: Container(
          height: s.height,
          width: s.width,
          child: Column(
            children: [
              SizedBox(height: 164 - topBarOffset),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 4,
                  padding: EdgeInsets.only(
                      top: 20, left: 20, right: 20, bottom: 105),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  physics: BouncingScrollPhysics(),
                  children: List.generate(stories.length + 1, (index) {
                    if (index == 0) {
                      return AddYourStory();
                    } else {
                      return StoryWidget(
                        storyModel: stories[index - 1],
                      );
                    }
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
