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
  var client = SSHClient(
      host: '192.168.1.32',
      port: 22,
      username: 'rainyday21',
      passwordOrKey: '');

  void method() async {
    await client.connect();
    await client.disconnect();
    print(client.getHostFingerprint());
  }
}
