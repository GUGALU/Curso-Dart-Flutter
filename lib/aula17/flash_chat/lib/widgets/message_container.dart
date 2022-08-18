import 'package:flutter/material.dart';

class MessageContainer extends StatelessWidget {
  MessageContainer(
      {required this.sender, required this.content, required this.isSender});

  final String sender;
  final String content;
  final bool isSender;

  final BorderRadius senderBorder = BorderRadius.only(
    bottomLeft: Radius.circular(15),
    bottomRight: Radius.circular(15),
    topLeft: Radius.circular(15),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          Material(
            elevation: 6,
            borderRadius: isSender
                ? senderBorder
                : senderBorder.copyWith(
                    topLeft: Radius.zero, topRight: Radius.circular(15)),
            color: isSender ? Colors.lightBlue : Colors.blueAccent,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: Text(
                content,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
