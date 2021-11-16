import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Home Price Prediction',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(14, 42, 71, 1),
        fontFamily: 'Prompt',
      ),
      home: HomeScreen(),
    );
  }
}
