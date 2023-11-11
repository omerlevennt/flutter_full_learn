import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/lesson4/lottie_learn.dart';
import 'package:flutter_full_learn/product/constants/project_constants.dart';
import 'package:flutter_full_learn/product/global/resource_context.dart';
import 'package:flutter_full_learn/product/global/theme_notifer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => ResourceContext()),
      ChangeNotifierProvider<ThemeNotifer>(create: (context) => ThemeNotifer())
    ],
    builder: (context, child) {
      return const MyApp();
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ProjectConstants.projectName,
      theme: context.watch<ThemeNotifer>().currnetTheme,
      home: const LottieLearn(),
    );
  }
}
