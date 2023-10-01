import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LightTheme {
  final _lightColor = _LightColor();
  late ThemeData theme; //en son final yap

  LightTheme() {
    theme = ThemeData(
        appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            backgroundColor: Colors.transparent,
            elevation: 0),
        scaffoldBackgroundColor: Colors.white.withOpacity(0.9),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.green,
        ),
        buttonTheme: ButtonThemeData(
            colorScheme: ColorScheme.light(
                onSecondary: _lightColor._redMania,
                onPrimary: Colors.deepPurple)),
        colorScheme: const ColorScheme.light(),
        checkboxTheme: CheckboxThemeData(
            fillColor: MaterialStateProperty.all(Colors.green),
            side: const BorderSide(color: Colors.green)),
        textTheme: ThemeData.light().textTheme.copyWith(
            labelLarge:
                TextStyle(fontSize: 14, color: _lightColor._textColor)));
  }
}

class _LightColor {
  final Color _textColor = const Color.fromARGB(255, 41, 27, 27);
  final Color _redMania = const Color.fromARGB(255, 210, 37, 37);
}




 // ThemeData.dark().copyWith(
      //     bottomAppBarTheme:
      //         const BottomAppBarTheme(shape: CircularNotchedRectangle()),
      //     tabBarTheme: const TabBarTheme(
      //         labelColor: Colors.white,
      //         unselectedLabelColor: Colors.green,
      //         indicatorSize: TabBarIndicatorSize.label),
      //     textSelectionTheme: const TextSelectionThemeData(),
      //     inputDecorationTheme: const InputDecorationTheme(
      //         filled: true,
      //         fillColor: Colors.grey,
      //         iconColor: Colors.red,
      //         labelStyle: TextStyle(
      //             color: Colors.amber,
      //             fontSize: 16,
      //             fontWeight: FontWeight.w600),
      //         border: OutlineInputBorder()),
      //     textTheme: const TextTheme(subtitle1: TextStyle(color: Colors.white)),
      //     listTileTheme:
      //         const ListTileThemeData(contentPadding: EdgeInsets.zero),
      //     progressIndicatorTheme:
      //         const ProgressIndicatorThemeData(color: Colors.white),
      //     cardTheme: CardTheme(
      //         shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(10))),
      //     errorColor: ColorsItems.sulu,
      //     iconTheme: const IconThemeData(color: Colors.red),
      //     appBarTheme: const AppBarTheme(
      //       centerTitle: true,
      //       backgroundColor: Colors.transparent,
      //       elevation: 0,
      //       systemOverlayStyle: SystemUiOverlayStyle.light,
      //     )),