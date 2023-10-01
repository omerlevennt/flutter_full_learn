import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/101/lesson2/color_learn.dart';
import 'package:flutter_full_learn/202/lesson3/enum_learn_view.dart';
import 'package:flutter_full_learn/202/lesson3/theme/light_theme.dart';
import 'package:flutter_full_learn/202/lesson3/theme_learn_view.dart';
import 'package:flutter_full_learn/demos/service_demo/fake_user_view.dart';
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
      theme: LightTheme().theme,
      home: const ThemeLearnView(),
    );
  }
}
