import 'package:flutter/material.dart';
import 'lower_part.dart';
import 'upper_part.dart';

class ConsolePage extends StatefulWidget {
  const ConsolePage({super.key});

  @override
  State<ConsolePage> createState() => _ConsolePageState();
}

class _ConsolePageState extends State<ConsolePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        Expanded(flex: 5, child: UpperPart()),
        Expanded(flex: 1, child: LowerPart())
      ],
    );
  }
}
