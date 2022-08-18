import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/widgets/message_container.dart';
import 'package:flutter/material.dart';

final _firestore = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final _msgController = TextEditingController();

  String _msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        leading: Container(),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () async {
              try {
                await _auth.signOut();
                Navigator.of(context).pop();
              } catch (err) {
                print(err);
              }
            },
          ),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _msgController,
                      onChanged: (value) => _msg = value,
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      if (_auth.currentUser != null) {
                        await _firestore.collection("msgs").add({
                          "sender": _auth.currentUser!.email,
                          "msg": _msg,
                          "date": DateTime.now()
                        });
                        _msgController.clear();
                      }
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection("msgs")
            .orderBy("date", descending: true)
            .snapshots(),
        builder: (context, future) {
          if (future.hasData) {
            var msgs = future.data!.docs;

            List<Widget> msgWidgets = [];

            for (var msg in msgs) {
              var data = msg.data() as Map<String, dynamic>;
              msgWidgets.add(MessageContainer(
                sender: data['sender'],
                content: data['msg'],
                isSender: data['sender'] == _auth.currentUser!.email,
              ));
            }

            return Expanded(
              child: ListView(
                reverse: true,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                children: msgWidgets,
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
