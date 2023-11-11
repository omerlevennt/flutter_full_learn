// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserManagment<T extends AdminUser> {
  final T admin;

  UserManagment({required this.admin});
  void sayName(GenericUser user) {
    print(user.name);
  }

  int calculateMoney(List<GenericUser> users) {
    int sum = 0;
    for (var item in users) {
      sum += item.money;
    }
    int initialValue = admin.role == 1 ? admin.money : 0;
    final sumMoney = users.map((e) => e.money).fold<int>(
        initialValue, (previousValue, element) => previousValue + element);

    final money = users.fold<int>(initialValue,
        (previousValue, element) => previousValue + element.money);
    return money;
  }

  Iterable<VBModel<R>>? showName<R>(List<GenericUser> users) {
    if (R == String) {
      final names = users
          .map((e) => VBModel<R>(items: e.name.split('').toList().cast<R>()));
      return names;
    }
    return null;
  }
}

class VBModel<T> {
  final String name = 'VB';
  final List<T> items;

  VBModel({required this.items});
}

class GenericUser extends Equatable {
  final String name;
  final String id;
  final int money;

  const GenericUser(
      {required this.name, required this.id, required this.money});

  bool findUserName(String name) {
    return this.name == name;
  }

  @override
  String toString() => 'GenericUser(name: $name, id: $id, money: $money)';

  @override
  List<Object?> get props => [id];
}

class AdminUser extends GenericUser {
  final int role;
  const AdminUser(this.role,
      {required super.name, required super.id, required super.money});
}
