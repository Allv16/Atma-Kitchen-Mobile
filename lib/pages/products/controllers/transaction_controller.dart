import 'package:atma_kitchen/core/services/http_services.dart';
import 'package:atma_kitchen/models/product/transaction.dart';
import 'package:atma_kitchen/pages/auth/controllers/profile_controller.dart';
import 'package:atma_kitchen/widgets/snackbar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TransactionController extends GetxController {
  HTTPService httpService = Get.find<HTTPService>();
  ProfileController profileController = Get.put(ProfileController());
  final box = GetStorage();

  List<Transaction> transactions = [];
  Rx<List<Transaction>> result = Rx<List<Transaction>>([]);

  RxBool loading = false.obs;

  @override
  void onInit() {
    getTransactions();
    super.onInit();
  }

  void getTransactions() async {
    loading.value = true;
    var response = await httpService.get(
        'transaksi/customer/${box.read('customer_id')}',
        token: box.read('token'));
    if (response != null) {
      List<Transaction> responseTransactions = [];
      for (var item in response['data']['transaksi']) {
        responseTransactions.add(Transaction.fromJson(item));
      }

      loading.value = false;
      transactions = responseTransactions;
      result.value = transactions;
    }
  }

  void filterTransaction(String productName) {
    if (productName.isEmpty) {
      result.value = transactions;
      return;
    } else {
      result.value = transactions
          .where((element) => element.transactionDetails!.any((element) =>
              element.product!.name!
                  .toLowerCase()
                  .contains(productName.toLowerCase())))
          .toList();
    }
  }

  void onRefresh() {
    getTransactions();
  }

  void updateTransactionToCompleted(String id) async {
    var response = await httpService.put('/transaksi/completed/$id', {});
    if (response != null) {
      onRefresh();
    }
    successSnackBar("Success Completed Transaction",
        "Thank you for your purchases!", () {});
  }
}
