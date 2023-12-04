import 'package:flutter/services.dart';

/*SystemUiOverlayStyle applyCurrentSystemOverlayStyle() {
  return (CorePrefs.appThemeMode(null) == AppThemeMode.light)
      ? SystemUiOverlayStyle.light
      : SystemUiOverlayStyle.dark;
}*/

Future<void> applyPreferredOrientation() async {
  return await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}
