import 'package:flutter/cupertino.dart';

extension TextEditingControllerExt on TextEditingController {
  void set(String newValue) {
    value = value.copyWith(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
      composing: TextRange.empty,
    );
  }

  String get() {
    return text;
  }
}