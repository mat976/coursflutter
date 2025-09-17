import 'package:flutter/material.dart';
import 'package:coursflutter/vue/home.dart';
import 'package:coursflutter/vue/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'Schyler'),
      home: const NavigationBarApp(),
    );
  }
}
