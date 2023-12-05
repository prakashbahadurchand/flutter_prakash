library app.globals;

import 'package:flutter/material.dart';

class BaseGlobal {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static String locale = 'en';
  static bool isEn = true;
  static bool isOnline = true;
  static bool isDebugMode = false;
  static int mockDataDelaySeconds = 2;
  static String userImagePath = 'assets/image/img_user.png';
  static String brokenImagePath = 'assets/image/broken_image.png';
  // static String brokenImageUrl = 'https://cdn-icons-png.flaticon.com/128/10922/10922178.png';
  static String brokenImageUrl =
      'https://cdn-icons-png.flaticon.com/128/10765/10765873.png';
  static String emptyImageUrl =
      'https://cdn-icons-png.flaticon.com/128/4577/4577383.png';

  static int localSessionTimeoutSeconds = 30;

  static Map<String, dynamic> emptyMap = <String, dynamic>{};

  static const baseUrl = 'https://www.example.com/api/v1/';
}
