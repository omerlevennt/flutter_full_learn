import 'package:flutter/material.dart';
import 'package:flutter_full_learn/404/bloc/feature/login/view/login_view.dart';
import 'package:flutter_full_learn/product/constants/project_constants.dart';
import 'package:flutter_full_learn/product/global/resource_context.dart';
import 'package:flutter_full_learn/product/global/theme_notifer.dart';
import 'package:flutter_full_learn/product/navigator/navigator_custom.dart';
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

class MyApp extends StatelessWidget with NavigatorCustom {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ProjectConstants.projectName,
      theme: context.watch<ThemeNotifer>().currnetTheme,
      home: const LoginView(),
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: child ?? const SizedBox());
      },
      //initialRoute: '/',
      //routes: NavigatorRoutes().items,
      // navigatorKey: NavigatorManager.instance.navigatorGlobalKey,
      // onGenerateRoute: onGenerateRoute,
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return const LottieLearn();
      //     },
      //   );
      // },
    );
  }
}
