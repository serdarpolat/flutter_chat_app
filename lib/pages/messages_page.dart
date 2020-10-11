import 'package:flutter/material.dart';
import 'package:chat_app/exports.dart';

class MessagesPage extends StatelessWidget {
  final double topBarOffset;
  final ScrollController scrollController;
  final Function onNotification;
  const MessagesPage({
    Key key,
    this.topBarOffset,
    this.scrollController,
    this.onNotification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      height: s.height,
      width: s.width,
      child: Column(
        children: [
          SizedBox(height: 164 - topBarOffset),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: onNotification,
              child: ListView.builder(
                controller: scrollController,
                padding: const EdgeInsets.only(bottom: 85.0, top: 10),
                physics: BouncingScrollPhysics(),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return MessageWidget(
                    messageModel: messages[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
