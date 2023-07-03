import 'package:flutter/material.dart';
import 'package:seafloor/services/ssh_device.dart';

class SystemInfo extends StatefulWidget {
  final SSHConnection connection;
  String _info = '';
  SystemInfo({required this.connection, super.key}){
    _info = connection.getResult(0);
  }

  Future<void> getSysInfo() async {
    String result = '';
    String cmd = 'cat /etc/os-release';

    try {
      result = await _client.connect() ?? 'Null';
      if (result == 'session_connected') {
        result = await _client.execute(cmd) ?? 'Null';
      }
      await _client.disconnect();
    } on PlatformException catch (e) {
      String errMsg = 'Error: ${e.code}\nError Message: ${e.message}';
      result = errMsg;
      print(errMsg);
    }
    _result = result;

  @override
  State<SystemInfo> createState() => _sysInfo();
}

class _sysInfo extends State<SystemInfo> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const Text('System Info'),
          SafeArea(
            child: Text(widget._info),
          ),
        ],
      ),
    );
  }
}

