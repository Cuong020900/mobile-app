import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GameModeScreen extends StatelessWidget {
  String calculation;

  GameModeScreen(this.calculation);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 100, horizontal: 0),
          child: GridView.count(
            childAspectRatio: (1.7 / 1),
            crossAxisSpacing: 2,
            mainAxisSpacing: 46,
            crossAxisCount: 2,
            // GridView này chia mỗi hàng làm 2 grid - chưa được 2 widget với tỉ lệ rộng/dài của mỗi Grid là 1.6/1
            // khoảng cách chiều dọc của 2 grid với nhau là 10, chiều ngang là 2
            children: [
              Text(""),
              Text(""),
              InkWell(
                child: Image.asset("images/Frame 19.png",
                    alignment: Alignment(0.3, -0.5)),
                onTap: () {},
              ),
              InkWell(
                child: Image.asset("images/Frame 20.png",
                    alignment: Alignment(-0.3, -0.5)),
                onTap: () {},
              ),
              InkWell(
                child: Image.asset("images/Frame 21.png",
                    alignment: Alignment(0.3, -1)),
                onTap: () {},
              ),
              InkWell(
                child: Image.asset("images/Frame 22.png",
                    alignment: Alignment(-0.3, -1)),
                onTap: () {},
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/background.png"),
          fit: BoxFit.fill,
        )),
      ),
    );
  }
}
