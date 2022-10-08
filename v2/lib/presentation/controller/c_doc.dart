import 'package:get/get.dart';
import 'package:inventory_course/data/source/source_document.dart';

import '../../data/model/doc.dart';
import '../../data/source/source_document.dart';

class Cdocument extends GetxController {
  final RxBool _loading = false.obs;
  bool get loading => _loading.value;
  set loading(bool newData) {
    _loading.value = newData;
  }

  final RxList<DocFile> _list = <DocFile>[].obs;
  List<DocFile> get list => _list.value;
  setList() async {
    loading = true;
    update();
    _list.value = await SourceDoc.gets();
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
