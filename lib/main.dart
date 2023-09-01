import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/101/lesson2/color_learn.dart';
import 'package:flutter_full_learn/101/lesson4/custom_widget.dart';
import 'package:flutter_full_learn/101/lesson4/stack_learn.dart';
import 'package:flutter_full_learn/101/lesson5/state_full_learn.dart';
import 'package:flutter_full_learn/demos/stack_demo_view.dart';

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
      theme: ThemeData.dark().copyWith(
          listTileTheme:
              const ListTileThemeData(contentPadding: EdgeInsets.zero),
          progressIndicatorTheme:
              const ProgressIndicatorThemeData(color: Colors.white),
          cardTheme: CardTheme(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          errorColor: ColorsItems.sulu,
          iconTheme: const IconThemeData(color: Colors.red),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.light,
          )),
      home: const StateFullLearn(),
    );
  }
}
