import 'dart:convert';

import 'package:flutter_music/core/http_client/http_client.dart';
import 'package:flutter_music/core/utils/keys/back4app_api_keys.dart';
import 'package:http/http.dart' as http;

class HttpImplementation implements HttpClient {
  final client = http.Client();

  @override
  Future<HttpResponse> get(String url) {
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse> post(String url,
      {required Map<String, dynamic> map}) async {
    final response = await client.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'X-Parse-Application-Id': Back4appApiKeys.xParseApplicationId,
        'X-Parse-REST-API-Key': Back4appApiKeys.xParseRestApiKey,
      },
      body: jsonEncode(map),
    );
    return HttpResponse(data: response.body, statusCode: response.statusCode);
  }
}
