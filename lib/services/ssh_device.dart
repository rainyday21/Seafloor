import 'package:flutter/services.dart';
import 'package:seafloor/pages/sysInfo.dart';
import 'package:ssh2/ssh2.dart';

class Device extends SSHClient {
  Device(
      {required super.host,
      required super.port,
      required super.username,
      required super.passwordOrKey});
}

class Tester {
  late Device _client;

  Tester.withDevice({required Device d}) {
    _client = d;
  }

  void method() async {
    await _client.connect();
    print(_client.getHostFingerprint());
    await _client.disconnect();
  }
}

class SSHConnection {
  late Device _client;
  late String _result = '';
  final List _array = [];

  SSHConnection({required Device client}) {
    _client = client;
  }

  void getDevice(Device d) {
    _client = d;
  }



  Future<void> setConfig(String cmd) async {
    String result = '';
    String cmd = 'sudo raspi-config nonint do_';

    void SetCmd(String opt) {
      cmd += opt;
    }

    try {
      result = await _client.connect() ?? 'Null Result';
      if (result == 'session_connected') {
        result = await _client.execute(cmd) ?? 'Null Result';
      }
      await _client.disconnect();
    } on PlatformException catch (e) {
      String errorMessage = 'Error: ${e.code}\nError Message: ${e.message}';
      result = errorMessage;
      print(errorMessage);
    }
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
  }

  String getResult(int opt){
    getSysInfo();
    return _result;
  }

  String getfullSSHInfo() {
    return '$_client.username@$_client.host:$_client.port';
  }
}
