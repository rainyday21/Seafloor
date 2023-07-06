import 'package:flutter/material.dart';
import 'package:seafloor/main.dart';
import 'package:settings_ui/settings_ui.dart';

import '../utils/app_state.dart';

class SettingsPage extends StatefulWidget{

  @override
  State<SettingsPage> createState() => _settingsPage();

}

class _settingsPage extends State<SettingsPage>{
  var mainSlide = [
    AppState.mainColor.red,
    AppState.mainColor.green,
    AppState.mainColor.blue
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Column(
            children: [
              Text(
                  'Settings Page',
                  style: TextStyle(
                    color: AppState.secondaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
              ),
              const Padding(padding: EdgeInsets.all(16.0),),
              SettingsList(
                sections: [
                SettingsSection(
                  title: const Text("Themes"),
                  tiles: <AbstractSettingsTile>[
                    SettingsTile.switchTile(
                      onToggle: (value) {
                        setState(() async {
                          // Toggle dark mode and update theme.
                          setState(() {
                            AppState.isDark = !AppState.isDark;
                          });
                        });
                      },
                      initialValue: AppState.isDark,
                      leading: const Icon(Icons.dark_mode),
                      title: const Text("Dark Mode"),
                    ),
                    CustomSettingsTile(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Red',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.red,
                              ),
                            ),
                            Slider(
                                max: 255.0,
                                divisions: 255,
                                label: mainSlide[0].toString(),
                                value: mainSlide[0].toDouble(),
                                activeColor: Colors.redAccent,
                                onChanged: (val) {
                                  setState(() {
                                    //widget._mainColor.withRed(val.toInt());
                                    mainSlide[0] = val.toInt();
                                  });
                                }),
                          ],
                        )),
                    CustomSettingsTile(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Green',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.green,
                              ),
                            ),
                            Slider(
                                max: 255.0,
                                divisions: 255,
                                label: mainSlide[1].toString(),
                                value: mainSlide[1].toDouble(),
                                activeColor: Colors.greenAccent,
                                onChanged: (val) {
                                  setState(() {
                                    //widget._mainColor.withGreen(val.toInt());
                                    mainSlide[1] = val.toInt();
                                  });
                                }),
                          ],
                        )),
                    CustomSettingsTile(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Blue',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.blue,
                              ),
                            ),
                            Slider(
                                max: 255.0,
                                divisions: 255,
                                label: mainSlide[2].toString(),
                                value: mainSlide[2].toDouble(),
                                activeColor: Colors.blueAccent,
                                onChanged: (val) {
                                  setState(() {
                                    //widget._mainColor.withBlue(val.toInt());
                                    mainSlide[2] = val.toInt();
                                  });
                                }),
                          ],
                        )),
                    CustomSettingsTile(
                        child: Container(
                          color: Color.fromRGBO(
                              mainSlide[0], mainSlide[1], mainSlide[2], 1),
                          height: 35,
                        )),
                    SettingsTile.navigation(
                      title: const Text('Apply'),
                      onPressed: (context) {
                        super.setState(() {
                          AppState.updatePrimary(Color.fromRGBO(
                              mainSlide[0], mainSlide[1], mainSlide[2], 1));
                        });
                      },
                    ),

                  ],
                ),
                ],
              ),
            ],
        ),
      )

    );
  }
}