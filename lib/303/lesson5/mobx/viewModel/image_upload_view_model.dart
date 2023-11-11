import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_full_learn/303/lesson5/mobx/model/image_upload_response.dart';
import 'package:flutter_full_learn/303/lesson5/mobx/service/image_upload_sevice.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'image_upload_view_model.g.dart';

class ImageUploadViewModel = _ImageUploadViewModelBase
    with _$ImageUploadViewModel;

abstract class _ImageUploadViewModelBase with Store {
  static const _baseUrl =
      'https://firebasestorage.googleapis.com/v0/b/fluttertr-ead5c.appspot.com/o/';
  @observable
  String imageUrl = '';

  @observable
  File? file;

  @observable
  bool isLoading = false;

  @observable
  String downloadText = '';

  ImageUploadService imageUploadService =
      ImageUploadService(Dio(BaseOptions(baseUrl: _baseUrl)));

  @action
  void chanceLoading() {
    isLoading = !isLoading;
  }

  @action
  void updateDownloadText(int sent, int total) {
    downloadText = '$sent / $total';
  }

  @action
  void updateImageUrl(ImageUploadResponse? response) {
    if (response == null) return;
    imageUrl = _baseUrl + (response.name?.replaceFirst('/', '%2F') ?? '');
  }

  void init(params) {}

  @action
  void saveLocalFile(XFile? file) {
    if (file == null) return;
    this.file = File(file.path);
  }

  Future<void> saveDataToService() async {
    if (file == null) return;
    chanceLoading();
    final response = await imageUploadService.uploadToImageServer(
      await file!.readAsBytes(),
      'vb',
      onSendProgress: (sent, total) {
        updateDownloadText(sent, total);
      },
    );
    updateImageUrl(response);
    chanceLoading();
  }
}
