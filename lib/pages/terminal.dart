import 'package:flutter/material.dart';
import 'package:seafloor/services/ssh_device.dart';

class terminalMain extends StatefulWidget {
  const terminalMain({required this.connection, super.key});
  final SSHConnection connection;

  //creating stateful Widget for switching
  @override
  State<terminalMain> createState() => _termMain();
}

class _termMain extends State<terminalMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const Text('Here is the Terminal!'),
            Text('Connected to ${widget.connection.getfullSSHInfo()}')
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 25, 68, 90),
    );
  }
}
