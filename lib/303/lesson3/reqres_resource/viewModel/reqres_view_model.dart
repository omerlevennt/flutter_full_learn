import 'package:flutter_full_learn/202/lesson5/cache/shared_cache_learn.dart';
import 'package:flutter_full_learn/303/lesson3/reqres_resource/model/resource_model.dart';
import 'package:flutter_full_learn/303/lesson3/reqres_resource/service/reqres_service.dart';
import 'package:flutter_full_learn/303/lesson3/reqres_resource/view/reqres_view.dart';
import 'package:flutter_full_learn/product/service/project_dio.dart';

abstract class ReqresViewModel extends LoadingStateFull<ReqresView>
    with ProjectDioMixin {
  late final IReqresService reqresService;
//Sadece initState aninda esitlenir!!
  List<Data> resourses = [];
  @override
  void initState() {
    super.initState();
    reqresService = ResourceService(dio: service);
    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();
    resourses = (await reqresService.fetchResourseItem())?.data ?? [];
    changeLoading();
  }
}
