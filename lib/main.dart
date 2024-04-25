import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/HomePage.dart';
import 'package:flutter_application_1/pages/SecondPage.dart';
import 'package:flutter_application_1/pages/ThirdPage.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/secondPage': (context) => const SecondPage(),
        '/thirdPage': (context) => const ThirdPage(),
      },
    );
  }
}
