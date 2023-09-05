import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/101/lesson2/color_learn.dart';
import 'package:flutter_full_learn/101/lesson6/navigator_learn.dart';
import 'package:flutter_full_learn/product/language/language_items.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: LanguageItems.appTitle,
      theme: ThemeData.dark().copyWith(
          textSelectionTheme: const TextSelectionThemeData(),
          inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: Colors.grey,
              iconColor: Colors.red,
              labelStyle: TextStyle(
                  color: Colors.amber,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
              border: OutlineInputBorder()),
          textTheme: const TextTheme(subtitle1: TextStyle(color: Colors.red)),
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
      home: const NavigatorLearn(),
    );
  }
}
