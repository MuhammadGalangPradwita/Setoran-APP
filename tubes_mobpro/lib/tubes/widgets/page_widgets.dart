import 'dart:ui';

import 'package:flutter/material.dart';

class PageWidgets extends StatelessWidget {
  final Widget child;
  const PageWidgets({super.key, required this.child });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Stack(fit: StackFit.expand, children: [
        Positioned(
          right:-100,
          top: -100,
          child: _bluredCircle(),
        ),
        Positioned(
          left:-100,
          bottom: -100,
          child: _bluredCircle(),
        ),
        SafeArea(child: child)
      ],)
    );
  }

  Container _bluredCircle() {
    return Container(
          width: 200,
          height: 200,
          decoration:BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(200/2),
            ),
            child: BackdropFilter(filter: ImageFilter.blur(
              sigmaX: 100,
              sigmaY: 100,
            ),
            child: Container(),),
        );
  }
}