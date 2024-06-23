import 'package:atma_kitchen/core/services/http_services.dart';
import 'package:atma_kitchen/models/reports/expense_income.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class IncomeExpenseReportController extends GetxController {
  HTTPService httpService = Get.find<HTTPService>();
  final box = GetStorage();

  RxBool isLoading = false.obs;
  Rx<DateTime> selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, 1).obs;
  Rx<List<ExpenseIcome>> incomeExpense = Rx<List<ExpenseIcome>>([]);

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

    var response = await httpService.get(
        'laporan/expenses-income-reports?year=${selectedDate.value.year}&month=${selectedDate.value.month}',
        token: box.read('token'));

    incomeExpense.value = response['data']['report']
        .map<ExpenseIcome>((e) => ExpenseIcome.fromJson(e))
        .toList();

    isLoading.value = false;
  }
}
