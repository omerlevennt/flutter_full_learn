import 'package:flutter/material.dart';

class ScaffoldLearn extends StatelessWidget {
  const ScaffoldLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text('Scaffold samples'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      drawer: const Drawer(),
      //bottomSheet: const Text('data'),
      body: const Center(child: Text('merhaba')),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.abc_outlined), label: 'aaa'),
        BottomNavigationBarItem(icon: Icon(Icons.abc_outlined), label: 'aaaaa'),
      ]),
    );
  }
}
