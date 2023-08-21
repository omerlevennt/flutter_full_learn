import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button learn'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {},
              child: const Text('Save'),
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
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text(
                'Save',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.green;
                  } else {
                    return Colors.white;
                  }
                }),
              ),
              child: Text(
                'Save',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.red,
                  //shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20)),
              child: const SizedBox(
                  width: 200,
                  child: Text(
                    'Save',
                    textAlign: TextAlign.center,
                  )),
            ),
            FloatingActionButton(
              onPressed: () {
                //Servise istek at
                // sayfanin rengini degistir
              },
              child: const Icon(Icons.abc),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.abc),
              label: const Text('aa'),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8, left: 16, right: 16),
                child: Text(
                  'Place Bird',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8, bottom: 8, left: 16, right: 16),
                  child: Center(
                    child: Text(
                      'Place Bird',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
