import 'package:flutter/material.dart';

class SystemInfo extends StatefulWidget {
  @override
  _sysInfo createState() => _sysInfo();
}

class _sysInfo extends State<SystemInfo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text('System Info'),
        ],
      ),
    );
  }
}
