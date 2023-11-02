import 'package:flutter_full_learn/303/lesson1/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});
  test(
      'List best of',
      () => () {
            List<GenericUser> users = [
              GenericUser(name: 'name', id: 'id', money: 1),
              GenericUser(name: 'name', id: 'id', money: 1),
              GenericUser(name: 'name', id: 'id', money: 1),
            ];
          });
}
