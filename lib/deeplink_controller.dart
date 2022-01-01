import 'dart:convert';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';

class DynamicLink extends GetxController {
  void initDynamicLinks() async {
    FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
    // dynamicLinks.onLink.listen((event) {
    //   print("succes");
    // }).onError((e) {
    //   print(e.message);
    // });
    ///To bring INTO FOREGROUND FROM DYNAMIC LINK.
    dynamicLinks.onLink(
      onSuccess: (PendingDynamicLinkData? dynamicLinkData) async {
        await _handleDeepLink(dynamicLinkData);
      },
      onError: (OnLinkErrorException e) async {
        print('DynamicLink Failed: ${e.message}');
        return e.message;
      },
    );

    final PendingDynamicLinkData? data = await dynamicLinks.getInitialLink();
    _handleDeepLink(data);
  }

  // bool _deeplink = true;
  _handleDeepLink(PendingDynamicLinkData? data) async {
    final Uri? deeplink = data?.link;
    final Map<String, String>? param = deeplink?.queryParameters;

    Get.toNamed(param!['page'].toString());
  }

  @override
  void onInit() async {
    initDynamicLinks();
    super.onInit();
  }
}
