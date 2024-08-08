import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class PostApiProvider {
  Future<dynamic> postApiProviderCall(String url, dynamic body) async {
    var responseJson;

    try {
      print("--POST request $url");

      final response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(body));

      if (kDebugMode) {
        print("--POST $url ${response.body}");
      }
      responseJson = json.decode(response.body.toString());

      if (kDebugMode) {
        print("--POST $url $responseJson");

        if (responseJson["error"] != null) {
          print("----POST $url ${responseJson["error"]["data"]["arguments"]}");
        }
      }

      return responseJson;
    } catch (error) {
      if (kDebugMode) {
        print("--POST onError $url $error");
      }

      return null;
    }
  }
}
