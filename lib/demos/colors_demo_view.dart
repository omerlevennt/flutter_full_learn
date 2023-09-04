import 'package:flutter/material.dart';

class ColorsDemoView extends StatefulWidget {
  const ColorsDemoView({super.key});

  @override
  State<ColorsDemoView> createState() => _ColorsDemoViewState();
}

class _ColorsDemoViewState extends State<ColorsDemoView> {
  Color _backgroundColor = Colors.transparent;
  void _changeBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            if (value == 0) {
              _changeBackgroundColor(Colors.red);
            } else if (value == 1) {
              _changeBackgroundColor(Colors.yellow);
            } else {
              _changeBackgroundColor(Colors.blue);
            }
          },
          items: const [
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
}

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
