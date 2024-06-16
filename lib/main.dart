import 'package:flutter/material.dart';
import 'package:flutter_web_scrolling_arrow_key/solution_1.dart';
import 'package:flutter_web_scrolling_arrow_key/solution_2.dart';
import 'package:flutter_web_scrolling_arrow_key/solution_3.dart';
import 'package:flutter_web_scrolling_arrow_key/solution_4.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Example4(),
    );
  }
}

