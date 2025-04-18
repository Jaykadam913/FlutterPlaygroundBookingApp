import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/data/apiClient/api_url_paths.dart';

class ApiClient extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = BASE_URL;

    httpClient.timeout = const Duration(seconds: 30); // Optional: set timeout

    // Add default request headers
    httpClient.addRequestModifier<dynamic>((request) {
      request.headers['Content-Type'] = 'application/json';
      // request.headers['Authorization'] = 'Bearer YOUR_TOKEN'; // Optional token
      return request;
    });

    // Optional: response/exception logging
    httpClient.addResponseModifier((request, response) {
      print('📤 Request [${request.method}] => ${request.url}');
      print('📥 Response [${response.statusCode}] => ${response.body}');
      return response;
    });

    // Optional: error handling
    httpClient.maxAuthRetries = 3;

    super.onInit();
  }

  // Example GET method
  Future<Response> getData(String endpoint, {Map<String, dynamic>? query}) {
    return get(endpoint, query: query);
  }

  // Example POST method
  Future<Response> postData(String endpoint, dynamic body) {
    return post(endpoint, body);
  }

  // You can add PUT, DELETE methods similarly
  Future<Response> putData(String endpoint, dynamic body) {
    return put(endpoint, body);
  }
}
