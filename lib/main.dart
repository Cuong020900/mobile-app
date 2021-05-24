import 'package:flutter/material.dart';
import 'package:mobile_app/routes/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MobileApp());
}

class MobileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      initialRoute: '/',
      routes: getRouter(),
    );
  }
}
