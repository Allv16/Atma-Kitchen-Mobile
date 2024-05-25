import 'package:atma_kitchen/core/services/http_services.dart';
import 'package:atma_kitchen/models/product/product.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CakesController extends GetxController {
  HTTPService httpService = Get.find<HTTPService>();
  final box = GetStorage();

  Rx<List<Product>> product = Rx<List<Product>>([]);
  RxBool loading = false.obs;

  @override
  void onInit() {
    getHampers();
    super.onInit();
  }

  void getHampers() async {
    loading.value = true;
    var response = await httpService.get('products/category/cakes',
        token: box.read('token'));
    if (response != null) {
      List<Product> responseProduct = [];
      for (var item in response['data']['products']) {
        responseProduct.add(Product.fromJson(item));
      }

      loading.value = false;
      product.value = responseProduct;
    }
  }
}
