abstract class BaseApiServices {
  Future<dynamic> getApi(String url,
      {Map<String, dynamic> headers,
      Map<String, dynamic> queryParameters,
      bool authorization = false});

  Future<dynamic> postApi(dynamic data, String url);
}
