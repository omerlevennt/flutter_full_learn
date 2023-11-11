import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/lesson4/lottie_learn.dart';
import 'package:flutter_full_learn/303/lesson5/navigator/navigate_home_detail.dart';
import 'package:flutter_full_learn/303/lesson5/navigator/navigate_home_view.dart';
import 'package:flutter_full_learn/product/navigator/navigator_routes.dart';

mixin NavigatorCustom on Widget {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.name?.isEmpty ?? true) {
      return navigateToNormal(const LottieLearn());
    }

    final routes = routeSettings.name == NavigatorRoutes.paraf
        ? NavigateRoutes.init.withParaf
        : NavigateRoutes.values.byName(routeSettings.name!.substring(1));

    switch (routes) {
      case NavigateRoutes.init:
        return navigateToNormal(const LottieLearn());
      case NavigateRoutes.home:
        return navigateToNormal(const NavigateHomeView());
      case NavigateRoutes.detail:
        final id = routeSettings.arguments;
        return navigateToNormal(
            NavigateHomeDetail(
              id: id is String ? id : null,
            ),
            isFullScreenDialog: true);
    }

    return null;
  }

  Route<dynamic>? navigateToNormal(Widget child, {bool? isFullScreenDialog}) {
    return MaterialPageRoute(
      fullscreenDialog: isFullScreenDialog ?? false,
      builder: (context) {
        return child;
      },
    );
  }
}
