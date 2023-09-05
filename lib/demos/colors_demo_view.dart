import 'package:flutter/material.dart';

class ColorsDemoView extends StatefulWidget {
  const ColorsDemoView({super.key, required this.initialColor});
  final Color? initialColor;

  @override
  State<ColorsDemoView> createState() => _ColorsDemoViewState();
}

class _ColorsDemoViewState extends State<ColorsDemoView> {
  Color? _backgroundColor;
  void _changeBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  void initState() {
    super.initState();
    _backgroundColor = widget.initialColor ?? Colors.transparent;
  }

  @override
  void didUpdateWidget(covariant ColorsDemoView oldWidget) {
    super.didUpdateWidget(oldWidget);
    //inspect(widget); bug alinca kullandim
    if (widget.initialColor != _backgroundColor &&
        widget.initialColor != null) {
      _changeBackgroundColor(widget.initialColor!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      bottomNavigationBar:
          BottomNavigationBar(onTap: _colorOnTab, items: const [
        BottomNavigationBarItem(
            icon: _ColorContainer(
              color: Colors.red,
            ),
            label: 'red'),
        BottomNavigationBarItem(
            icon: _ColorContainer(color: Colors.yellow), label: 'yellow'),
        BottomNavigationBarItem(
            icon: _ColorContainer(color: Colors.blue), label: 'blue'),
      ]),
    );
  }

  void _colorOnTab(int value) {
    if (value == _MyColors.red.index) {
      _changeBackgroundColor(Colors.red);
    } else if (value == _MyColors.yellow.index) {
      _changeBackgroundColor(Colors.yellow);
    } else if (value == _MyColors.blue.index) {
      _changeBackgroundColor(Colors.blue);
    } else {
      _changeBackgroundColor(Colors.transparent);
    }
  }
}

enum _MyColors { red, yellow, blue }

class _ColorContainer extends StatelessWidget {
  const _ColorContainer({
    required this.color,
  });
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      color: color,
    );
  }
}
