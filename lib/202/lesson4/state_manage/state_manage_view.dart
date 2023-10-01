import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/lesson4/state_manage/state_learn_view_model.dart';

class StateManageView extends StatefulWidget {
  const StateManageView({super.key});

  @override
  State<StateManageView> createState() => _StateManageViewState();
}

class _StateManageViewState extends StateLearnViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeOpactiy();
          changeVisible();
        },
      ),
      appBar: AppBar(
        backgroundColor: isOpacity ? Colors.blue : Colors.amber,
        shadowColor: isVisible ? Colors.black : Colors.white,
      ),
    );
  }
}
