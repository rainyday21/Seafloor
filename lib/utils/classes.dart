import 'package:flutter/material.dart';

class MainTheme {
    static const Color mainColor = Colors.lightBlue;
    static const Color secondaryColor = Colors.blueGrey;
    static const Color errorColor = Color.fromRGBO(217, 48, 37, 1.0);
    static const Color deleteColor = Color.fromRGBO(190, 0, 0, 1.0);

}

class AppState {
    static Color mainColor = MainTheme.mainColor;
    static Color secondaryColor = MainTheme.secondaryColor;
    static ThemeMode currentTheme = ThemeMode.light;
    static bool isDark = false;

    static ThemeMode getTheme(){
        return AppState.isDark ? ThemeMode.dark : ThemeMode.light;
    }

    static void updateTheme() {
        currentTheme = getTheme();
    }

    static void updatePrimary(Color c){

    }
}