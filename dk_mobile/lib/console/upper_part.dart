import 'package:flutter/material.dart';
import 'text_box.dart';

class UpperPart extends StatefulWidget {
  const UpperPart({super.key});

  @override
  State<UpperPart> createState() => _UpperPartState();
}

class _UpperPartState extends State<UpperPart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
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
        ));
  }
}
