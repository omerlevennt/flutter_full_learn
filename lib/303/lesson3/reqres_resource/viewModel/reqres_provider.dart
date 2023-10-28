import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/lesson3/reqres_resource/model/resource_model.dart';
import 'package:flutter_full_learn/303/lesson3/reqres_resource/service/reqres_service.dart';
import 'package:flutter_full_learn/product/global/resource_context.dart';

class ReqresProvider extends ChangeNotifier {
  final IReqresService reqresService;
//Sadece initState aninda esitlenir!!
  List<Data> resourses = [];
  bool isLoading = false;

  void _chanceLoading() {
    isLoading != isLoading;
    notifyListeners();
  }

  ReqresProvider(this.reqresService) {
    _fetch();
  }

  Future<void> _fetch() async {
    _chanceLoading();
    resourses = (await reqresService.fetchResourseItem())?.data ?? [];
    _chanceLoading();
  }

  void saveToLocale(ResourceContext resourceContext) {
    resourceContext.saveModel(ResourceModel(data: resourses));
  }
}
