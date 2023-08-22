import 'package:flutter/material.dart';

class SizedBoxLearn extends StatelessWidget {
  const SizedBoxLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Text('data' * 500),
          ),
          const SizedBox.shrink(),
          SizedBox.square(
            dimension: 50,
            child: Text('sssss' * 50),
          ),
          Container(
            width: 50,
            height: 50,
            constraints: const BoxConstraints(maxWidth: 500, minWidth: 100),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: ProjectUtility.boxDecoration,
            child: Text('a' * 100),
          )
        ],
      ),
    );
  }
}

class ProjectUtility {
  static BoxDecoration boxDecoration = BoxDecoration(
      color: Colors.red,
      //shape: BoxShape.circle,
      gradient: const LinearGradient(colors: [Colors.red, Colors.black]),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      boxShadow: const [
        BoxShadow(
          color: Colors.green,
          offset: Offset(0.1, 1),
          blurRadius: 10,
        ),
      ],
      border: Border.all(width: 10, color: Colors.white12));
}

class ProjectConteinarDecaration extends BoxDecoration {
  ProjectConteinarDecaration()
      : super(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.green,
                offset: Offset(0.1, 1),
                blurRadius: 10,
              ),
            ],
            border: Border.all(width: 10, color: Colors.white12));
}
