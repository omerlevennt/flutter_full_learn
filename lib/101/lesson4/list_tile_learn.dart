import 'package:flutter/material.dart';
import 'package:flutter_full_learn/core/random_image.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  dense: true,
                  //contentPadding: EdgeInsets.zero,
                  title: const RandomImage(height: 100),
                  subtitle: const Text('data'),
                  onTap: () {},
                  minVerticalPadding: 0,
                  leading: const Icon(Icons.flutter_dash),
                  trailing: const Icon(Icons.chevron_right_outlined),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
