import 'package:chat_app/api_services.dart';
import 'package:chat_app/auth/login/login_response.dart';
import 'package:chat_app/auth/register/register_response.dart';
import 'package:rxdart/rxdart.dart';

class LoginRepository {
  final loginContro = PublishSubject<LoginResponse>();

  Stream<LoginResponse> get loginController => loginContro.stream;

  Future<LoginResponse?> loginApiCall(dynamic requestBody) async {
    print("sdfbaisoudfhauisdfgiusdfgs");
    var dataResponse =
        await ApiProvider().postApiCall("auth/login", requestBody);
    LoginResponse response = LoginResponse.fromJson(dataResponse);

    loginContro.sink.add(response);
    return response;
  }

  dispose() {
    loginContro.close();
  }
}

final loginRepo = LoginRepository();
