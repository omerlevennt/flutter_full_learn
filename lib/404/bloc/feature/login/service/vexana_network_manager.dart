import 'package:flutter_full_learn/404/bloc/product/model/token_model.dart';
import 'package:vexana/vexana.dart';

class VexanaNetworkManager extends NetworkManager<TokenModel> {
  VexanaNetworkManager()
      : super(options: BaseOptions(baseUrl: 'https://reqres.in/'));
}
