import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/scaffold_learn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Full Learn',
      theme: ThemeData.dark(),
      home: const ScaffoldLearn(),
    );
  }
}
