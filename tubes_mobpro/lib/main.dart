import 'package:flutter/material.dart';
import 'package:tubes_mobpro/tubes/pages/get_started_page.dart';
import 'package:flutter/rendering.dart';
import 'package:tubes_mobpro/tubes/pages/otp_page.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      // Jgn lupa diganti lagi

      debugShowCheckedModeBanner: false,
      home: OTPPage(),
    );
  }
}
