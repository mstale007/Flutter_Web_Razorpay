import 'package:flutter/material.dart';
import 'package:payment_gateway/views/RazorPayWeb.dart';
import 'package:payment_gateway/views/RazorPayWeb2.dart';
import 'package:payment_gateway/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RazorPayWeb(),
    );
  }
}
