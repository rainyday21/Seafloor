import 'package:flutter/material.dart';
import 'package:seafloor/services/ssh_device.dart';

class SystemInfo extends StatefulWidget {
  const SystemInfo({super.key});

  
  @override
  State<SystemInfo> createState() => _sysInfo();
}


class _sysInfo extends State<SystemInfo> {
  List<String> info = SSHConnection.getSysInfo();

  Column SysInfoElements(){
    List<RichText> elements = [];
    for (int i = 0; i < info.length-1; i++){
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
            ]
          ),
      ));
    }
    return Column(
      children: elements,
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            const Text('System Info'),
            const Padding(padding: EdgeInsets.all(8.0),),
            SafeArea(
              child: SysInfoElements(),
            ),
          ],
        ),
      ),
    );
  }
}
