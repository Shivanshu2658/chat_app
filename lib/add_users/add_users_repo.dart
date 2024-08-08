import 'package:chat_app/add_users/add_users_response.dart';
import 'package:chat_app/api_services.dart';
import 'package:rxdart/rxdart.dart';

class AddUserRepository {
  final addUserContro = PublishSubject<AddUserResponse>();

  Stream<AddUserResponse> get addUserController => addUserContro.stream;

  Future<AddUserResponse?> addUserApiCall() async {
    print("sdfbaisoudfhauisdfgiusdfgs");
    var dataResponse =
        await ApiProvider().getApiCall("auth/getAllUser");
    AddUserResponse response = AddUserResponse.fromJson(dataResponse);

    addUserContro.sink.add(response);
    return response;
  }

  dispose() {
    addUserContro.close();
  }
}

final addUserRepo = AddUserRepository();
