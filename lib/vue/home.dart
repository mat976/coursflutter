import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: Container(color: Colors.blueGrey, height: 50)),
        Expanded(
          flex: 1,
          child: Container(
            color: const Color.fromARGB(255, 155, 8, 128),
            height: 50,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: const Color.fromARGB(255, 182, 17, 253),
            height: 50,
          ),
        ),
      ],
    );
  }
}
