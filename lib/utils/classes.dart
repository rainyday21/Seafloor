
class Device {
  const Device(
      {required this.username, required this.hostname, required this.port});

<<<<<<< HEAD
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
=======
  final String username, hostname;
  final int port;
>>>>>>> parent of a5f18fc (temp prior to nav rework)
}