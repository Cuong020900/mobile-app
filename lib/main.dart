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

class MainScreen extends StatelessWidget {
  // hàm này chuyển hướng sang settings
  void _navigateToSettings(BuildContext context) {
    Navigator.pushNamed(context, '/settings');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: GridView.count(
          childAspectRatio: (1.6 / 1),
          crossAxisSpacing: 2,
          mainAxisSpacing: 16,
          crossAxisCount: 2,
          // GridView này chia mỗi hàng làm 2 grid - chưa được 2 widget với tỉ lệ rộng/dài của mỗi Grid là 1.6/1
          // khoảng cách chiều dọc của 2 grid với nhau là 10, chiều ngang là 2
          children: [],
        ),
        decoration: BoxDecoration(
        )),
      ),
    );
  }
}
