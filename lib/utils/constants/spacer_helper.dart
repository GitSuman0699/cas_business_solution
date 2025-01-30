import 'package:flutter/material.dart';

class SpacerHelper {
  static const double verticalExtraSmall = 4.0;
  static const double verticaleSmall = 8.0;
  static const double verticalMedium = 16.0;
  static const double verticalLarge = 24.0;
  static const double verticalExtraLarge = 48.0;

  static const double horizontalExtraSmall = 4.0;
  static const double horizontalSmall = 8.0;
  static const double horizontalMedium = 16.0;
  static const double horizontalLarge = 24.0;
  static const double horizontalExtraLarge = 48.0;

  static SizedBox verticalSpaceExtraSmall() =>
      verticalSpace(verticalExtraSmall);

  static SizedBox verticalSpaceSmall() => verticalSpace(verticaleSmall);
  static SizedBox verticalSpaceMedium() => verticalSpace(verticalMedium);
  static SizedBox verticalSpaceLarge() => verticalSpace(verticalLarge);
  static SizedBox verticalSpaceExtraLarge() =>
      verticalSpace(verticalExtraLarge);

  static SizedBox verticalSpace(double height) => SizedBox(height: height);

  static SizedBox horizontalSpaceExtraSmall() =>
      horizontalSpace(horizontalExtraSmall);
  static SizedBox horizontalSpaceSmall() => horizontalSpace(horizontalSmall);
  static SizedBox horizontalSpaceMedium() => horizontalSpace(horizontalMedium);
  static SizedBox horizontalSpaceLarge() => horizontalSpace(horizontalLarge);
  static SizedBox horizontalSpaceExtraLarge() =>
      horizontalSpace(horizontalExtraLarge);

  static SizedBox horizontalSpace(double width) => SizedBox(width: width);
}
