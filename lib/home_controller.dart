import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import 'package:dio/dio.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;

  final dio = Dio();
  var verifyLink = "".obs;
  var emailFound = false.obs;
  var newPass = 0.obs;

  final emailTxt = TextEditingController();
  Future checkUser() async {
    isLoading(true);
    try {
      dio.options.baseUrl = "https://192.168.100.160";
      var res = await dio.post("/deeplink/connect.php",
          data: FormData.fromMap({
            "email": emailTxt.text,
          }),
          options: Options(headers: {"Content-Type": "multipart/form-data"}));
      var link = json.decode(res.data);
      if (link == 'INVALID EMAIL') {
        Get.showSnackbar(
          const GetSnackBar(
            snackPosition: SnackPosition.TOP,
            title: "Email Tidak Dikenali",
            message: "Mohon Periksa Kembali Email Anda",
            duration: Duration(seconds: 1),
          ),
        );
        print(link);
      } else if (link == 'FAILED SEND EMAIL') {
        Get.showSnackbar(
          const GetSnackBar(
            snackPosition: SnackPosition.TOP,
            title: "Gagal Kirim Email",
            message: "Mohon Periksa Kembali Koneksi Internet Anda",
            duration: Duration(seconds: 1),
          ),
        );
      } else {
        verifyLink.value = link;
        emailFound(true);
        Get.defaultDialog(
            title: "Succes",
            middleText:
                "Link reset berhasil dikirim ke email anda,silahkan periksa email anda",
            textCancel: "Kembali");
      }
    } finally {
      isLoading(false);
    }
  }
}
