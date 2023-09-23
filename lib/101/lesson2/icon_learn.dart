import 'package:flutter/material.dart';

class IconLearn extends StatelessWidget {
  IconLearn({super.key});
  final IconsSizes iconSize = IconsSizes();
  final IconColor iconColor = IconColor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icon Learn'),
      ),
      body: Column(
        children: [
          Icon(
            Icons.ac_unit,
            size: iconSize.iconSmall,
          ),
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(Icons.flutter_dash_outlined,
                  size: iconSize.iconMid, color: iconColor.red)),
          SizedBox(
            height: iconSize.iconMid,
          ),
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(Icons.flutter_dash_outlined,
                  size: IconsSizes.iconLarge,
                  color: Theme.of(context).colorScheme.error)),
        ],
      ),
    );
  }
}

class IconsSizes {
  final double iconSmall = 80;
  final double iconMid = 120;
  static const double iconLarge = 120;
}

class IconColor {
  final Color red = Colors.purple;
}
