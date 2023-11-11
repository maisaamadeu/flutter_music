abstract class HttpClient {
  Future<HttpResponse> get(String url);
  Future<HttpResponse> post(String url,
      {required Map<String, dynamic> map, String? token});
}

class HttpResponse {
  final dynamic data;
  final int statusCode;

  HttpResponse({
    required this.data,
    required this.statusCode,
  });
}
