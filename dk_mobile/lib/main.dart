import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: const RootPage(),
    );
  }
}

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
        title: const Text('digital krishi'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint('button is pressed');
          },
          child: const Icon(Icons.add)),
      bottomNavigationBar: NavigationBar(destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: 'home'),
        NavigationDestination(icon: Icon(Icons.home), label: 'home'),
        NavigationDestination(icon: Icon(Icons.home), label: 'home'),
      ]),
    );
  }
}
