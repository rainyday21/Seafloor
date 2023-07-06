import 'package:flutter/material.dart';
import 'package:seafloor/utils/classes.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.navigate});

  final Function navigate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                  ),
                  const TitleWidget(),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      ServicesSection(
                        navigate: navigate,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      /*floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.menu_book),
      ),*/
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        text: 'Welcome to Seafloor!',
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.blueGrey,
          decoration: TextDecoration.none,
          decorationColor: Colors.deepOrangeAccent,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class AddMenu extends StatefulWidget {
  const AddMenu({super.key});

  @override
  State<AddMenu> createState() => _AddMenuState();
}

class _AddMenuState extends State<AddMenu> {
  @override
  Widget build(BuildContext context) {
    return const Column();
  }
}

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key, required this.navigate});

  final Function navigate;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Services',
          style: TextStyle(
            color: Theme.of(context).primaryColorDark,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
        ),
        Column(
          children: [
            TextButton.icon(
              onPressed: () {
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    )); */
                navigate(1);
              },
              icon: const Icon(Icons.add),
              label: const Text('Log in to new Device'),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
            ),
            TextButton.icon(
              icon: const Icon(
                Icons.menu_open,
                color: Colors.lightGreen,
              ),
              onPressed: () {
                navigate(3);
              },
              label: const Text('SSH Terminal'),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
            ),
            TextButton.icon(
              onPressed: () {
                navigate(4);
              },
              label: const Text('View System Info'),
              icon: const Icon(
                Icons.settings_outlined,
                color: Colors.blueGrey,
              ),
            ),
          ],
        )
      ],
    );
  }
}

