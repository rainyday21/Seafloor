import 'package:flutter/material.dart';
import 'package:seafloor/services/ssh_device.dart';

import '../services/pass_dialog.dart';

class SysProc extends StatefulWidget{
  const SysProc({super.key});
  State<SysProc> createState() => _SysProcState();
}

class _SysProcState extends State<SysProc> {
  String opt = 'ps -ax';
  List<String> _process = [];
  List<Widget> _comp = [];

  getProcess(opt) async   {
    AppSSH.AppCmd(opt, context);
    var ans = SSHConnection.getResult();
      print(ans);
        _process = ans.split('\n');
  }

  List<Widget> displayProcess(){
    List<Widget> proc = [];
    for (int i = 0; i < _process.length; i++){
        print(_process[i].split(' '));
        proc.add(Text(_process[i]));
        proc.add(const Padding(padding: EdgeInsets.all(3.0)));
      }
    return proc;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      getProcess(opt);
      _comp = displayProcess();
    });

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