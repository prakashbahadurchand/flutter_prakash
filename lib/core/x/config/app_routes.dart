// App Routes

import 'package:flutter/material.dart';

enum SlideType {
  fromRight,
  fromLeft,
  fromBottom,
}

class SlidePageRoute<T> extends PageRoute<T> {
  final Widget widget;
  final SlideType slideType;

  SlidePageRoute({
    required this.widget,
    required this.slideType,
  }) : super(settings: const RouteSettings(), fullscreenDialog: false);

  @override
  bool get opaque => true;

  @override
  Color? get barrierColor => null;

  @override
  String get barrierLabel => "";

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return widget;
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    Offset slideOffset;
    switch (slideType) {
      case SlideType.fromRight:
        slideOffset = const Offset(1.0, 0.0);
        break;
      case SlideType.fromLeft:
        slideOffset = const Offset(-1.0, 0.0);
        break;
      case SlideType.fromBottom:
        slideOffset = const Offset(0.0, 1.0);
        break;
    }

    return SlideTransition(
      position: Tween<Offset>(
        begin: slideOffset,
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      )),
      child: child,
    );
  }
}

// Scale Page Route

void navigateToDestinationScreen(
    BuildContext context, Widget destinationScreen) {
  Navigator.push(
    context,
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) =>
          destinationScreen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween(begin: 0.0, end: 1.0)
            .chain(CurveTween(curve: Curves.easeInOut));
        final scaleAnimation = animation.drive(tween);

        return ScaleTransition(
          scale: scaleAnimation,
          child: child,
        );
      },
    ),
  );
}
