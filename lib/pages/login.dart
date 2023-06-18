
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _loginPage createState() => _loginPage();
}

class sshInfo {
  String username = '';
  String hostname = '';
  int port = 22;
}

class _loginPage extends State<LoginPage> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();

  final sshInfo _info = sshInfo();

  String? _validateInfo(String? info) {
    if (info == null || info.isEmpty) {
      return null;
    } else {
      return info;
    }
  }

  String? _validatePort(String? info) {
    if (info == null || info.isEmpty) {
      return '0';
    } else {
      return info;
    }
  }

  void _getFullSSH() {
    if (_formStateKey.currentState!.validate()) {
      _formStateKey.currentState!.save();
      String full = '${sshInfo().username}@${sshInfo().hostname}:${sshInfo().port}';
      print("Full info is $full");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Form(
              key: _formStateKey,
              autovalidateMode: AutovalidateMode.always,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Username',
                      ),
                      validator: (value) => _validateInfo(value),
                      onSaved: (value) => sshInfo().username = value!,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Hostname',
                      ),
                      validator: (value) => _validateInfo(value),
                      onSaved: (value) => sshInfo().hostname = value!,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Port',
                      ),
                      validator: (value) => _validatePort(value),
                      onSaved: (value) => sshInfo().port = int.tryParse(value!)!,
                    )
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
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
                  ),
                  child: const Text('Login'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
