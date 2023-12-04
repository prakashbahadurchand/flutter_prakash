import 'package:flutter/material.dart';

import '../config/app_localizations.dart';

/*void doActionBasedOnLogin(context, Function() doAction) {
  SharedPrefs.getLoggedInUser() == true
      ? doAction()
      : showDialog(
          context: context,
          builder: (context) => LoginDialog(
            authbloc: AuthBloc(AuthRepoImpl()),
            onLogin: doAction,
          ),
        );
}

Future<void> doActionBasedOnInternet(context, Function() doAction) async {
  bool hasInternet = await Utility.checkConnectivity();
  if (hasInternet) {
    doAction();
  } else {
    final locale = AppLocalizations.of(context)!;
    Utility.showMessageToast(context, locale.translate("internet_error_title"));
    // Utility.showErrorDialog(
    //   context,
    //   locale.translate("noInternet"),
    //   locale.translate("internet_error_title"),
    // );
  }
}

Future<void> doActionBasedOnInternetAndLogin(
    context, Function() doAction) async {
  bool hasInternet = await Utility.checkConnectivity();
  if (hasInternet) {
    doActionBasedOnLogin(context, doAction);
  } else {
    final locale = AppLocalizations.of(context)!;
    Utility.showErrorDialog(
      context,
      locale.translate("noInternet"),
      locale.translate("internet_error_title"),
    );
  }
}*/
