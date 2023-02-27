import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/pages/home_page.dart';
import 'package:todo/pages/search_page.dart';

import 'config/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TODO',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: bgcolor,
      ),
      home: HomePage(),
      // home: SearchPage(),
    );
  }
}
