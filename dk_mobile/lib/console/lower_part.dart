import 'package:flutter/material.dart';

class LowerPart extends StatefulWidget {
  const LowerPart({super.key});

  @override
  State<LowerPart> createState() => _LowerPartState();
}

class _LowerPartState extends State<LowerPart> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'command',
                  hintText: 'write your command ...'),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextButton(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green)),
              onPressed: () {},
              child: const Text('send'),
            ),
          ),
        )
      ],
    );
  }
}
