import 'package:flutter/material.dart';

class TextBox extends StatefulWidget {
  final MaterialColor boxColor;
  final TextAlign textAlign;
  //const TextBox({Key? key, required this.boxColor}) : super(key: key);
  const TextBox({super.key, required this.boxColor, required this.textAlign});

  @override
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2, top: 2),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: widget.boxColor, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              'not working',
              textAlign: widget.textAlign,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            )),
      ),
    );
  }
}
