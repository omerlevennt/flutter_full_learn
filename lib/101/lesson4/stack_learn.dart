import 'package:flutter/material.dart';

class StackLearn extends StatelessWidget {
  const StackLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(
            height: 100,
            color: Colors.red,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              height: 100,
              color: Colors.blue,
            ),
          ),
          Positioned(
            bottom: 0,
            height: 100,
            width: 25,
            child: Container(color: Colors.green),
          ),
          Positioned.fill(
            bottom: 0,
            top: 100,
            child: Container(color: Colors.blue),
          )
        ],
      ),
    );
  }
}
