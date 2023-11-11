import 'package:dio/dio.dart';

class ProjectNetworkManager {
  ProjectNetworkManager._() {
    _dio = Dio(BaseOptions(baseUrl: 'vb10'));
    _dio.options = BaseOptions();
  }
  late final Dio _dio;

  static ProjectNetworkManager instance = ProjectNetworkManager._();
  Dio get service => _dio;

  void addBaseHeaderToToken(String token) {
    _dio.options = _dio.options.copyWith(headers: {"Authorization": token});
  }
}
