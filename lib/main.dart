import 'package:flutter/material.dart';
import 'package:seafloor/pages/about.dart';
import 'package:seafloor/pages/config.dart';
import 'package:seafloor/pages/home.dart';
import 'package:seafloor/pages/login.dart';
import 'package:seafloor/pages/power_menu.dart';
import 'package:seafloor/pages/sysInfo.dart';
import 'package:seafloor/pages/sys_proc.dart';
import 'package:seafloor/pages/terminal.dart';
import 'package:seafloor/services/ssh_device.dart';
import 'package:seafloor/utils/app_state.dart';
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


class currentPage extends StatefulWidget {
  late SSHConnection currConn;
  late bool isConnected = false;

  currentPage({super.key});

  @override
  _currPage createState() => _currPage();
}

class _currPage extends State<currentPage> {
  var selectedIndex = 0;
  Widget page = const Home();

  void setConn(SSHConnection newConn) {
    widget.currConn = newConn;
    widget.isConnected = true;
  }

  SSHConnection getConn() {
    return widget.currConn;
  }

  void setPage(int ind) {
    selectedIndex = ind;
    setState(() {
      switch (selectedIndex) {
        case 0:
          page = const Home();
          break;
        case 1:
          page = const PowerMenu();
          break;
        case 2:
          page = const SystemInfo();
          break;
        case 3:
          page = const SysProc();
          break;
        case 4:
          page = SettingsPage();
        default:
          throw UnimplementedError('no Widget for $selectedIndex');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Seafloor'),
            backgroundColor: AppState.mainColor,
          ),
          body: Container(
            color: Theme.of(context).colorScheme.inversePrimary,
            child: page,
          ),
          drawer: DrawerWidget(
            navigate: setPage,
            status: widget.isConnected,
          ),
        );
  }

  @override
  void initState(){
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
    });

  }
}

