import 'package:flutter/material.dart';

import 'dimens.dart';

class Shapes {
  static RoundedRectangleBorder extraSmallRR = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(Dimens.extraSmall)),
  );
  static RoundedRectangleBorder smallRR = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(Dimens.small)),
  );
  static RoundedRectangleBorder mediumRR = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(Dimens.medium)),
  );
  static RoundedRectangleBorder largeRR = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(Dimens.large)),
  );
  static RoundedRectangleBorder extraLargeRR = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(Dimens.extraLarge)),
  );
  static RoundedRectangleBorder veryExtraLargeRR = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(Dimens.veryExtraLarge)),
  );
}
