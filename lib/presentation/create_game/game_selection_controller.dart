import 'package:get/get.dart';

class SportController extends GetxController {
  var selectedSport = 'Select Sport'.obs;

  void setSport(String sport) {
    selectedSport.value = sport;
  }
}
