import 'package:atma_kitchen/core/services/http_services.dart';
import 'package:atma_kitchen/models/product/hampers.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HampersController extends GetxController {
  HTTPService httpService = Get.find<HTTPService>();
  final box = GetStorage();

  Rx<List<Hampers>> hampers = Rx<List<Hampers>>([]);
  RxBool loading = false.obs;

  @override
  void onInit() {
    getHampers();
    super.onInit();
  }

  void getHampers() async {
    loading.value = true;
    var response = await httpService.get('hampers', token: box.read('token'));
    if (response != null) {
      List<Hampers> responseHampers = [];
      for (var item in response['data']['hampers']) {
        responseHampers.add(Hampers.fromJson(item));
      }

      loading.value = false;
      hampers.value = responseHampers;
    }
  }
}
