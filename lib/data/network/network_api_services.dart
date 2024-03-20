import 'dart:convert';
import 'dart:io';
import 'package:meal/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;
import '../app_exceptions.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getApi(String url,
      {Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters,
      bool authorization = false}) async {
    dynamic responseJson;
    print("apiservice $url");
    try {
      final uri = Uri.parse(url.trim());
      final Map<String, String> finalHeaders = {
        if (headers != null) ...headers,
        'Authorization': authorization ? '' : '',
        'Content-Type': 'application/json',
      };
      final response = await http
          .get(uri, headers: finalHeaders)
          .timeout(const Duration(seconds: 20));
      print(response);
      responseJson = returnResponse(response);
    }catch(e) {
      print("exception $e");
   /*on SocketException {

      throw InternetAddress("");
    } on RequestTimeOut {
      throw RequestTimeOut();
    }*/
    }
    return responseJson;
  }

  @override
  Future postApi(data, String url) {
    // TODO: implement postApi
    throw UnimplementedError();
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      default:
        throw FetchDataException(
            'Error accoured while communicating with server ${response.statusCode}');
    }
  }
}
