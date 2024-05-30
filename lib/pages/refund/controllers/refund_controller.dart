import 'package:atma_kitchen/core/services/http_services.dart';
import 'package:atma_kitchen/models/refund/refund.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RefundController extends GetxController {
  HTTPService httpService = Get.find<HTTPService>();
  final box = GetStorage();

  RxBool isRefundLoading = false.obs;
  RxBool isBalanceLoading = false.obs;
  RxDouble balance = 0.0.obs;
  Rx<List<Refund>> refund = Rx<List<Refund>>([]);

  @override
  void onInit() {
    getRefund();
    getBalance();
    super.onInit();
  }

  void onRefresh() {
    getRefund();
    getBalance();
  }

  void getRefund() async {
    isRefundLoading.value = true;

    var response = await httpService.get(
        'pengembalian-dana/customer/${box.read('customer_id')}',
        token: box.read('token'));

    if (response != null) {
      List<Refund> responseRefund = [];
      for (var item in response['data']['refund']) {
        responseRefund.add(Refund.fromJson(item));
      }
      refund.value = responseRefund;
    }

    isRefundLoading.value = false;
  }

  void getBalance() async {
    isBalanceLoading.value = true;

    var response = await httpService.get('/saldo/${box.read('customer_id')}',
        token: box.read('token'));
    balance.value = (response['data']['Saldo']['saldo'] as num).toDouble();

    isBalanceLoading.value = false;
  }
}
