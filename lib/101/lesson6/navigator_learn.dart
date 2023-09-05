import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/lesson6/navigate_detail_learn.dart';

class NavigatorLearn extends StatefulWidget {
  const NavigatorLearn({super.key});

  @override
  State<NavigatorLearn> createState() => _NavigatorLearnState();
}

class _NavigatorLearnState extends State<NavigatorLearn>
    with _NavigatorManager {
  List<int> selectedItems = [];

  void addSelected(int index, bool isAdd) {
    setState(() {
      isAdd ? selectedItems.add(index) : selectedItems.remove(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToWidget(context, const NavigateDetailLearn());
        },
        child: const Icon(Icons.chevron_right),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TextButton(
            onPressed: () async {
              final response = await navigateToWidgetNormal<bool>(
                  context,
                  NavigateDetailLearn(
                    isOkey: selectedItems.contains(index),
                  ));

              if (response is bool) {
                addSelected(index, response);
              }
            },
            child: Placeholder(
              color: selectedItems.contains(index) ? Colors.green : Colors.red,
            ),
          );
        },
      ),
    );
  }
}

mixin _NavigatorManager {
  void navigateToWidget(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) {
            return widget;
          },
          fullscreenDialog: true,
          settings: const RouteSettings()),
    );
  }

  Future<T?> navigateToWidgetNormal<T>(BuildContext context, Widget widget) {
    return Navigator.of(context).push<T>(
      MaterialPageRoute(
          builder: (context) {
            return widget;
          },
          //fullscreenDialog: true,
          settings: const RouteSettings()),
    );
  }
}
