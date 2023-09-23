import 'package:flutter/material.dart';

class RefreshIndicatorLearn extends StatefulWidget {
  const RefreshIndicatorLearn({super.key});

  @override
  State<RefreshIndicatorLearn> createState() => _RefreshIndicatorLearnState();
}

class _RefreshIndicatorLearnState extends State<RefreshIndicatorLearn> {
  List<String> items = List.generate(5, (index) => 'Öğe ${index + 1}');

  // Liste yenileme işlemini gerçekleştirin
  Future<void> _refreshList() async {
    await Future.delayed(const Duration(
        seconds:
            1)); // Yenileme işlemi için bir bekleme süresi ekleyin (örneğin 2 saniye)
    setState(() {
      // Yeni verileri ekleyebilir veya mevcut verileri güncelleyebilirsiniz
      items = List.generate(5, (index) => 'Yenilendi ${index + 1}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RefreshIndicator Örneği'),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshList,
        color: Colors.blue, // Yenileme animasyonunun rengini ayarlayın
        backgroundColor: Colors.white, // Yenileme arka plan rengini ayarlayın
        displacement:
            40.0, // Yenileme işlemi sırasında indikçe ne kadar mesafe kaydırılacağını ayarlayın
        strokeWidth:
            3.0, // Yenileme işlemi sırasında animasyonun kalınlığını ayarlayın
        semanticsLabel:
            'Yenileme işlemi', // Erişilebilirlik için metin etiketi ekleyin
        semanticsValue:
            'Yenileniyor', // Erişilebilirlik için metin değeri ekleyin
        notificationPredicate: (ScrollNotification notification) {
          // Yenileme işlemi başlamadan önce bildirimleri kontrol etmek için bir işlev ekleyin
          return true;
        },
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]),
            );
          },
        ),
      ),
    );
  }
}
