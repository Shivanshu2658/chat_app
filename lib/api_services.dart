import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ApiProvider {
  final String baseUrl = "https://shivanshubackend-shivanshu-yadavs-projects.vercel.app/api/v1";
  // final String baseUrl = dotenv.env['API_BASE_URL']!;

  Future<dynamic> postApiCall(String endpoint, dynamic body) async {

    print("fshdifos");
    String url = '$baseUrl/$endpoint';
    print(url);
    print(body);

    final SharedPreferences pref = await SharedPreferences.getInstance();
    final token = await pref.getString('token') ?? "";
    var responseJson;
    try {
      print("--POST request body $url  $body");
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token!,
        },
      );
      if (kDebugMode) {
        print("--POST $url ${response.body}");
      }
      responseJson = json.decode(response.body.toString());
      if (kDebugMode) {
        print("--POST $url $responseJson");
      }
      return responseJson;
    } catch (error) {
      if (kDebugMode) {
        print("--POST onERROR $url $error");
      }
      return null;
    }
  }

  Future<dynamic> getApiCall(String url, String token) async {
    var responseJson;
    try {
      print("--GET request $url");
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      if (kDebugMode) {
        print("--GET $url ${response.body}");
      }
      responseJson = json.decode(response.body.toString());
      if (kDebugMode) {
        print("--GET $url $responseJson");
      }
      return responseJson;
    } catch (error) {
      if (kDebugMode) {
        print("--GET onERROR $url $error");
      }
      return null;
    }
  }
}
