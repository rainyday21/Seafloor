import 'package:flutter/material.dart';
import 'package:seafloor/services/ssh_device.dart';

class SystemInfo extends StatefulWidget {
  const SystemInfo({super.key});

  @override
  State<SystemInfo> createState() => _sysInfo();
}

class _sysInfo extends State<SystemInfo> {
  List<String> info = [];

  getSysInfo() async {

    await SSHConnection.setSysInfo();
    setState(() {
      info = SSHConnection.getSysInfo();
    });
  }

  Column SysInfoElements() {
    List<Widget> elements = [];
    for (int i = 0; i < info.length - 1; i++) {
      if (info[i].contains('=')) {
        var subInfo = info[i].split('=');
        elements.add(RichText(
          text: TextSpan(
              text: '${subInfo[0]}: ',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: subInfo[1],
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Theme.of(context).colorScheme.inverseSurface,
                  ),
                ),
              ]),
        ));
      } else {
        elements.add(Text(
          info[i],
          style: TextStyle(
            fontSize: 12.0,
            color: Theme.of(context).colorScheme.inverseSurface,
          ),
        ));
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: elements,
    );
  }

  @override
  void initState() {
    super.initState();
    getSysInfo();

    /*WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Load settings from Firebase if any.
      setState(() {});
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              const Padding(padding: EdgeInsets.only(top: 10.0)),
              Text(
                'System Info',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 30.0,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
              ),
              SafeArea(
                child: SysInfoElements(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
