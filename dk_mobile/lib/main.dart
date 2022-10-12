import 'package:flutter/material.dart';
import 'package:libserialport/libserialport.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> availablePort = SerialPort.availablePorts;
    print('Available Ports: $availablePort');
    SerialPort arduino = SerialPort('COM7');
    arduino.openReadWrite();
    try {
      SerialPortReader arduino_reader = SerialPortReader(arduino);

      Stream<String> stream_data = arduino_reader.stream.map((data) {
        return String.fromCharCodes(data);
      });
      stream_data.listen((data) {
        print(data);
      });
      while (true) {}
    } on SerialPortError catch (err, _) {
      print(SerialPort.lastError);
      arduino.close();
    }
    return Container();
  }
}
