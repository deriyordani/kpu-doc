import 'package:d_info/d_info.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventory_course/data/model/employee.dart';
import 'package:inventory_course/presentation/page/employee/add_employee_page.dart';

import '../../../data/model/user.dart';
import '../../../data/source/source_user.dart';
import '../../controller/c_employee.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({Key? key}) : super(key: key);

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  final cEmployee = Get.put(CEmployee());

  delete(String unid) async {
    bool yes = await DInfo.dialogConfirmation(
        context, 'Delete Employee', 'Yes to confirm');
    if (yes) {
      bool success = await SourceUser.delete(unid);
      if (success) {
        DInfo.dialogSuccess('Success Delete Employee');
        DInfo.closeDialog(
          actionAfterClose: () => cEmployee.setList(),
        );
      } else {
        DInfo.dialogError('Failed Delete Employee');
        DInfo.closeDialog();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text('Employee'),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const AddEmployeePage())?.then((value) {
                if (value ?? false) {
                  cEmployee.setList();
                }
              });
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: GetBuilder<CEmployee>(builder: (_) {
        if (cEmployee.loading) return DView.loadingCircle();
        if (cEmployee.list.isEmpty) return DView.empty();
        return ListView.separated(
          itemCount: cEmployee.list.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            Employee row = cEmployee.list[index];

            return Card(
              elevation: 6,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 18,
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(color: Colors.grey),
                  ),
                  backgroundColor: Colors.white,
                ),
                title: Text(row.full_name ?? ''),
                tileColor: Colors.grey,
                subtitle: Text(row.id_number ?? ''),
                trailing: PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'delete') {
                      delete(row.id_number.toString());
                    }
                  },
                  icon: const Icon(Icons.more_vert),
                  itemBuilder: (context) => [
                    const PopupMenuItem<String>(
                      value: 'delete',
                      child: Text('Hapus'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'view',
                      child: Text('Lihat'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
