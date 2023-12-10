import 'flutter_prakash_platform_interface.dart';

export 'package:auto_size_text/auto_size_text.dart';
export 'package:cached_network_image/cached_network_image.dart';
export 'package:carousel_slider/carousel_slider.dart';
export 'package:collection/collection.dart';
export 'package:connectivity_plus/connectivity_plus.dart';
export 'package:cupertino_icons/cupertino_icons.dart';
export 'package:device_info_plus/device_info_plus.dart';
export 'package:dio/dio.dart' hide Headers;
export 'package:easy_localization/easy_localization.dart';
export 'package:equatable/equatable.dart';
export 'package:firebase_core/firebase_core.dart';
export 'package:firebase_crashlytics/firebase_crashlytics.dart';
export 'package:firebase_messaging/firebase_messaging.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:flutter_dotenv/flutter_dotenv.dart' hide Parser;
export 'package:flutter_form_builder/flutter_form_builder.dart';
export 'package:flutter_hooks/flutter_hooks.dart';
export 'package:flutter_local_notifications/flutter_local_notifications.dart';
export "package:flutter_prakash/core/x/base/dio_options.dart";
export "package:flutter_prakash/core/x/err_exc/err_exc_handler.dart";
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:fluttertoast/fluttertoast.dart';
export 'package:form_builder_validators/form_builder_validators.dart';
export 'package:freezed_annotation/freezed_annotation.dart';
export 'package:gap/gap.dart';
export 'package:image_cropper/image_cropper.dart';
export 'package:image_picker/image_picker.dart';
export 'package:in_app_review/in_app_review.dart';
export 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
export 'package:intl/intl.dart';
export 'package:json_annotation/json_annotation.dart';
export 'package:logger/logger.dart';
export 'package:lottie/lottie.dart';
export 'package:nepali_date_picker/nepali_date_picker.dart';
export 'package:package_info_plus/package_info_plus.dart';
export 'package:path_provider/path_provider.dart';
export 'package:permission_handler/permission_handler.dart';
export 'package:pretty_dio_logger/pretty_dio_logger.dart';
export 'package:retrofit/retrofit.dart';
export 'package:share_plus/share_plus.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:shimmer/shimmer.dart';
export 'package:showcaseview/showcaseview.dart';
export 'package:uni_links/uni_links.dart';
export 'package:upgrader/upgrader.dart' hide ambiguate;
export 'package:url_launcher/url_launcher.dart';
export 'package:webview_flutter/webview_flutter.dart' hide ProgressCallback;

class FlutterPrakash {
  Future<String?> getPlatformVersion() {
    return FlutterPrakashPlatform.instance.getPlatformVersion();
  }
}
