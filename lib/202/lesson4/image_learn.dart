import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/global/resource_context.dart';
import 'package:provider/provider.dart';

class ImageLearn extends StatefulWidget {
  const ImageLearn({super.key});

  @override
  State<ImageLearn> createState() => _ImageLearnState();
}

class _ImageLearnState extends State<ImageLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.read<ResourceContext>().clear();
              },
              icon: const Icon(Icons.remove))
        ],
        title: Text(
            context.read<ResourceContext>().model?.data?.length.toString() ??
                ''),
      ),
      body: ImagePath.img.toWidget(height: 100),
    );
  }
}

enum ImagePath { img }

extension ImagePathExtension on ImagePath {
  String path() {
    return 'assets/png/$name.png';
  }

  Widget toWidget({double height = 24}) {
    return Image.asset(
      path(),
      height: height,
    );
  }
}
