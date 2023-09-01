import 'package:flutter/material.dart';

class StateFullLearn extends StatefulWidget {
  const StateFullLearn({super.key});
  //degismez bir widget
  //Disaridan parametre alir. Data alma-verme kismi
  @override
  State<StateFullLearn> createState() => _StateFullLearnState();
}

class _StateFullLearnState extends State<StateFullLearn> {
  int _counterValue = 0;
  // void incrementValue() {
  //   setState(() {
  //     _counterValue += 1;
  //   });
  // }

  // void deincrementValue() {
  //   setState(() {
  //     _counterValue -= 1;
  //   });
  // }
//Gelismis kod
  void _uptadeCounter(bool isIcrement) {
    if (isIcrement) {
      setState(() {
        _counterValue += 1;
      });
    } else {
      setState(() {
        _counterValue -= 1;
      });
    }
  }

  //Hayat belirleme kismi , logic yazacagimiz kisim
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _incramentButton(),
          _deincramentButton(),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              '$_counterValue',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          const Placeholder()
        ],
      ),
    );
  }

  FloatingActionButton _incramentButton() {
    return FloatingActionButton(
      onPressed: () {
        _uptadeCounter(true);
      },
      child: const Icon(Icons.add),
    );
  }

  Padding _deincramentButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: FloatingActionButton(
        onPressed: () {
          _uptadeCounter(false);
        },
        child: const Icon(Icons.remove),
      ),
    );
  }
}
