import 'package:flutter_full_learn/404/bloc/feature/login/model/login_model.dart';
import 'package:flutter_full_learn/404/bloc/feature/login/service/login_service.dart';
import 'package:flutter_full_learn/404/bloc/product/model/token_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

void main() {
  late ILoginService loginService;
  setUp(() {
    loginService = LoginService(NetworkManager<TokenModel>(
        options: BaseOptions(baseUrl: 'https://reqres.in/')));
  });
  test(
      'Login Test',
      () => () async {
            final response = await loginService.login(LoginModel(
                email: 'eve.holt@reqres.in', password: 'cityslicka'));
            expect(response, isNotNull);
          });
}
