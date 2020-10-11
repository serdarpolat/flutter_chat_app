import 'package:chat_app/ui/theme.dart';
import 'package:flutter/material.dart';

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
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
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

class MessageModel {
  String imgPath;
  String name;
  String lastMessage;
  String lastMessageTime;
  bool isOnline;
  bool isMessageRead;
  bool isTyping;
  bool isHaveMissedCalls;

  MessageModel({
    this.imgPath,
    this.name,
    this.lastMessage,
    this.lastMessageTime,
    this.isOnline,
    this.isMessageRead,
    this.isTyping,
    this.isHaveMissedCalls,
  });
}

List<MessageModel> messages = [
  MessageModel(
    imgPath: "https://randomuser.me/api/portraits/women/41.jpg",
    name: "Dianna Smiley",
    lastMessage: "Introducing yourds identity",
    lastMessageTime: "3m ago",
    isOnline: true,
    isMessageRead: false,
    isTyping: false,
    isHaveMissedCalls: false,
  ),
  MessageModel(
    imgPath: "https://randomuser.me/api/portraits/men/11.jpg",
    name: "Arden Dean",
    lastMessage: "Hey! Whats up, long time no see?",
    lastMessageTime: "15m ago",
    isOnline: false,
    isMessageRead: true,
    isTyping: false,
    isHaveMissedCalls: false,
  ),
  MessageModel(
    imgPath: "https://randomuser.me/api/portraits/women/12.jpg",
    name: "Jennifer Fritz",
    lastMessage: "",
    lastMessageTime: "1h ago",
    isOnline: true,
    isMessageRead: true,
    isTyping: false,
    isHaveMissedCalls: true,
  ),
  MessageModel(
    imgPath: "https://randomuser.me/api/portraits/men/12.jpg",
    name: "Gracelyn Mason",
    lastMessage: "We meet new users",
    lastMessageTime: "1h ago",
    isOnline: true,
    isMessageRead: false,
    isTyping: true,
    isHaveMissedCalls: false,
  ),
  MessageModel(
    imgPath: "https://randomuser.me/api/portraits/men/23.jpg",
    name: "Leo Gill",
    lastMessage: "She going to make it happen...",
    lastMessageTime: "12h ago",
    isOnline: false,
    isMessageRead: true,
    isTyping: false,
    isHaveMissedCalls: false,
  ),
  MessageModel(
    imgPath: "https://randomuser.me/api/portraits/women/23.jpg",
    name: "Merida Swan",
    lastMessage: "Free for quick call?",
    lastMessageTime: "12h ago",
    isOnline: true,
    isMessageRead: false,
    isTyping: false,
    isHaveMissedCalls: false,
  ),
  MessageModel(
    imgPath: "https://randomuser.me/api/portraits/men/25.jpg",
    name: "Lori Bryson",
    lastMessage: "Lets join the call",
    lastMessageTime: "Yesterday",
    isOnline: true,
    isMessageRead: true,
    isTyping: false,
    isHaveMissedCalls: false,
  ),
  MessageModel(
    imgPath: "https://randomuser.me/api/portraits/women/41.jpg",
    name: "Dianna Smiley",
    lastMessage: "Introducing yourds identity",
    lastMessageTime: "3m ago",
    isOnline: true,
    isMessageRead: false,
    isTyping: false,
    isHaveMissedCalls: false,
  ),
  MessageModel(
    imgPath: "https://randomuser.me/api/portraits/men/11.jpg",
    name: "Arden Dean",
    lastMessage: "Hey! Whats up, long time no see?",
    lastMessageTime: "15m ago",
    isOnline: false,
    isMessageRead: true,
    isTyping: false,
    isHaveMissedCalls: false,
  ),
  MessageModel(
    imgPath: "https://randomuser.me/api/portraits/women/12.jpg",
    name: "Jennifer Fritz",
    lastMessage: "",
    lastMessageTime: "1h ago",
    isOnline: true,
    isMessageRead: true,
    isTyping: false,
    isHaveMissedCalls: true,
  ),
  MessageModel(
    imgPath: "https://randomuser.me/api/portraits/men/12.jpg",
    name: "Gracelyn Mason",
    lastMessage: "We meet new users",
    lastMessageTime: "1h ago",
    isOnline: true,
    isMessageRead: false,
    isTyping: true,
    isHaveMissedCalls: false,
  ),
  MessageModel(
    imgPath: "https://randomuser.me/api/portraits/men/23.jpg",
    name: "Leo Gill",
    lastMessage: "She going to make it happen...",
    lastMessageTime: "12h ago",
    isOnline: false,
    isMessageRead: true,
    isTyping: false,
    isHaveMissedCalls: false,
  ),
  MessageModel(
    imgPath: "https://randomuser.me/api/portraits/women/23.jpg",
    name: "Merida Swan",
    lastMessage: "Free for quick call?",
    lastMessageTime: "12h ago",
    isOnline: true,
    isMessageRead: false,
    isTyping: false,
    isHaveMissedCalls: false,
  ),
  MessageModel(
    imgPath: "https://randomuser.me/api/portraits/men/25.jpg",
    name: "Lori Bryson",
    lastMessage: "Lets join the call",
    lastMessageTime: "Yesterday",
    isOnline: true,
    isMessageRead: true,
    isTyping: false,
    isHaveMissedCalls: false,
  ),
];
