import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({super.key});
  final String _name = 'ali';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Card(
            margin: ProjectMargin.cardMargin,
            child: SizedBox(
              height: 100,
              width: 200,
            ),
          ),
          Card(
            color: Theme.of(context).errorColor,
            shape: const StadiumBorder(),
            child: const SizedBox(
              height: 100,
              width: 200,
            ),
          ),
          Card(
            color: Theme.of(context).errorColor,
            shape: const CircleBorder(),
            child: const SizedBox(
              height: 100,
              width: 200,
            ),
          ),
          _customCard(
            child: SizedBox(
              height: 100,
              width: 200,
              child: Center(
                  child: Text(
                _name,
                style: Theme.of(context).textTheme.displayMedium,
              )),
            ),
          ),
          _customCard(
            child: SizedBox(
              height: 100,
              width: 200,
              child: Center(
                  child: Text(
                _name,
                style: Theme.of(context).textTheme.displayMedium,
              )),
            ),
          ),
        ],
      ),
    );
  }
}

class _customCard extends StatelessWidget {
  _customCard({
    super.key,
    required this.child,
  });

  final Widget child;
  final roundedRectangleBorder =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).errorColor,
        shape: roundedRectangleBorder,
        child: child);
  }
}

class ProjectMargin {
  static const cardMargin = EdgeInsets.all(10);
}
