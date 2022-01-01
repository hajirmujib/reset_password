import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'deeplink_controller.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({Key? key}) : super(key: key);
  final deepC = Get.put(DynamicLink());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset Password"),
      ),
    );
  }
}
