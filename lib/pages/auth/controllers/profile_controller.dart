import 'package:atma_kitchen/core/routes/routes.dart';
import 'package:atma_kitchen/core/services/http_services.dart';
import 'package:atma_kitchen/models/auth/profile.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  HTTPService httpService = Get.find<HTTPService>();
  final box = GetStorage();

  Profile? profile;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  void getProfile() async {
    isLoading.value = true;

    var response =
        await httpService.get('auth/profile', token: box.read('token'));
    profile = Profile.fromJson(response['data']['customer']);

    response = await httpService.get('/saldo/${box.read('customer_id')}',
        token: box.read('token'));
    profile!.balance = (response['data']['Saldo']['saldo'] as num).toDouble();

    isLoading.value = false;
  }

  void logout() async {
    var response =
        await httpService.post('auth/logout', {}, token: box.read('token'));
    if (response['success']) {
      box.remove('token');
      Get.offAllNamed(RoutesName.login);
    }
  }
}
