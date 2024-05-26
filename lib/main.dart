//AUTHOR: Muhammed Mohsen
import 'package:flutter/material.dart';
import 'package:zego_example/Screens/zego_screen.dart';

void main() {
  runApp(const ZegoExample());
}

class ZegoExample extends StatelessWidget {
  const ZegoExample({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  ZegoScreen(),
    );
  }
}
