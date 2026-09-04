import 'package:flutter/material.dart';

import 'package:may_uikit/may_uikit.dart';

ButtonStyle baseStyle = ButtonStyle(
  splashFactory: InkRipple.splashFactory,
  // disable shadow
  elevation: WidgetStateProperty.all(0),

  // disable 48x48px default tap target padding
  tapTargetSize: MaterialTapTargetSize.shrinkWrap,

  shape: WidgetStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(MainThemeV2.buttonRadius),
    ),
  ),
  textStyle: WidgetStateProperty.all(
    AppTextStylesV2.labelSemiBold.copyWith(
      
    ),
  ),
);

ButtonStyle largeButtonStyle = baseStyle.copyWith(
  minimumSize: WidgetStateProperty.all(
    const Size(DimensV2.d150, DimensV2.d52),
  ),
  padding: WidgetStateProperty.all(
    const EdgeInsets.symmetric(
      vertical: DimensV2.d14,
      horizontal: DimensV2.d16,
    ),
  ),
);

ButtonStyle mediumButtonStyle = baseStyle.copyWith(
  minimumSize: WidgetStateProperty.all(
    const Size(DimensV2.d150, DimensV2.d46),
  ),
  padding: WidgetStateProperty.all(
    const EdgeInsets.symmetric(
      vertical: DimensV2.d12,
      horizontal: DimensV2.d16,
    ),
  ),
);

