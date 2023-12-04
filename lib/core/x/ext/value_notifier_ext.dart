import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

typedef LiveData<T> = ValueNotifier<T>;

extension ValueNotifierExt<T> on ValueNotifier<T> {
  Widget listen(Widget Function(T value) builder) => ValueListenableBuilder<T>(
        valueListenable: this,
        builder: (BuildContext context, T value, Widget? child) =>
            builder(value),
      );

  Widget listens(Widget Function(BuildContext, T, Widget?) builder) =>
      ValueListenableBuilder<T>(valueListenable: this, builder: builder);
}

ValueNotifier<T> remember<T>(T initialValue) {
  return useValueNotifier(initialValue);
}
