import 'package:flutter/material.dart';

class terminalMain extends StatefulWidget {
  const terminalMain({super.key});

  //creating stateful Widget for switching
  @override
  _termMain createState() => _termMain();
}

class _termMain extends State<terminalMain> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text('Here is the Terminal!'),
          ],
          
        ),
        
      ),
      backgroundColor: Color.fromARGB(255, 25, 68, 90),
    );
  }
}
