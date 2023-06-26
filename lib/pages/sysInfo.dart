import 'package:flutter/material.dart';
import 'package:seafloor/services/ssh_device.dart';

class SystemInfo extends StatefulWidget {
  final SSHConnection connection;
  final String test = 'hello';
  const SystemInfo({required this.connection, super.key});

  @override
  State<SystemInfo> createState() => _sysInfo();
}

class _sysInfo extends State<SystemInfo> {
  String info = '';
  void getString() {
    Future<String> sysInfo =
        widget.connection.getSysInfo().then((sysInfo) => info);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const Text('System Info'),
          SafeArea(
            child: Text(info),
          ),
        ],
      ),
    );
  }
}

class getSysInfo {}
