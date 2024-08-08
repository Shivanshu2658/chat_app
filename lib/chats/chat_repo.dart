import 'package:chat_app/add_users/add_users_response.dart';
import 'package:chat_app/api_services.dart';
import 'package:chat_app/chats/chat_response.dart';
import 'package:rxdart/rxdart.dart';

class ChatRepository {
  final chatContro = PublishSubject<ChatResponse>();

  Stream<ChatResponse> get chatController => chatContro.stream;

  Future<ChatResponse?> chatApiCall(dynamic requestBody) async {
    print("sdfbaisoudfhauisdfgiusdfgs");
    var dataResponse =
        await ApiProvider().postApiCall("chat/getUserChats",requestBody);
    ChatResponse response = ChatResponse.fromJson(dataResponse);

    chatContro.sink.add(response);
    return response;
  }

  dispose() {
    chatContro.close();
  }
}

final chatRepo = ChatRepository();
