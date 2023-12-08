import 'package:flutter_full_learn/404/bloc/feature/login/model/login_model.dart';
import 'package:flutter_full_learn/404/bloc/product/model/token_model.dart';
import 'package:vexana/vexana.dart';

abstract class ILoginService {
  final INetworkManager networkManager;

  ILoginService(this.networkManager);
  Future<TokenModel?> login(LoginModel model);

  final String _loginPath = 'api/login';
}

class LoginService extends ILoginService {
  LoginService(super.networkManager);

  @override
  Future<TokenModel?> login(LoginModel model) async {
    final response = await networkManager.send<TokenModel, TokenModel>(
        _loginPath,
        data: model,
        parseModel: TokenModel(),
        method: RequestType.POST);
    return response.data;
  }
}
