import 'package:atma_kitchen/core/services/http_services.dart';
import 'package:atma_kitchen/core/utils.dart';
import 'package:atma_kitchen/models/product/product.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {
  HTTPService httpService = Get.find<HTTPService>();
  final box = GetStorage();

  List<Product> products = [];

  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<List<Product>> result = Rx<List<Product>>([]);
  Rx<List<Product>> topProducts = Rx<List<Product>>([]);
  RxBool loading = false.obs;
  RxBool topProductsloading = false.obs;

  @override
  void onInit() {
    getProducts();
    getTopProducts();
    super.onInit();
  }

  void getProducts() async {
    loading.value = true;
    var response = await httpService.get(
        'products?date=${dateTimeToYYYYMMDD(selectedDate.value)}',
        token: box.read('token'));
    if (response != null) {
      List<Product> responseProducts = [];
      for (var item in response['data']['products']) {
        responseProducts.add(Product.fromJson(item));
      }

      loading.value = false;
      products = responseProducts;
      result.value = products;
    }
  }

  void getTopProducts() async {
    topProductsloading.value = true;
    var response = await httpService.get('products/getTopProduct',
        token: box.read('token'));
    if (response != null) {
      List<Product> responseProducts = [];
      for (var item in response['data']['products']) {
        responseProducts.add(Product.fromJson(item));
      }

      topProductsloading.value = false;
      topProducts.value = responseProducts;
    }
  }

  void filterProduct(String productName) {
    if (productName.isEmpty) {
      result.value = products;
      return;
    } else {
      result.value = products
          .where((element) =>
              element.name!.toLowerCase().contains(productName.toLowerCase()))
          .toList();
    }
  }
}
