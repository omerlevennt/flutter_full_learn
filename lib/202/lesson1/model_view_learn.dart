import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/lesson1/model_learn.dart';

class ModelViewLearn extends StatefulWidget {
  const ModelViewLearn({super.key});

  @override
  State<ModelViewLearn> createState() => _ModelViewLearnState();
}

class _ModelViewLearnState extends State<ModelViewLearn> {
  var user9 = PostModel8(body: 'a');
  @override
  void initState() {
    super.initState();

    final user1 = PostModel1()
      ..title = 'omer'
      ..id = 1;
    user1.id = 0;
    user1.body = 'hello';

    final user2 = PostModel2(1, 2, 'title', 'body');
    user2.body = '';

    final user3 = PostModel3(1, 2, 'title', 'body');
    //user3.body = '';//final oldugu icin degisikligi yapamazsin

    //localde best
    final user4 = PostModel4(userId: 1, id: 2, title: 'title', body: 'body');
    //user4.body = '';//final oldugu icin degisikligi yapamazsin

    final user5 = PostModel5(userId: 1, id: 2, title: 'title', body: 'body');
    //user5.//user5 ile ilgili hicbir ozellik goremez,
    //Encapsulation yaparak gorebilir
    print(user5.userId);

    final user6 = PostModel6(userId: 1, id: 2, title: 'title', body: 'body');
    //user6.//user5 ile ilgili hicbir ozellik goremez,

    final user7 = PostModel7();

    //service best
    final user8 = PostModel8(body: 'a');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // user9 = PostModel8(title: 'On Pressed');
            user9 = user9.copyWith(title: 'omer');
            user9.updateBody('Veli');
          });
        },
      ),
      appBar: AppBar(
        title: Text(user9.body ?? 'Not has any data'),
      ),
    );
  }
}
