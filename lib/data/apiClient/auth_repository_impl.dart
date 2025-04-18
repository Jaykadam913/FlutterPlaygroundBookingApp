import 'package:flutter_playground_booking_app/data/apiClient/api_client.dart';
import 'package:flutter_playground_booking_app/data/apiClient/api_url_paths.dart';

import 'package:flutter_playground_booking_app/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiClient apiClient;

  AuthRepositoryImpl({required this.apiClient});

  @override

  /// Authenticates a user with the given email and password.
  ///
  /// Sends a POST request to the login endpoint with the provided credentials.
  /// If the response is successful and contains a body, returns the response
  /// body as a Map<String, dynamic>. Throws an exception with the error message
  /// if the login attempt fails.
  ///
  /// [email] The email address of the user.
  /// [password] The password of the user.
  ///
  /// Returns a Future that resolves to a Map containing the user's login
  /// details on success.
  ///
  /// Throws an Exception if the login attempt is unsuccessful.

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await apiClient.postData(LOGIN_USER_URL, {
      'email': email,
      'password': password,
    });

    if (response.isOk && response.body != null) {
      return response.body;
    } else {
      throw Exception(response.body?['message'] ?? 'Login failed');
    }
  }
}
