import 'package:flutter/material.dart';

class AlertLearn extends StatefulWidget {
  const AlertLearn({super.key});

  @override
  State<AlertLearn> createState() => _AlertLearnState();
}

class _AlertLearnState extends State<AlertLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const _ImageZoomDialog();
                },
              );
            },
            child: const Text('TIKLA')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final response = await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return _UpdateDialog(context: context);
            },
          );
        },
      ),
    );
  }
}

class _UpdateDialog extends AlertDialog {
  _UpdateDialog({Key? key, required BuildContext context})
      : super(
          key: key,
          title: const Text('Version Update'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Update'),
            ),
          ],
        );
}

class _ImageZoomDialog extends StatelessWidget {
  const _ImageZoomDialog();
  final String _imgUrl = 'https://picsum.photos/200/300';
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: SizedBox(
        child: InteractiveViewer(
          child: Image.network(
            _imgUrl,
            fit: BoxFit.cover,
            height: 400,
          ),
        ),
      ),
    );
  }
}

// class _UpdateDialog extends StatelessWidget {
//   const _UpdateDialog();

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text('Version Update'),
//       actions: [
//         TextButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: const Text('Close'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             Navigator.pop(context, true);
//           },
//           child: const Text('Update'),
//         ),
//       ],
//     );
//   }
// }
