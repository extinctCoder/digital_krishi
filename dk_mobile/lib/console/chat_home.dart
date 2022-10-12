import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';

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
    var availablePorts = [];
    setState(() => availablePorts = SerialPort.availablePorts);
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: ListView(
              children: [
                for (final address in availablePorts)
                  Builder(builder: (context) {
                    final port = SerialPort(address);
                    print(port);
                    return ExpansionTile(
                      title: Text(address),
                      children: [
                        CardListTile('Description', port.description),
                        CardListTile('Manufacturer', port.manufacturer),
                        CardListTile('Product Name', port.productName),
                        CardListTile('Serial Number', port.serialNumber),
                        CardListTile('MAC Address', port.macAddress),
                      ],
                    );
                  }),
              ],
            ),
          );
        });
  }
}

class CardListTile extends StatelessWidget {
  final String name;
  final String? value;

  CardListTile(this.name, this.value);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(value ?? 'N/A'),
        subtitle: Text(name),
      ),
    );
  }
}
