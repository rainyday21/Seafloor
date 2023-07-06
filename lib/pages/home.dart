import 'package:flutter/material.dart';
import 'package:seafloor/utils/app_state.dart';
import 'package:ssh2/ssh2.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
                  Container(
                    alignment: Alignment.topCenter,
                    child: const SafeArea(
                      child: SingleChildScrollView(
                          child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text(
                              'About me',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(16.0),
                            ),
                            Text('''
Orrane Reid
Cal Poly Pomona
CS 4750
''')
                          ],
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
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
          color: MainTheme.mainColor,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
