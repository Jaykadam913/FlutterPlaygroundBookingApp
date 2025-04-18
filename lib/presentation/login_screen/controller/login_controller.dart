import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/domain/repositories/auth_repository.dart';
import 'package:flutter_playground_booking_app/presentation/login_screen/models/login_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Rx<LoginModel> loginModelObj = LoginModel().obs;
  RxBool isShowPassword = true.obs;
  RxBool isLoading = false.obs;

  final AuthRepository authRepository;

  LoginController({required this.authRepository});

  @override
  void onClose() {
    super.onClose();
    emailController.clear();
    passwordController.clear();
  }

  Future<void> loginWithGoogle() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return;
      }

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      await _auth.signInWithCredential(credential).then((value) {
        Get.offNamed(AppRoutes.popularSportSelectionScreen);
      });
    } catch (e) {
      print('this is >> $e');
    }
  }

  /// Call this method when user taps login button
  Future<void> loginUser() async {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Email and password must not be empty");
      return;
    }

    isLoading.value = true;

    try {
      final response = await authRepository.login(email, password);

      final token = response['token'];
      final user = response['user'];

      // Navigate to home or dashboard
      Get.offNamed(AppRoutes.popularSportSelectionScreen);

      Get.snackbar("Success", "Login successful");
    } catch (e) {
      Get.offNamed(AppRoutes.popularSportSelectionScreen);
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
