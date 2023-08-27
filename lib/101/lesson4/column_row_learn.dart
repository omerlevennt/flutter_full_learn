import 'package:flutter/material.dart';

class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
                flex: 4,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      color: Colors.blue,
                    )),
                    Expanded(
                        child: Container(
                      color: Colors.red,
                    )),
                  ],
                )),
            const Spacer(
              flex: 2,
            ),
            const Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('data1'),
                    Text('data1'),
                    Text('data1'),
                  ],
                )),
            Expanded(
                flex: 2,
                child: Container(
                  color: Colors.yellow,
                )),
            Expanded(
                flex: 2,
                child: Container(
                  color: Colors.blue,
                )),
            const SizedBox(
              height: ProjectContainerSizes.cardHeight,
              child: Column(
                children: [
                  Expanded(child: Text('data1')),
                  Expanded(child: Text('data1')),
                  Expanded(child: Text('data1')),
                  Spacer(),
                  Expanded(child: Text('data1')),
                ],
              ),
            )
          ],
        ));
  }
}

class ProjectContainerSizes {
  static const double cardHeight = 200;
}
