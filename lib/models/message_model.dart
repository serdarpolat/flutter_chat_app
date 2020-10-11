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