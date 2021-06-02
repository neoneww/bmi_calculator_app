import 'package:flutter/material.dart';
import 'input_page.dart';

class Screen2 extends StatelessWidget {
  
  double calcAns(int weight, int height) {
    height = (height / 100).round();
    double temp = weight / (height * height);
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1D1E33),
        title: Text(
          'RESULT',
        ),
      ),
      body: Center(
        child: Text(
          calcAns(weight, height).toString(),
          style: TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
