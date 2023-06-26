import 'package:flutter/material.dart';
import 'package:seafloor/pages/about.dart';
import 'package:seafloor/pages/home.dart';
import 'package:seafloor/pages/login.dart';
import 'package:seafloor/pages/sysInfo.dart';
import 'package:seafloor/pages/terminal.dart';
import 'package:seafloor/services/ssh_device.dart';
import 'package:seafloor/widgets/menulist_main.dart';

void main() => runApp(const Seafloor());

class Seafloor extends StatefulWidget {
  const Seafloor({super.key});

  @override
  _SeafloorApp createState() => _SeafloorApp();
}

class _SeafloorApp extends State<Seafloor> {
  //info to be changed

  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Seafloor',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: currentPage(),
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
  Widget page = const AboutPage();

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
          page = Home(navigate: setPage);
          break;
        case 1:
          page = LoginPage(navigate: setPage, func2: setConn);
          break;
        case 2:
          page = const AboutPage();
          break;
        case 3:
          page = SystemInfo(connection: widget.currConn);
          break;
        case 4:
          page = terminalMain(connection: widget.currConn); //Terminal goes here
          break;
        default:
          throw UnimplementedError('no Widget for $selectedIndex');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Seafloor 0.1'),
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
      },
    );
  }
}
