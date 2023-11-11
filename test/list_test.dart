import 'package:collection/collection.dart';
import 'package:flutter_full_learn/303/lesson1/generic_learn.dart';
import 'package:flutter_full_learn/product/widget/card/high_card.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});
  test(
      'List best of',
      () => () {
            List<GenericUser> users = [
              const GenericUser(name: 'name1', id: 'id', money: 1),
              const GenericUser(name: 'name2', id: 'id', money: 1),
              const GenericUser(name: 'name3', id: 'id', money: 1),
            ];

            List<HighCard> highCard = users
                .map((e) => HighCard(items: e.name.split('').toList()))
                .toList();

            try {
              final response = users.singleWhere(
                (element) => element.findUserName('name1'),
                orElse: () {
                  return const GenericUser(name: 'name', id: 'od', money: 1);
                },
              );
              print(response.name);
            } catch (e) {
              print(e);
            }

            print('${users.where((element) => element.money > 3)}');

            users.addAll([const GenericUser(name: 'name', id: ' ', money: 3)]);

            users.asMap();
            users.lastWhere((element) => element.id == '5');
            users.take(5);
            users.remove(const GenericUser(name: 'name1', id: 'id', money: 1));
            users.removeAt(2);
            users.removeWhere((element) => element.id == '11');
            users.indexOf(const GenericUser(name: 'name1', id: 'id', money: 1));
            final result = users.indexWhere((element) => element.id == '3');
            if (result >= 0) {
              users[result] =
                  const GenericUser(name: 'name', id: 'id', money: 11);
            }
            users.map((e) => e.money).where((element) => element > 5);

            users.expand((element) =>
                [const GenericUser(name: 'name', id: 'id', money: 12)]);
          });

  test(
      'List best of with collection',
      () => () {
            List<GenericUser> users = [
              const GenericUser(name: 'name1', id: 'id', money: 1),
              const GenericUser(name: 'name2', id: 'id', money: 1),
              const GenericUser(name: 'name3', id: 'id', money: 1),
            ];
            final response = users.singleWhereOrNull(
              (element) => element.findUserName('name1'),
            );
            users.lastWhereOrNull((element) => element.id == '5');
            users.lastOrNull;
            users.sample(2);
            print(users.first ==
                const GenericUser(name: 'name1', id: 'id', money: 1));
            print(users.contains(
                const GenericUser(name: 'name1', id: 'id', money: 1)));
            users.any((element) => element.money > 5);
            users.forEachIndexed(
              (index, element) {},
            );
            print(response);
          });
}
