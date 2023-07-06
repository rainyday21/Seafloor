import 'package:flutter/material.dart';

class MenuListTileWidget extends StatefulWidget {
  MenuListTileWidget({super.key, required this.status, required this.navigate});
  final Function navigate;
  bool status;
  @override
  State<MenuListTileWidget> createState() => _MenuListTileWidgetState();
}

class _MenuListTileWidgetState extends State<MenuListTileWidget> {
  //Widget addition = ;

  /*void setOption() {
    if (widget.status) {
      addition = ConnectedTiles(navigate: widget.navigate);
    } else {
      addition = const ListBody();
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListBody(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.key_outlined),
              title: const Text('Log out'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                widget.navigate(0);
              },
            ),
          ],
        ),
        const Divider(),
        ConnectedTiles(navigate: widget.navigate),
      ],
    );
  }
}

class ConnectedTiles extends StatelessWidget {
  ConnectedTiles({super.key, required this.navigate});

  final Function navigate;
  ListBody addition = const ListBody();

  @override
  Widget build(BuildContext context) {
    return ListBody(
      children: [
        ListTile(
          leading: const Icon(Icons.line_weight_sharp),
          title: const Text('View System Information'),
          onTap: () {
            Navigator.pop(context);
            navigate(2);
          },
        ),
        ListTile(
          leading: const Icon(Icons.menu_open),
          title: const Text('Processes'),
          onTap: () {
            Navigator.pop(context);
            navigate(3);
          },
        ),
        ListTile(
          leading: const Icon(Icons.power_settings_new_outlined),
          title: const Text('Power Menu'),
          onTap: () {
            Navigator.pop(context);
            navigate(1);
          },
        ),
      ],
    );
  }
}

class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key, required this.navigate, required this.status});

  final Function navigate;
  bool status;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(top: 16.0),
          children: <Widget>[
            MenuListTileWidget(
              navigate: navigate,
              status: status,
            ),
          ],
        ),
      ),
    );
  }
}
