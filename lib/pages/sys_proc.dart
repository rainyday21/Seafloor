import 'package:flutter/material.dart';
import 'package:seafloor/services/ssh_device.dart';

import '../services/appSSH.dart';
import '../utils/app_state.dart';

class SysProc extends StatefulWidget{
  const SysProc({super.key});
  State<SysProc> createState() => _SysProcState();
}

class _SysProcState extends State<SysProc> {
  String opt = 'ps -ax';
  List<String> _process = [];
  List<Widget> _comp = [
    Text('Processes',
    style: TextStyle(
      color: AppState.secondaryColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),];

  getProcess(opt) async {
    SSHConnection.resetValues();
    await SSHConnection.runCmd(opt).then((_) => {
    setState(() {
    var ans = SSHConnection.getResult();
    print(ans);
    _process = ans.split('\n');
    displayProcess();
    })
    });
  }

  void displayProcess(){
    setState(() {
      for (int i = 0; i < _process.length; i++) {
        print(_process[i].split(' '));
        _comp.add(Text(_process[i]));
        _comp.add(const Padding(padding: EdgeInsets.all(3.0)));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      getProcess(opt);
    });
    displayProcess();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _comp,
            ),
          ),
        ),
      ),
    );
  }
}