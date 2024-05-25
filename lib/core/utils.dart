import 'package:atma_kitchen/core/services/http_services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      HTTPService(),
    );
  }
}

String dateToString(DateTime date) {
  return DateFormat('dd MMM yyyy').format(date);
}

String dateTimeToYYYYMMDD(DateTime date) {
  return DateFormat('yyyy-MM-dd').format(date);
}

String currencyFormat(double value) {
  return NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
    decimalDigits: 0,
  ).format(value);
}

String dateTimeToDay(DateTime date) {
  return DateFormat('EEEE, dd MMMM yyyy').format(date);
}
