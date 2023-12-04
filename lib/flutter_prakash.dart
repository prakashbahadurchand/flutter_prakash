export 'package:fluttertoast/fluttertoast.dart';

import 'flutter_prakash_platform_interface.dart';

class FlutterPrakash {
  Future<String?> getPlatformVersion() {
    return FlutterPrakashPlatform.instance.getPlatformVersion();
  }
}
