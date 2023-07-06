import 'package:flutter/material.dart';
import 'package:seafloor/services/ssh_device.dart';

class AppSSH {
  static late String _pswrd;

  static Future<void> _buildDialog(BuildContext context) {
    String res;
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              const Text('Password Required'),
              const Padding(padding: EdgeInsets.all(8.0)),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                onSaved: (val) => val!,
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                      );
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      SSHConnection.needPassword = false;
                      SSHConnection.runCmd(_pswrd);
                      Navigator.pop(
                        context,
                      );
                    },
                    child: Text(
                      'Apply',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void AppCmd(String cmd, BuildContext context) async  {
    await SSHConnection.runCmd(cmd);
    print(SSHConnection.getResult());
    while (SSHConnection.needPassword) {
        _buildDialog(context);
        SSHConnection.runCmd(_pswrd);
      }
  }


}
