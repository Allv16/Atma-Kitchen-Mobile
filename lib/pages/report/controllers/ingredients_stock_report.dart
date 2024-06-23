import 'package:atma_kitchen/core/services/http_services.dart';
import 'package:atma_kitchen/models/ingredients/ingredients.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class IngredientStockReportController extends GetxController {
  HTTPService httpService = Get.find<HTTPService>();
  final box = GetStorage();

  RxBool isLoading = false.obs;
  Rx<List<Ingredient>> ingredientStock = Rx<List<Ingredient>>([]);

  @override
  void onInit() {
    fetchReport();
    super.onInit();
  }

  void onRefresh() {
    fetchReport();
  }

  void fetchReport() async {
    isLoading.value = true;

    var response =
        await httpService.get('ingredients', token: box.read('token'));

    ingredientStock.value = response['data']['ingredients']
        .map<Ingredient>((e) => Ingredient.fromJson(e))
        .toList();

    isLoading.value = false;
  }
}
