import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_full_learn/303/lesson5/mobx/model/image_upload_response.dart';

class ImageUploadService {
  final Dio dio;
// https://firebasestorage.googleapis.com/v0/b/fluttertr-ead5c.appspot.com
  ImageUploadService(this.dio);
// https://firebasestorage.googleapis.com/v0/b/{{image_server}}/o/full%2Fvb.png
  Future<ImageUploadResponse?> uploadToImageServer(
      Uint8List byteArray, String name,
      {void Function(int, int)? onSendProgress}) async {
    // final formData =
    //     FormData.fromMap({'file': MultipartFile.fromBytes(byteArray)});

    final response = await dio.post(
      'full%2F/$name.png',
      data: byteArray,
      onSendProgress: (int count, int total) {},
    );

    if (response.statusCode == HttpStatus.ok) {
      //final responseData == null check
      return ImageUploadResponse.fromJson(response.data);
    }
    return null;
  }
}
