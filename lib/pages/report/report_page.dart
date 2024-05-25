import 'package:atma_kitchen/pages/report/controllers/report_controller.dart';
import 'package:atma_kitchen/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportPage extends StatelessWidget {
  final controller = Get.put(ReportController());
  ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: emptyAppBar(context),
        body: Center(child: const Text("Report Page")));
  }
}
