import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/lesson4/image_learn.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({super.key});

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> with ProductSheetMixin {
  final Color _backgroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          onPressed: () {
            showCustomSheet(context, const ImageLearn());
          },
          child: const Text('Show'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.share),
      ),
    );
  }
}

mixin ProductSheetMixin {
  Future<T?> showCustomSheet<T>(BuildContext context, Widget child) async {
    return await showModalBottomSheet<T>(
      //isScrollControlled: true,
      //barrierColor: Colors.transparent,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
      context: context,
      builder: (context) {
        return CustomMainSheet(child: child);
      },
    );
  }
}

class CustomMainSheet extends StatelessWidget {
  const CustomMainSheet({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _BaseSheetHeader(),
          Expanded(child: child),
        ],
      ),
    );
  }
}

class _BaseSheetHeader extends StatelessWidget {
  const _BaseSheetHeader();

  final double _gripHeight = 30.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _gripHeight,
      child: Stack(
        children: [
          Positioned(
              top: 5,
              right: 16,
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.close))),
          Divider(
            color: Colors.black,
            thickness: 3,
            indent: MediaQuery.sizeOf(context).width * 0.45,
            endIndent: MediaQuery.sizeOf(context).width * 0.45,
          ),
        ],
      ),
    );
  }
}


// class _SheetExample extends StatefulWidget {
//   const _SheetExample();

//   @override
//   State<_SheetExample> createState() => _SheetExampleState();
// }

// class _SheetExampleState extends State<_SheetExample> {
//   Color _backgroundColor = Colors.transparent;
//   final double _gripHeight = 30.0;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           SizedBox(
//             height: _gripHeight,
//             child: Stack(
//               children: [
//                 Positioned(
//                     top: 5,
//                     right: 16,
//                     child: InkWell(
//                         onTap: () {
//                           Navigator.of(context).pop();
//                         },
//                         child: const Icon(Icons.close))),
//                 Divider(
//                   color: Colors.black,
//                   thickness: 3,
//                   indent: MediaQuery.sizeOf(context).width * 0.45,
//                   endIndent: MediaQuery.sizeOf(context).width * 0.45,
//                 ),
//               ],
//             ),
//           ),
//           const Text('data'),
//           Image.network('https://picsum.photos/200/300'),
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 _backgroundColor = Colors.amber;
//               });
//               Navigator.of(context).pop<bool>(true);
//             },
//             child: const Text('Ok'),
//           ),
//         ],
//       ),
//     );
//   }
// }