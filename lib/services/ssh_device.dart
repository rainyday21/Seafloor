import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:ssh2/ssh2.dart';

class Device extends SSHClient {
  Device(
      {required super.host,
      required super.port,
      required super.username,
      required super.passwordOrKey});

  String getfullSSHInfo() {
    return '$username@$host:$port';
  }
}

class Tester {
  late Device _client;

  Tester.withDevice({required Device d}) {
    _client = d;
  }

  void method() async {
    await _client.connect();
    print(_client.getHostFingerprint());
    print(_client.getfullSSHInfo());
    await _client.disconnect();
  }
}

class MainMethods {
  late Device _client;
  String _result = '';
  List _array = [];

  void getDevice(Device d) {
    _client = d;
  }

  Future<void> startShell() async {
    String? result = '';
    
    try { //setup connection
      result = await _client.connect() ?? 'Null result';
      if (result == 'session_connected') {
        result = await _client.startShell(
          ptyType: "xterm",
          callback: (dynamic res) {
            print(res);
            }
        ) ?? 'Null Result';
      }
      
    }
    on PlatformException catch (e) {
      String erMsg = 'Error: ${e.code}\nError Message: ${e.message}';
      result = result! + erMsg;
      print(erMsg);
    }

  }
}
