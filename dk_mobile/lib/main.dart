import 'package:flutter/material.dart';
import 'console/chat_home.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> availablePorts = SerialPort.availablePorts;
    print(availablePorts);
    SerialPort arduino = SerialPort('COM7');
    arduino.openReadWrite();
    try {
      SerialPortReader serial_reader = SerialPortReader(arduino);
      Stream<String> upcoming_data = serial_reader.stream.map((data) {
        return String.fromCharCodes(data);
      });
      while (true) {
        upcoming_data.listen((data) {
          print(data);
        });
      }
    } on SerialPortError catch (err, _) {
      print(SerialPort.lastError);
    }
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: const SafeArea(child: ChatHome()),
    );
  }
}
