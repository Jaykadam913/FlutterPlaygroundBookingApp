import 'package:flutter_playground_booking_app/data/apiClient/api_client.dart';
import 'package:flutter_playground_booking_app/data/apiClient/auth_repository_impl.dart';
import 'package:flutter_playground_booking_app/domain/repositories/auth_repository.dart';

import '../controller/login_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LoginScreen.
///
/// This class ensures that the LoginController is created when the
/// LoginScreen is first loaded.
class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiClient>(() => ApiClient());

    // AuthRepository using ApiClient
    Get.lazyPut<AuthRepository>(
        () => AuthRepositoryImpl(apiClient: Get.find<ApiClient>()));

    // LoginController using AuthRepository
    Get.lazyPut<LoginController>(
        () => LoginController(authRepository: Get.find<AuthRepository>()));
  }
}
