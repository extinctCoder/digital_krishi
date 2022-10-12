import 'package:flutter/material.dart';
import 'console/main.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('test_app'),
      ),
      body: const ConsolePage(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: FloatingActionButton(
            onPressed: () {
              debugPrint('button is pressed');
            },
            child: const Icon(Icons.add)),
      ),
    );
  }
}
