import 'dart:convert';

import 'package:d_info/d_info.dart';
import 'package:d_method/d_method.dart';
import '../../config/api.dart';
import '../../config/app_request.dart';
import '../../config/session.dart';

import '../model/doc.dart';

class SourceDoc {
  static Future<List<DocFile>> gets() async {
    String url = '${Api.getAllDocument}';
    String? responseBody = await AppRequest.gets(url);
    if (responseBody != null) {
      Map result = jsonDecode(responseBody);
      if (result['success']) {
        List list = result['data'];
        return list.map((e) => DocFile.fromJson(e)).toList();
      }
      return [];
    }
    return [];
  }
}
