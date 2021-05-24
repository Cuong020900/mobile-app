import 'package:mobile_app/main.dart';
import 'package:mobile_app/screens/SettingScreen.dart';

getRouter() {
  return {
    '/': (context) => MainScreen(),
    '/settings': (context) => SettingsScreen(),
  };
}
