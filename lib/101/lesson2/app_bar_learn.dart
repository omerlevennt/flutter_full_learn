import 'package:flutter/material.dart';

class AppBarLearn extends StatelessWidget {
  const AppBarLearn({super.key});
  final String title = 'Welcome Learn';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        title: Text(title),
        leadingWidth: 56,
        leading: const Icon(Icons.arrow_back_ios),
        toolbarTextStyle: const TextStyle(color: Colors.amber),
        actionsIconTheme: const IconThemeData(color: Colors.red, size: 24),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
          // const Center(child: CircularProgressIndicator())
        ],
      ),
    );
  }
}
