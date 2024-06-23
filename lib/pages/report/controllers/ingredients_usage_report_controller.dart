import 'package:atma_kitchen/core/services/http_services.dart';
import 'package:atma_kitchen/core/utils.dart';
import 'package:atma_kitchen/models/reports/ingredients_usage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class IngredientsUsageReportController extends GetxController {
  HTTPService httpService = Get.find<HTTPService>();
  final box = GetStorage();

  RxBool isLoading = false.obs;
  Rx<DateTimeRange> selectedDate = DateTimeRange(
          start: DateTime(DateTime.now().year, DateTime.now().month, 1),
          end: DateTime.now())
      .obs;
  Rx<List<IngredientsUsage>> ingredientsUsage = Rx<List<IngredientsUsage>>([]);

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
        'laporan/ingredients-usage?start-date=${dateTimeToYYYYMMDD(selectedDate.value.start)}&end-date=${dateTimeToYYYYMMDD(selectedDate.value.end)}',
        token: box.read('token'));

    ingredientsUsage.value = response['data']['usage']
        .map<IngredientsUsage>((e) => IngredientsUsage.fromJson(e))
        .toList();

    isLoading.value = false;
  }
}
