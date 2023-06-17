import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _loginPage createState() => _loginPage();
}

class sshInfo {
  String username = '';
  String hostname = '';
  String port = '';
}

class _loginPage extends State<LoginPage> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();

  sshInfo _info = sshInfo();

  String _validateSSHInfo(String usr, String hst, String port) {
    if (usr.isEmpty) {
      usr = 'empty';
    }
    if (hst.isEmpty) {
      hst = 'empty';
    }
    if (port.isEmpty) {
      port = 'empty';
    }
    return '$usr@$hst:$port';
  }



  void _getFullSSH() {
    if (_formStateKey.currentState!.validate()) {
      _formStateKey.currentState!.save();
      String full = sshInfo.username;
      print("Full info is $full");
    }
  }

  void setUser(TextFormField txt) {
    txt.

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
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Username',
                      ),
                      validator: _validateSSHInfo(),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Hostname',
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Port',
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
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
                  backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: Text('Login'),
                ),
                TextButton(
                  onPressed: () {
                  
                },
                child: Text('Cancel'),
                ),
                
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
