import 'package:atma_kitchen/core/services/http_services.dart';
import 'package:atma_kitchen/core/utils.dart';
import 'package:atma_kitchen/models/absent/absent.dart';
import 'package:atma_kitchen/models/absent/employee.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

class AbsentController extends GetxController {
  HTTPService httpService = Get.find<HTTPService>();
  final box = GetStorage();

  List<Employee> allEmployees = [];
  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<List<Employee>> employees = Rx<List<Employee>>([]);
  Rx<List<Absent>> absents = Rx<List<Absent>>([]);

  RxBool loading = false.obs;

  @override
  void onInit() {
    getAbsent();
    super.onInit();
  }

  void getAbsent() async {
    loading.value = true;
    var absentResponse = await httpService.get(
        'karyawan/absen/${dateTimeToYYYYMMDD(selectedDate.value)}',
        token: box.read('token'));

    var employeeResponse =
        await httpService.get('karyawan', token: box.read('token'));

    absents.value = absentResponse['data']['absen']
        .map<Absent>((e) => Absent.fromJson(e))
        .toList();

    allEmployees = employeeResponse['data']['karyawan'].map<Employee>((e) {
      return Employee.fromJson(e);
    }).toList();

    // Filter allEmployees
    var absentEmployeeIds =
        absents.value.map((absent) => absent.employee!.id).toSet();
    employees.value = allEmployees
        .where((employee) => !absentEmployeeIds.contains(employee.id))
        .toList();
    loading.value = false;
  }

  void absentEmployee(int id) {
    loading.value = true;
    httpService.post(
        'karyawan/absen',
        {
          'id_karyawan': id,
          "tanggal_absen": dateTimeToYYYYMMDD(selectedDate.value),
        },
        token: box.read('token'));

    getAbsent();
  }

  void deleteAbsent(int id) {
    loading.value = true;
    httpService.delete('karyawan/absen/$id', token: box.read('token'));
    getAbsent();
  }

  void filterEmployee(String name) {
    if (name.isEmpty) {
      employees.value = allEmployees;
      return;
    } else {
      employees.value = allEmployees
          .where((element) =>
              element.name!.toLowerCase().contains(name.toLowerCase()))
          .toList();
    }
  }
}
