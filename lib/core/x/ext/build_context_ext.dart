import 'package:flutter/material.dart';

//import '../config/app_localizations.dart';

extension BuildContextExt on BuildContext {
  debugException(Object? e) {
    showDialog(
      context: this,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text('An exception occurred: $e'),
          actions: [
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void mountedAction(void Function() action) {
    if (mounted) {
      action();
    }
  }

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  //AppLocalizations get locale => AppLocalizations.of(this)!;

  //String tr(String translationKey) => locale.translate(translationKey);

  // Navigation Related

  pop() {
    Navigator.of(this).pop();
  }

  push(Widget widget) {
    Navigator.of(this).push(
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  pushReplacement(Widget widget) {
    Navigator.of(this).pushReplacement(
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  pushAndRemoveUntil(Widget widget) {
    Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );
  }

  pushNamed(String routeName) {
    Navigator.of(this).pushNamed(routeName);
  }

  pushNamedAndRemoveUntil(String routeName) {
    Navigator.of(this).pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  // UI Related

  Widget buildLoadingUI() => const Expanded(
        child: Center(child: CircularProgressIndicator.adaptive()),
      );

  Widget buildMessageActionUI(
          String message, String action, VoidCallback onAction) =>
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onAction,
              child: Text(action),
            ),
          ],
        ),
      );

  void snack(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      clipBehavior: Clip.antiAlias,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
    ScaffoldMessenger.of(this).removeCurrentSnackBar();
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}

/*
* void showCustomSnackbar(BuildContext context, String message, {Color backgroundColor, Duration duration}) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: TextStyle(fontSize: 16.0, color: Colors.white),
    ),
    backgroundColor: backgroundColor ?? Colors.blue, // You can customize the background color
    duration: duration ?? Duration(seconds: 3), // You can customize the duration
    action: SnackBarAction(
      label: 'OK',
      onPressed: () {
        // You can add an action when the user clicks on the action button
        // For example, navigate to another screen or perform some other action
        // Navigator.of(context).pushNamed('/some_route');
      },
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}*/
