import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button learn'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {},
            child: Text('Save'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Save'),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.abc),
          ),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.abc),
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text('Save'),
          ),
          InkWell(onTap: () {}, child: const Text('data')),
          const ElevatedButton(
            onPressed: null,
            child: Text('Save'),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Save',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
