import 'package:flutter/material.dart';

class ImageLearn extends StatelessWidget {
  const ImageLearn({super.key});
  final String _imageUrl = 'https://picsum.photos/200/300';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: SizedBox(
              height: 300,
              child: PngImage(
                name: ImageItemsName.imageName,
              )),
        ),
        Image.network(
          _imageUrl,
          errorBuilder: (context, error, stackTrace) => const Placeholder(),
        )
      ]),
    );
  }
}

class ImageItems {
  static const String image = 'assets/png/img.png';
}

class ImageItemsName {
  static const String imageName = 'img';
}

class PngImage extends StatelessWidget {
  const PngImage({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _nameWithPath,
      fit: BoxFit.cover,
    );
  }

  String get _nameWithPath => 'assets/png/$name.png';
}
