import 'package:chat_app/api_services.dart';
import 'package:chat_app/auth/register/register_response.dart';
import 'package:rxdart/rxdart.dart';

class RegisterRepository {
  final registerContro = PublishSubject<RegisterResponse>();

  Stream<RegisterResponse> get registerController => registerContro.stream;

  Future<RegisterResponse?> registerApiCall(dynamic requestBody) async {
    print("sdfbaisoudfhauisdfgiusdfgs");
    var dataResponse =
        await ApiProvider().postApiCall("auth/register", requestBody);
    RegisterResponse response = RegisterResponse.fromJson(dataResponse);

    registerContro.sink.add(response);
    return response;
  }

  dispose() {
    registerContro.close();
  }
}

final registerRepo = RegisterRepository();
