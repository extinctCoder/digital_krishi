import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:image_picker/image_picker.dart';
import 'text_box.dart';

String randomString() {
  final random = Random.secure();
  final values = List<int>.generate(16, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

class ChatHome extends StatefulWidget {
  const ChatHome({super.key});

  @override
  State<ChatHome> createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  final List<types.Message> _messages = [];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Chat(
            messages: _messages,
            onSendPressed: _handelSendPressed,
            onAttachmentPressed: _handelAttachmentPressed,
            user: _user),
      );
  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handelSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().microsecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );
    _addMessage(textMessage);
  }

  void _handelAttachmentPressed() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: SafeArea(
              child: ListView(
                shrinkWrap: true,
                children: const <Widget>[
                  TextBox(
                    textAlign: TextAlign.left,
                    boxColor: Colors.red,
                  ),
                  TextBox(
                    textAlign: TextAlign.right,
                    boxColor: Colors.cyan,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
