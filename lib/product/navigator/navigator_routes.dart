import 'package:flutter_full_learn/303/lesson4/lottie_learn.dart';
import 'package:flutter_full_learn/303/lesson5/navigator/navigate_home_detail.dart';
import 'package:flutter_full_learn/303/lesson5/navigator/navigate_home_view.dart';

class NavigatorRoutes {
  static const paraf = '/';
  final items = {
    paraf: (context) {
      return const LottieLearn();
    },
    NavigateRoutes.home.withParaf: (context) {
      return const NavigateHomeView();
    },
    NavigateRoutes.detail.withParaf: (context) {
      return const NavigateHomeDetail();
    }
  };
}

enum NavigateRoutes { init, home, detail }

extension NavigateRoutesExtension on NavigateRoutes {
  String get withParaf => '/$name';
}
