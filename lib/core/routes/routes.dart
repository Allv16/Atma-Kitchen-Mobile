import 'package:atma_kitchen/pages/absent/absent_page.dart';
import 'package:atma_kitchen/pages/auth/controllers/profile_controller.dart';
import 'package:atma_kitchen/pages/auth/forget_password_page.dart';
import 'package:atma_kitchen/pages/auth/login_page.dart';
import 'package:atma_kitchen/pages/auth/profile_page.dart';
import 'package:atma_kitchen/pages/auth/register/fullname_register_page.dart';
import 'package:atma_kitchen/pages/main_screen/main_screen.dart';
import 'package:atma_kitchen/pages/onboarding/onborading1_page.dart';
import 'package:atma_kitchen/pages/products/home_page.dart';
import 'package:atma_kitchen/pages/products/order_list_page.dart';
import 'package:atma_kitchen/pages/refund/input_account_no.dart';
import 'package:atma_kitchen/pages/refund/refund_page.dart';
import 'package:atma_kitchen/pages/report/income_expense_report.dart';
import 'package:atma_kitchen/pages/report/ingredients_stock_report.dart';
import 'package:atma_kitchen/pages/report/ingredients_usage_report.dart';
import 'package:get/get.dart';

class RoutesName {
  static const String onboarding1 = '/onboarding1';

  static const String register = '/register';
  static const String forgetPassword = '/forget-password';
  static const String login = '/login';
  static const String home = '/home';
  static const String ingredientsUsageReport = '/report/ingredients-usage';
  static const String incomeExpenseReport = '/report/income-expense';
  static const String ingredientStock = '/report/ingredients-stock';
  static const String absent = '/absent';

  static const String mainScreen = '/main-screen';
  static const String profile = '/u/profile';
  static const String orderList = '/u/order-list';
  static const String refund = '/u/refund';
  static const String inputAccountNumber = '/u/refund/input-account-no';
}

List<GetPage<dynamic>> appRoutes = [
  GetPage(
    name: RoutesName.register,
    page: () => FullNameRegisterPage(),
  ),
  GetPage(
    name: RoutesName.forgetPassword,
    page: () => ForgetPasswordPage(),
  ),
  GetPage(
    name: RoutesName.login,
    page: () => LoginPage(),
  ),
  GetPage(name: RoutesName.home, page: () => HomePage()),
  GetPage(
      name: RoutesName.ingredientsUsageReport,
      page: () => IngredientsUsageReport()),
  GetPage(
      name: RoutesName.incomeExpenseReport, page: () => IncomeExpenseReport()),
  GetPage(
      name: RoutesName.ingredientStock, page: () => IngredientsStockReport()),
  GetPage(name: RoutesName.absent, page: () => AbsentPage()),
  GetPage(
      name: RoutesName.mainScreen,
      page: () => MainScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ProfileController>(() => ProfileController());
      })),
  GetPage(name: RoutesName.profile, page: () => ProfilePage()),
  GetPage(name: RoutesName.orderList, page: () => OrderListPage()),
  GetPage(name: RoutesName.onboarding1, page: () => const Onboarding1Page()),
  GetPage(name: RoutesName.refund, page: () => RefundPage()),
  GetPage(name: RoutesName.inputAccountNumber, page: () => InputAccountNo())
];
