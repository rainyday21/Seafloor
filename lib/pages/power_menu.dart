import 'package:flutter/material.dart';
import 'package:seafloor/services/pass_dialog.dart';
import 'package:seafloor/services/ssh_device.dart';

class PowerMenu extends StatelessWidget {
  const PowerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(

            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  String cmd = 'sudo shutdown now';
                  showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          ConfirmDialog(cmd: cmd));
                },
                child: const Row(
                  children: <Widget>[
                    Icon(
                      Icons.power_settings_new,
                      color: Colors.redAccent,
                    ),
                    Text('Power off'),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  String cmd = 'sudo systemctl suspend';
                  showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          ConfirmDialog(cmd: cmd));
                },
                child: const Row(
                  children: <Widget>[
                    Icon(
                      Icons.power_settings_new,
                      color: Colors.yellowAccent,
                    ),
                    Text('Suspend'),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(left: 8.0, right: 8.0)),
              ElevatedButton(
                onPressed: () {
                  String cmd = 'sudo reboot now';
                  showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          ConfirmDialog(cmd: cmd));
                },
                child: const Row(
                  children: <Widget>[
                    Icon(
                      Icons.power_settings_new,
                      color: Colors.blueAccent,
                    ),
                    Text('Restart'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({super.key, required this.cmd});
  final String cmd;

  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Padding(padding: EdgeInsets.all(8.0)),
          const Text('Are you sure?'),
          const Padding(padding: EdgeInsets.all(8.0)),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 30,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel')),
                ),
                const Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0)),
                SizedBox(
                  height: 30,
                  child: ElevatedButton(
                      onPressed: () {
                        AppSSH.AppCmd(cmd, context);
                        Navigator.pop(context);
                      },
                      child: const Text('Apply')),
                ),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.all(8.0)),
        ],
      ),
    );
  }
}
