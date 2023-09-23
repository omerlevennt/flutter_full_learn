import 'package:flutter/material.dart';

class ColorLearn extends StatelessWidget {
  const ColorLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: ColorsItems.sulu,
        child: Text(
          'Color',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Theme.of(context).colorScheme.error),
        ),
      ),
    );
  }
}

class ColorsItems {
  static const Color porche = Color(0xffedbf61);
  static const Color sulu = Color.fromRGBO(145, 183, 43, 1);
}
