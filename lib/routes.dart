import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile_app/stores/user_store.dart';
import 'package:mobile_app/ui/login/login.dart';

class Routes {
  Routes._();

  static const String home = '/home';
  static const String login = '/login';

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => LoginScreen(),
    login: (BuildContext context) => LoginScreen(),
    "/": (BuildContext context) => FutureBuilder(
          // This is my async call to sharedPrefs
          future: Provider.of<UserStore>(context).autoLogin(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                {
                  // When the future is done I show either the LoginScreen
                  // or the requested Screen depending on AuthState
                  if (snapshot.data == true) {
                    return LoginScreen();
                  }
                  return LoginScreen();
                }
              default:
                {
                  // I return an empty Container as long as the Future is not resolved
                  return Container();
                }
            }
          },
        ),
  };
}
