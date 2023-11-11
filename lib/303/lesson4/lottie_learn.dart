import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/constants/duration_items.dart';
import 'package:flutter_full_learn/product/constants/lottie_items.dart';
import 'package:flutter_full_learn/product/global/theme_notifer.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../product/navigator/navigator_routes.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({super.key});

  @override
  State<LottieLearn> createState() => _LottieLearnState();
}

class _LottieLearnState extends State<LottieLearn>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool isLight = false;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: DurationItems.durationNormal());
    navigateToHome();
  }

  Future<void> navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    //Navigator.of(context).pushNamed(NavigateRoutes.home.withParaf);
    Navigator.of(context).pushReplacementNamed(NavigateRoutes.home.withParaf);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () async {
                await controller.animateTo(isLight ? 0.5 : 1);
                isLight = !isLight;
                Future.microtask(
                    () => context.read<ThemeNotifer>().changeTheme());
              },
              child: Lottie.asset(
                LottieItems.themeChance.lottiePath,
                repeat: false,
                controller: controller,
              ))
        ],
      ),
      body: const LoadingLottie(),
    );
  }
}

class LoadingLottie extends StatelessWidget {
  final String _loadingLottie =
      'https://lottie.host/d42a8f16-9bc9-42b1-a6b9-ef5f25ef3809/FQpJNafIT4.json';

  const LoadingLottie({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.network(_loadingLottie),
    );
  }
}
