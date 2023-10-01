import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/lesson4/state_manage/state_manage_view.dart';

abstract class StateLearnViewModel extends State<StateManageView> {
  @override
  void initState() {
    super.initState();
  }

  bool isVisible = false;
  bool isOpacity = true;
  late AnimationController controller;

  void changeOpactiy() {
    setState(() {
      isOpacity = !isOpacity;
    });
  }

  void changeVisible() {
    setState(() {
      isVisible = !isVisible;
    });
  }
}
