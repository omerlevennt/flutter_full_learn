import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_full_learn/303/lesson3/reqres_resource/model/resource_model.dart';

abstract class IReqresService {
  IReqresService({required this.dio});
  final Dio dio;

  Future<ResourceModel?> fetchResourseItem();
}

enum _ReqresPath { resource }

class ResourceService extends IReqresService {
  ResourceService({required super.dio});

  @override
  Future<ResourceModel?> fetchResourseItem() async {
    final response = await dio.get('/${_ReqresPath.resource.name}');

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return ResourceModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}
