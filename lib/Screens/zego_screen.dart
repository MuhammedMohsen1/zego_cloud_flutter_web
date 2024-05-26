// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:zego_example/web_resources/zego_javascript.dart';


class ZegoScreen extends StatefulWidget {
  ZegoScreen({super.key});

  @override
  State<ZegoScreen> createState() => _ZegoScreenState();
}

class _ZegoScreenState extends State<ZegoScreen> {

  @override
  void initState() {
    super.initState();
    // Building Iframe when Join the Screen
    ZegoJavaScript.buildIframeContent();
  }

  @override
  Widget build(BuildContext context) {

   return const Scaffold(
    body: HtmlElementView(viewType: 'zego-meet-container'),

        
   );
  }
}
