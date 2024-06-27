import 'dart:convert';

import 'dart:io';

import 'package:http/http.dart' as http;

// token 0f76177cbd5e1c88b5120d8d88a8a3c7187b3608
class Api {
  static late String token =
      "0f76177cbd5e1c88b5120d8d88a8a3c7187b3608"; // todo to be removed and placed in the splash screen
  static String version = "/api/v1/";
  static String base_url = "https://sweaka-backend.herokuapp.com";

  static Future<http.Response?> Get({required String url}) async {
    try {
      //  print(" the url used is:" + base_url + version + url);
      final response =
          await http.get(Uri.parse(base_url + version + url), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: "token " + token,
      });
      // print(response.body);
      return response;
    } catch (e) {
      print('internet is lost from api Get');
      return http.Response("empty", 500);
    }
  }

  static Future<http.Response> Post(
      {required String url, required Map body, bool no_token = false}) async {
    try {
      //print(" the url used is:" + base_url + version + url);

      final response = await http.post(Uri.parse(base_url + version + url),
          headers: no_token
              ? null
              : {
                  HttpHeaders.authorizationHeader: "token " + token,
                },
          body: body);
  
      return response;
    } catch (e) {
      print(e.toString());
      print('internet is lost from api Post');
      return http.Response("empty", 500);
    }
  }

  static Future<http.Response> Patch(
      {required String url, required Map body}) async {
    try {
      print(" the url used is:" + base_url + version + url);

      final response = await http.patch(Uri.parse(base_url + version + url),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: "token " + token,
          },
          body: jsonEncode(body));
          print(response.statusCode);

      return response;
    } catch (e) {
      print('internet is lost from api Patch');
      return http.Response.bytes([], 404);
    }
  }

  static Future<http.Response> Put(
      {required String url, required Map body}) async {
    try {
      print(" the url used is:" + base_url + version + url);

      final response = await http.put(Uri.parse(base_url + version + url),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: "token " + token,
          },
          body: jsonEncode(body));
      return response;
    } catch (e) {
      print('internet is lost from api Put');
      return http.Response.bytes([], 404);
    }
  }
  static Future<http.Response> Delete(
      {required String url, required Map body}) async {
    try {
    

      final response = await http.delete(Uri.parse(base_url + version + url),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: "token " + token,
          },
          body: jsonEncode(body));

      return response;
    } catch (e) {
      print('internet is lost from api Patch');
      return http.Response.bytes([], 404);
    }
  }
}
