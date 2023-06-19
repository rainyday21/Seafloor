import 'package:flutter/material.dart';
import 'package:seafloor/pages/about.dart';
import 'package:seafloor/pages/home.dart';
import 'package:seafloor/pages/login.dart';
import 'package:seafloor/pages/sysInfo.dart';
import 'package:seafloor/pages/terminal.dart';

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
      home: const currentPage(),
    );
  }
}

class currentPage extends StatefulWidget {
  const currentPage({super.key});

  @override
  _currPage createState() => _currPage();
}

class _currPage extends State<currentPage> {
  var selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    Widget page = const Home();
    switch (selectedIndex) {
      case 0:
        page = const Home();
        break;
      case 1:
        page = const terminalMain(); //Terminal goes here
        break;
      case 2:
        page = const SystemInfo();
        break;
      case 3:
        page = const LoginPage();
      case 4:
        page = const AboutPage();
      default:
        throw UnimplementedError('no Widget for $selectedIndex');
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            title: const Text('Seafloor 0.1'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
          ),
          body: Row(
            children: <Widget>[
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 600,
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.menu_open),
                      label: Text('Terminal'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.settings),
                      label: Text('System Information'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.key),
                      label: Text('Login'),
                    ),
                    NavigationRailDestination(
                        icon: Icon(Icons.info), label: Text('About')),
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                      print('Selected index is $selectedIndex');
                    });
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  child: page,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
