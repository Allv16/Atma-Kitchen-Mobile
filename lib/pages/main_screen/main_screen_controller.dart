import 'package:atma_kitchen/core/services/http_services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainScreenController extends GetxController {
  HTTPService httpService = Get.find<HTTPService>();
  final box = GetStorage();
  final currentIndex = 0.obs;

  @override
  void onInit() {
    updateFCMToken();
    super.onInit();
  }

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  void updateFCMToken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    await httpService.post(
        'notification/fcm-token/${box.read('customer_id')}?fcmToken=$fcmToken',
        {},
        token: box.read('token'));
  }
}
