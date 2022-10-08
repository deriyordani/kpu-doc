import 'dart:convert';

import 'package:d_info/d_info.dart';
import 'package:d_method/d_method.dart';
import '../../config/api.dart';
import '../../config/app_request.dart';
import '../../config/session.dart';

import '../model/employee.dart';

class SourceEmployee {
  static Future<List<Employee>> gets() async {
    String url = '${Api.getAllEmployee}';
    String? responseBody = await AppRequest.gets(url);
    if (responseBody != null) {
      Map result = jsonDecode(responseBody);
      if (result['success']) {
        List list = result['data'];
        return list.map((e) => Employee.fromJson(e)).toList();
      }
      return [];
    }
    return [];
  }

  static Future<bool> add(
      String position, String id_number, String full_name) async {
    String url = '${Api.storeEmployee}';
    String? responseBody = await AppRequest.post(url, {
      'position': position,
      'id_number': id_number,
      'full_name': full_name,
    });
    if (responseBody != null) {
      Map result = jsonDecode(responseBody);
      if (result['success']) {
        return true;
      } else {
        if (result['message'] == 'email') {
          DInfo.toastError('Email is already used');
        }
        return false;
      }
    }

    return false;
  }
}
