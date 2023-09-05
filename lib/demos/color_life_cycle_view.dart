import 'package:flutter/material.dart';
import 'package:flutter_full_learn/demos/colors_demo_view.dart';

class ColorLifeCycleView extends StatefulWidget {
  const ColorLifeCycleView({super.key});

  @override
  State<ColorLifeCycleView> createState() => _ColorLifeCycleViewState();
}

class _ColorLifeCycleViewState extends State<ColorLifeCycleView> {
  Color? _backGroundColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: _changeBackgroundColor, icon: const Icon(Icons.clear))
        ],
      ),
      body: Column(
        children: [
          const Spacer(),
          Expanded(
            child: ColorsDemoView(
              initialColor: _backGroundColor,
            ),
          )
        ],
      ),
    );
  }

  void _changeBackgroundColor() {
    setState(() {
      _backGroundColor = Colors.pink;
    });
  }
}
