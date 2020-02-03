import 'package:flutter/material.dart';
import 'package:hello_world/src/app_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo App",
      theme: ThemeData(),
      home: AppWidget(),
    );
  }
}
