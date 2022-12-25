import 'package:get/get.dart';

class HomeController extends GetxController {
  var likeCounter = 0.obs;
  var emotionCounter = 0.obs;
  var heartCounter = 0.obs;
  var rocketCounter = 0.obs;
  var cakeCounter = 0.obs;

  void likeincrement() {
    likeCounter++;
  }
  void emotionincrement() {
    emotionCounter++;
  }
  void rocketincrement() {
    rocketCounter++;
  }
  void heartincrement() {
    heartCounter++;
  }
  void cakeincrement() {
    cakeCounter++;
  }
}
