import 'package:flutter/material.dart';
import 'package:seafloor/pages/home.dart';

void main() => runApp(Seafloor());

class Seafloor extends StatefulWidget {
  _SeaState createState() => _SeaState();
}

class _SeaState extends State<Seafloor> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Seafloor',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Home(),
    );
  }
}
