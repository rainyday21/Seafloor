import 'package:flutter/material.dart';
import 'package:seafloor/services/ssh_device.dart';
import 'package:ssh2/ssh2.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _loginPage createState() => _loginPage();
}

class sshInfo {
  String username = '';
  String hostname = '';
  String password = '';
  int port = 22;
}

class _loginPage extends State<LoginPage> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();

  final sshInfo _info = sshInfo();

  String? _validateInfo(String? info) {
    if (info == null ||
        info.isEmpty ||
        info.contains(RegExp(r'[^A-Za-z0-9]'))) {
      return 'Not acceptable';
    }
    return null;
  }

  String? _validateHost(String? info) {
    if (info == null ||
        info.isEmpty ||
        info.contains(RegExp(r'[^A-Za-z0-9.]'))) {
      return 'Not acceptable';
    }
    return null;
  }

  String? _validatePort(String? info) {
    if (info == null || info.isEmpty || info.contains(RegExp(r'[^0-9]'))) {
      return 'Enter proper port';
    }
    return null;
  }

  void _getFullSSH() {
    if (_formStateKey.currentState!.validate()) {
      _formStateKey.currentState!.save();
      String full = '${_info.username}@${_info.hostname}:${_info.port}';
      Device currDevice = Device(
        host: _info.hostname,
        port: _info.port,
        username: _info.username,
        passwordOrKey: _info.password,
      );
      /* Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      ); */
      var T = Tester.withDevice(d: currDevice);
      T.method();

      print("Full info is $full");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(
                16.0,
              ),
            ),
            const Text(
              'Enter machine info:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color: Colors.blueGrey,
              ),
            ),
            Form(
              key: _formStateKey,
              //autovalidateMode: AutovalidateMode.always,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 35.0,
                  right: 35.0,
                  top: 16.0,
                  bottom: 16.0,
                ),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Username',
                      ),
                      validator: (value) => _validateInfo(value!),
                      onSaved: (value) => _info.username = value!,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Password",
                      ),
                      obscureText: true,
                      validator: (value) => _validateInfo(value!),
                      onSaved: (value) => _info.password = value!,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Hostname',
                      ),
                      validator: (value) => _validateHost(value!),
                      onSaved: (value) => _info.hostname = value!,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Port',
                      ),
                      validator: (value) => _validatePort(value),
                      onSaved: (value) => _info.port = int.tryParse(value!)!,
                    )
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 8.0,
                bottom: 8.0,
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    _getFullSSH();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  child: const Text('Login'),
                ),
                TextButton(
                  onPressed: () {
                    _formStateKey.currentState?.reset();
                  },
                  child: const Text('Clear'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
