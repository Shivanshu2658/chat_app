import 'package:chat_app/add_users/add_users_response.dart';
import 'package:chat_app/api_services.dart';
import 'package:chat_app/home/home_chats_response.dart';
import 'package:rxdart/rxdart.dart';

class HomeChatRepository {
  final homeChatContro = PublishSubject<HomeChatResponse>();

  Stream<HomeChatResponse> get homeChatController => homeChatContro.stream;

  Future<HomeChatResponse?> homeChatApiCall() async {
    print("sdfbaisoudfhauisdfgiusdfgs");
    var dataResponse =
        await ApiProvider().getApiCall("auth/getAllConnectedUser");
    HomeChatResponse response = HomeChatResponse.fromJson(dataResponse);

    homeChatContro.sink.add(response);
    return response;
  }

  dispose() {
    homeChatContro.close();
  }
}

final homeChatRepo = HomeChatRepository();
