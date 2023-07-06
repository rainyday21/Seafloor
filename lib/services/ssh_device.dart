import 'package:flutter/services.dart';
import 'package:ssh2/ssh2.dart';

class SSHConnection {
  static late SSHClient _client;
  static String _result = '';
  static List _array = [];
  static List<String> _sysInfo = [];
  static late String _error;

  static Future<void> initInfo() async {
    resetValues();
    await testConnection();
  }

  static void setClient(SSHClient d) {
    _client = d;
  }

  static Future<void> testConnection() async{
    await runCmd('clear');
  }

  static List<String> getSysInfo(){
    setSysInfo();
    print(_sysInfo);
    return _sysInfo;
  }

  static String getError(){
    return _error;
  }

  static String getResult(){
    return _result;
  }
  static void resetValues(){
    _result = '';
    _array = [];
    _sysInfo = [];
    _error = '';
  }

  static Future<String> runCmd(String cmd) async {
    String result = '';


    try {
      result = await _client.connect() ?? 'Null Result';
      if (result == 'session_connected') {
        result = await _client.execute(cmd) ?? 'Null Result';
      }
      await _client.disconnect();
    } on PlatformException catch (e) {
      String errorMessage = 'Error: ${e.code}\nError Message: ${e.message}';
      _error = errorMessage;
      print(errorMessage);
      result = errorMessage;
    }
    return result;
  }

  static Future<void> setConfig(String cmd) async {
    String result = '';
    String cmd = 'sudo raspi-config nonint do_';


    try {
      result = await _client.connect() ?? 'Null Result';
      if (result == 'session_connected') {
        result = await _client.execute(cmd) ?? 'Null Result';
        _result = result;
        print(_result);
      }
      await _client.disconnect();
    } on PlatformException catch (e) {
      String errorMessage = 'Error: ${e.code}\nError Message: ${e.message}';
      result = errorMessage;
      print(errorMessage);

    }
    _result = result;
  }

  static Future<void> setSysInfo() async {
    String result = '';
    String cmd = 'cat /etc/os-release';

    result = await runCmd(cmd);
    _sysInfo = result.split('\n');
  }

  static String getfullSSHInfo() {
    return '${_client.username}@${_client.host}:${_client.port}';
  }
}
