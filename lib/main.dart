import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:mobile_app/stores/user_store.dart';
import 'package:provider/provider.dart';
import 'package:mobile_app/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserStore()),
      ],
      child: MobileApp(),
    ),
  );
}

class MobileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mobile App",
      initialRoute: "/home",
      routes: Routes.routes,
    );
  }
}