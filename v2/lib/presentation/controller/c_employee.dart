import 'package:get/get.dart';
import 'package:inventory_course/data/source/source_employee.dart';

import '../../data/model/employee.dart';
import '../../data/source/source_user.dart';

class CEmployee extends GetxController {
  final RxBool _loading = false.obs;
  bool get loading => _loading.value;
  set loading(bool newData) {
    _loading.value = newData;
  }

  final RxList<Employee> _list = <Employee>[].obs;
  List<Employee> get list => _list.value;
  setList() async {
    loading = true;
    update();
    _list.value = await SourceEmployee.gets();
    update();
    Future.delayed(const Duration(seconds: 1), () {
      loading = false;
      update();
    });
  }

  @override
  void onInit() {
    setList();
    super.onInit();
  }
}
