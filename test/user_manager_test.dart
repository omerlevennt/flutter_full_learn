import 'package:flutter_full_learn/303/lesson1/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});
  test(
      'User calculate',
      () => () {
            final users = [
              GenericUser(name: 'name', id: 'id', money: 1),
              GenericUser(name: 'name', id: 'id', money: 1),
              GenericUser(name: 'name', id: 'id', money: 1),
            ];

            final userManagment = UserManagment(
              admin: AdminUser(1, name: 'name', id: 'id', money: 1),
            );
            final result = userManagment.calculateMoney(users);
            final response = userManagment.showName<String>(users);
            expect(result, 4);
          });
}
