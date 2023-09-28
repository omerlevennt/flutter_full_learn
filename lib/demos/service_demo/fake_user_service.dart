import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_full_learn/demos/service_demo/fake_user_model.dart';

abstract class IFakeStoreService {
  Future<List<UserModel>?> fetchFakeUserItems();
}

class FakeUserService implements IFakeStoreService {
  final Dio _networkManager;
  FakeUserService()
      : _networkManager =
            Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

  @override
  Future<List<UserModel>?> fetchFakeUserItems() async {
    try {
      final response =
          await _networkManager.get(_FakeUserServicePath.users.name);

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is List) {
          return _datas.map((e) => UserModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception, this);
    }
    return null;
  }
}

enum _FakeUserServicePath { users }

class _ShowDebug {
  static void showDioError<T>(DioError error, T type) {
    if (kDebugMode) {
      print(error.message);
      print(type);
      print('-------');
    }
  }
}
