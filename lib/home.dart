import 'package:flutter/material.dart';
import 'package:flutter_deeplink/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Reset Password"),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Obx(
            () => controller.isLoading.value == false
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: TextFormField(
                          decoration: const InputDecoration(hintText: "email"),
                          controller: controller.emailTxt,
                        ),
                      ).marginOnly(bottom: 50),
                      controller.emailFound.value == false
                          ? InkWell(
                              onTap: () => controller.checkUser(),
                              child: const Text(
                                "Reset Password",
                                style: TextStyle(color: Colors.blue),
                              ),
                            )
                          : Column(
                              children: [
                                const Text(
                                  "Link Belum Terkirim?",
                                  style: TextStyle(color: Colors.blue),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () => controller.checkUser(),
                                      child: const Text(
                                        "Kirim Ulang",
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                    const Text(
                                      " (:",
                                      style: TextStyle(color: Colors.black87),
                                    )
                                  ],
                                ),
                              ],
                            ).marginOnly(top: 20),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ),
      ),
    );
  }
}
