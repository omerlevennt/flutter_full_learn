import 'package:flutter/material.dart';

class PaddingLearn extends StatelessWidget {
  const PaddingLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                color: Colors.red,
                height: 100,
                width: 100,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
              child: Container(
                color: Colors.red,
                height: 100,
                width: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                      left: 10.0, right: 30, top: 10, bottom: 10) +
                  const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                color: Colors.red,
                height: 100,
                width: 100,
              ),
            ),
            Padding(
              padding: ProjectPadding.pagePaddingRightOnly +
                  ProjectPadding.pagePaddingVertical,
              child: Container(
                padding: EdgeInsets.zero,
                color: Colors.green,
                height: 100,
                width: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectPadding {
  static const pagePaddingVertical = EdgeInsets.symmetric(vertical: 10);

  static const pagePaddingRightOnly =
      EdgeInsets.only(left: 10.0, right: 30, top: 10, bottom: 10);
}
