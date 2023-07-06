import 'package:flutter/material.dart';
import 'package:seafloor/pages/about.dart';
import 'package:seafloor/pages/home.dart';
import 'package:seafloor/pages/login.dart';
import 'package:seafloor/pages/power_menu.dart';
import 'package:seafloor/pages/sysInfo.dart';
import 'package:seafloor/pages/system_processes.dart';
import 'package:seafloor/pages/terminal.dart';
import 'package:seafloor/services/ssh_device.dart';
import 'package:seafloor/utils/classes.dart';
import 'package:seafloor/widgets/menulist_main.dart';

void main() => runApp(const Seafloor());

class Seafloor extends StatefulWidget {
  const Seafloor({super.key});

  @override
  _SeafloorApp createState() => _SeafloorApp();
}

class _SeafloorApp extends State<Seafloor> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Seafloor',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: AppState.mainColor
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.dark(
          primary: AppState.mainColor,
        ),
            useMaterial3: true,
      ),
      home: const LoginPage(),
      themeMode: AppState.currentTheme,
    );
  }
}
