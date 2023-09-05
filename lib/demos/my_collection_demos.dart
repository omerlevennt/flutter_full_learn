import 'package:flutter/material.dart';

class MyCollectionDemos extends StatefulWidget {
  const MyCollectionDemos({super.key});

  @override
  State<MyCollectionDemos> createState() => _MyCollectionDemosState();
}

class _MyCollectionDemosState extends State<MyCollectionDemos> {
  late final List<CollectionModel> _items;
  @override
  void initState() {
    super.initState();
    _items = CollectionItems().items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        padding: PaddingUtility().paddingHorizantal,
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return _CategoryCard(model: _items[index]);
        },
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    required CollectionModel model,
  }) : _model = model;

  final CollectionModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: PaddingUtility().paddingBottom,
      child: Padding(
        padding: PaddingUtility().paddingAll,
        child: Column(children: [
          Image.asset(
            _model.imagePath,
            fit: BoxFit.fill,
            height: 200,
          ),
          Padding(
            padding: PaddingUtility().paddingTop,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(_model.title), Text('${_model.price} eth')],
            ),
          )
        ]),
      ),
    );
  }
}

class CollectionModel {
  final String imagePath;
  final String title;
  final double price;

  CollectionModel(
      {required this.imagePath, required this.title, required this.price});
}

class CollectionItems {
  late final List<CollectionModel> items;
  CollectionItems() {
    items = [
      CollectionModel(
          imagePath: ProjectImages.img1, title: 'Abstract Art', price: 3.4),
      CollectionModel(
          imagePath: ProjectImages.img1, title: 'Abstract Art2', price: 3.4),
      CollectionModel(
          imagePath: ProjectImages.img1, title: 'Abstract Art3', price: 3.4),
      CollectionModel(
          imagePath: ProjectImages.img1, title: 'Abstract Art4', price: 3.4),
      CollectionModel(
          imagePath: ProjectImages.img1, title: 'Abstract Art5', price: 3.4),
    ];
  }
}

class PaddingUtility {
  final paddingAll = const EdgeInsets.all(10.0);
  final paddingTop = const EdgeInsets.only(top: 10.0);
  final paddingHorizantal = const EdgeInsets.symmetric(horizontal: 20.0);
  final paddingBottom = const EdgeInsets.only(bottom: 40.0);
}

class ProjectImages {
  static const String img1 = 'assets/png/img.png';
}
