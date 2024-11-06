import 'package:flutter/material.dart';
import 'package:tubes_mobpro/tubes/pages/get_started_page.dart';
import 'package:flutter/rendering.dart';

import 'package:tubes_mobpro/tubes/pages/search_result_page.dart';

import 'package:tubes_mobpro/tubes/pages/search_result_page.dart';

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
      debugShowCheckedModeBanner: false,
      home: GetStartedPage(),
    );
  }
}
