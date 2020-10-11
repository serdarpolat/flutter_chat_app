import 'package:flutter/material.dart';

import '../exports.dart';

class MessageWidget extends StatelessWidget {
  final MessageModel messageModel;
  const MessageWidget({
    Key key,
    this.messageModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      width: s.width,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 56,
            height: 56,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: messageModel.isOnline ? mainGreen : mainGrey,
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2.4,
                        color: textWhite,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(messageModel.imgPath),
              ),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    messageModel.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(width: 4),
                  messageModel.isMessageRead
                      ? Container()
                      : Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: mainRed,
                            shape: BoxShape.circle,
                          ),
                        ),
                ],
              ),
              SizedBox(height: 7),
              Text(
                messageModel.isHaveMissedCalls
                    ? "You missed a call"
                    : messageModel.lastMessage.length > 30
                        ? messageModel.lastMessage.substring(0, 30) + "..."
                        : messageModel.lastMessage,
                style: TextStyle(
                  fontFamily: 'JosefinSlab',
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: messageModel.isHaveMissedCalls
                      ? mainRed
                      : messageModel.isMessageRead ? mainGrey : textBlack,
                ),
              ),
            ],
          ),
          Spacer(),
          messageModel.isHaveMissedCalls
              ? Container(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.phone,
                    color: mainGreen,
                    size: 18,
                  ),
                  decoration: BoxDecoration(
                    color: lightGreen,
                    shape: BoxShape.circle,
                  ),
                )
              : Container(),
          SizedBox(width: 16),
          Text(
            messageModel.lastMessageTime,
            style: TextStyle(
              color: messageModel.isMessageRead ? mainGrey : textBlack,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
