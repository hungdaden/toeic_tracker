import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:may_uikit/resources/dimens.dart';
import 'package:may_uikit/resources/styles/app_color.dart';

/// Defines the UIKit theme data and token extensions.
class MainThemeV2 {
  static const Color primaryButtonColor = AppColorsV2.primaryButtonColor;
  static const double buttonRadius = 12;

  static const MayThemeColorsV2 lightColors = MayThemeColorsV2(
    tokens: {
      // Background
      'bgAppSurface': AppColorsV2.neutral100,
      'bgBtnOutlineDefault': AppColorsV2.genericWhite,
      'bgCard': AppColorsV2.genericWhite,
      'bgCardBlue': AppColorsV2.blueSky100,
      'bgCardGradientDefaultEnd': AppColorsV2.neutral200,
      'bgCardGradientDefaultStart': AppColorsV2.genericWhite,
      'bgCardGradientThemeEnd': AppColorsV2.greenTheme800,
      'bgCardGradientThemeStart': AppColorsV2.greenTheme500,
      'bgCardHighlight': AppColorsV2.greenLime100,
      'bgCardMiniStudent': AppColorsV2.redBlush100,
      'bgCardOrange': AppColorsV2.orangeCream100,
      'bgImagePlaceholderEnd': AppColorsV2.neutral100,
      'bgImagePlaceholderStart': AppColorsV2.neutral50,
      'bgHeaderSurface': AppColorsV2.neutral100,
      'headerDefault': AppColorsV2.greenTheme300,
      'bgIconButton': AppColorsV2.genericWhite,
      'bgIcon': AppColorsV2.greenTheme100,
      'bgIconTertiary': AppColorsV2.neutral100,
      'bgTabActive': AppColorsV2.greenTheme500,
      'bgTabToday': AppColorsV2.neutral800,
      'bdTabToday': AppColorsV2.genericBlack,
      'txTabToday': AppColorsV2.genericWhite,
      'bgTabInactive': AppColorsV2.genericWhite,
      'bgTextInputDefault': AppColorsV2.genericWhite,
      'bgTextInputInactive': AppColorsV2.neutral100,
      'bgTextInputError': AppColorsV2.semanticCritical50,
      'bgToastmessageDefault': AppColorsV2.neutral900,
      'bgWhiteBtn': AppColorsV2.genericWhite,
      'bgCardRed': AppColorsV2.redBlush100,
      'bgGreySurface': AppColorsV2.neutral50,
      'bgSurface': AppColorsV2.greenTheme100,
      'bgChatMessage': AppColorsV2.chatMessageSurface,
      'bgFieldDisabled': AppColorsV2.neutral100,
      'bgDefault': AppColorsV2.greenTheme700,
      'bgToastMsgDefault': AppColorsV2.neutral900,

      // Calendar picker
      'bgSelectedDay': AppColorsV2.greenTheme500,
      'bgInRangeDay': AppColorsV2.greenTheme100,
      'bgDayArrowButton': AppColorsV2.greenTheme100,

      // Calendar picker — day-type indicators.
      // Dark-mode values intentionally mirror light-mode so indicators stay
      // brand-consistent regardless of system brightness.
      'indicatorFullDay': AppColorsV2.greenTheme500,
      'indicatorFullDaySelected': AppColorsV2.greenTheme700,
      'indicatorOffDay': AppColorsV2.neutral200,
      'indicatorHalfDayLeft': AppColorsV2.greenTheme500,
      'indicatorHalfDayRight': AppColorsV2.neutral200,
      'indicatorHalfDaySelectedLeft': AppColorsV2.genericWhite,
      'indicatorHalfDaySelectedRight': AppColorsV2.greenTheme700,

      // Calendar picker — text colors
      'txDayDefault': AppColorsV2.neutral900,
      'txDayInRange': AppColorsV2.neutral900,
      'txDayDimmed': AppColorsV2.neutral300,
      'txDaySelected': AppColorsV2.genericWhite,

      // Banner
      'bnBgAttention': AppColorsV2.semanticAttention100,
      'bnBorderAttention': AppColorsV2.semanticAttention400,
      'bnTextAttention': AppColorsV2.semanticAttention800,
      'bnBgCritical': AppColorsV2.semanticCritical100,
      'bnBorderCritical': AppColorsV2.semanticCritical400,
      'bnTextCritical': AppColorsV2.semanticCritical800,
      'bnBgInfo': AppColorsV2.semanticInfo100,
      'bnBorderInfo': AppColorsV2.semanticInfo400,
      'bnTextInfo': AppColorsV2.semanticInfo700,
      'bnBgSuccess': AppColorsV2.semanticSuccess100,
      'bnBorderSuccess': AppColorsV2.semanticSuccess500,
      'bnTextSuccess': AppColorsV2.semanticSuccess800,
      'bnBgWarning': AppColorsV2.badgeOrange100,
      'bnBorderWarning': AppColorsV2.semanticWarning400,
      'bnTextWarning': AppColorsV2.badgeOrange600,

      // Border
      'bdCard': AppColorsV2.greenTheme500,
      'bdCardRed': AppColorsV2.redBlush400,
      'bdDefault': AppColorsV2.neutral200,
      'bdDirectBtn': AppColorsV2.neutral300,
      'bdTabInactive': AppColorsV2.neutral200,
      'bdTextInputDefault': AppColorsV2.neutral200,
      'bdTextInputInactiveSearch': AppColorsV2.transparent,
      'bdOutlineDefault': AppColorsV2.neutral200,
      'bdTextInputError': AppColorsV2.semanticCritical600,
      'bdTextInputBorder': AppColorsV2.greenTheme600,

      // Button
      'btnBgCriticalOutlineDefault': AppColorsV2.semanticCritical50,
      'btnBgCriticalOutlineDisable': AppColorsV2.neutral100,
      'btnCriticalOutlineDefault': AppColorsV2.semanticCritical700,
      'btnCriticalOutlineDisable': AppColorsV2.neutral300,
      'btnCriticalPrimaryDefault': AppColorsV2.semanticCritical700,
      'btnCriticalPrimaryDisable': AppColorsV2.neutral200,
      'btnBgDisablePrimary': AppColorsV2.neutral200,
      'btnBgDisableSecondary': AppColorsV2.neutral100,
      'btnOutlineDefault': AppColorsV2.greenTheme600,
      'btnPrimaryBorderDefault': AppColorsV2.transparent,
      'btnPrimaryDefault': AppColorsV2.greenTheme500,
      'btnSecondaryDefault': AppColorsV2.neutral100,
      'btnTextonlyDefault': AppColorsV2.buttonTextOnlyBlueIndigo500,

      // Divider, icon, shadow
      'dvDefault': AppColorsV2.neutral200,
      'icColor': AppColorsV2.greenTheme600,
      'icDisable': AppColorsV2.neutral200,
      'icDirectBtn': AppColorsV2.neutral500,
      'icPrimary': AppColorsV2.neutral900,
      'icSecondary': AppColorsV2.neutral600,
      'sdBannerCritical': AppColorsV2.semanticCritical800,
      'sdBannerInfo': AppColorsV2.purpleIndigo700,
      'sdBtnDefault': AppColorsV2.greenTheme700,
      'sdBtnGreenDefault': AppColorsV2.greenTheme700,
      'sdBtnGreenSecondary': AppColorsV2.greenTheme600,
      'sdBtnOrangeDefault': AppColorsV2.orangeTheme700,
      'sdBtnOrangeSecondary': AppColorsV2.orangeTheme600,
      'sdBtnPinkDefault': AppColorsV2.pinkTheme700,
      'sdBtnPinkSecondary': AppColorsV2.pinkTheme600,
      'sdBtnPrimaryDefault': AppColorsV2.neutral900,
      'sdBtnPrimaryDisable': AppColorsV2.neutral300,
      'sdBtnSecondaryDisable': AppColorsV2.neutral200,
      'sdBtnOutlineDefault': AppColorsV2.neutral200,
      'sdCard': AppColorsV2.greenTheme700,
      'sdCriticalBtnDefault': AppColorsV2.semanticCritical900,
      'sdDefault': AppColorsV2.neutral200,
      'sdGreen': AppColorsV2.greenTheme600,
      'sdGreenDark': AppColorsV2.greenTheme800,
      'sdOrange': AppColorsV2.orangeTheme600,
      'sdOutlineCritBtnDefault': AppColorsV2.semanticCritical700,
      'sdPink': AppColorsV2.pinkTheme600,
      'sdTabActive': AppColorsV2.greenTheme700,

      // Text
      'txBgColorSecondary': AppColorsV2.neutral400,
      'txBtnGreenSecondaryOutline': AppColorsV2.greenTheme600,
      'txBtnCriticalDefault': AppColorsV2.genericWhite,
      'txBtnOrangeSecondaryOutline': AppColorsV2.orangeTheme600,
      'txBtnPinkSecondaryOutline': AppColorsV2.pinkTheme600,
      'txBtnThemeLabel': AppColorsV2.genericWhite,
      'txButtonPrimary': AppColorsV2.genericWhite,
      'txBtnPrimaryDisable': AppColorsV2.genericWhite,
      'txBtnSecondaryDisable': AppColorsV2.neutral300,
      'txContentPrimaryDefault': AppColorsV2.neutral900,
      'txContentSecondaryDefault': AppColorsV2.neutral700,
      'txCancel': AppColorsV2.neutral500,
      'txCritical': AppColorsV2.semanticCritical700,
      'txDirectBtn': AppColorsV2.neutral500,
      'txHelptext': AppColorsV2.neutral600,
      'txModalDescription': AppColorsV2.neutral500,
      'txTextInputPlaceholder': AppColorsV2.neutral500,
      'txToastMessage': AppColorsV2.genericWhite,
      'txToastmessage': AppColorsV2.genericWhite,
      'txTabActive': AppColorsV2.genericWhite,
      'txTitleEmptyState': AppColorsV2.neutral500,
      'txDescriptionEmptyState': AppColorsV2.neutral400,
      'txToastMsgDefault': AppColorsV2.genericWhite,
      'txContentTertiary': AppColorsV2.neutral500,
      'txPrimaryTheme': AppColorsV2.greenTheme600,
    },
  );

  static const MayThemeColorsV2 darkColors = MayThemeColorsV2(
    tokens: {
      // Background
      'bgAppSurface': AppColorsV2.neutral700,
      'bgBtnOutlineDefault': AppColorsV2.neutral600,
      'bgCard': AppColorsV2.neutral600,
      'bgCardBlue': AppColorsV2.blueSky500,
      'bgCardGradientDefaultEnd': AppColorsV2.neutral700,
      'bgCardGradientDefaultStart': AppColorsV2.neutral600,
      'bgCardGradientThemeEnd': AppColorsV2.greenTheme800,
      'bgCardGradientThemeStart': AppColorsV2.greenTheme500,
      'bgCardHighlight': AppColorsV2.greenLime300,
      'bgCardMiniStudent': AppColorsV2.redBlush500,
      'bgCardOrange': AppColorsV2.orangeCream500,
      'bgImagePlaceholderEnd': AppColorsV2.neutral600,
      'bgImagePlaceholderStart': AppColorsV2.neutral500,
      'bgHeaderSurface': AppColorsV2.neutral700,
      'headerDefault': AppColorsV2.greenTheme700,
      'bgIconButton': AppColorsV2.neutral600,
      'bgIcon': AppColorsV2.greenTheme600,
      'bgIconTertiary': AppColorsV2.neutral500,
      'bgTabActive': AppColorsV2.greenTheme600,
      'bgTabToday': AppColorsV2.genericWhite,
      'bdTabToday': AppColorsV2.genericWhite,
      'txTabToday': AppColorsV2.genericBlack,
      'bgTabInactive': AppColorsV2.neutral600,
      'bgTextInputDefault': AppColorsV2.neutral700,
      'bgTextInputInactive': AppColorsV2.neutral600,
      'bgTextInputError': AppColorsV2.semanticCritical50,
      'bgToastmessageDefault': AppColorsV2.neutral600,
      'bgWhiteBtn': AppColorsV2.neutral700,
      'bgCardRed': AppColorsV2.redBlush500,
      'bgGreySurface': AppColorsV2.neutral500,
      'bgSurface': AppColorsV2.greenTheme600,
      'bgChatMessage': AppColorsV2.chatMessageSurface,
      'bgFieldDisabled': AppColorsV2.neutral700,
      'bgDefault': AppColorsV2.neutral600,
      'bgToastMsgDefault': AppColorsV2.genericWhite,

      // Calendar picker
      'bgSelectedDay': AppColorsV2.greenTheme500,
      'bgInRangeDay': AppColorsV2.greenTheme100,
      'bgDayArrowButton': AppColorsV2.greenTheme100,

      // Calendar picker — day-type indicators.
      // Dark-mode values intentionally mirror light-mode so indicators stay
      // brand-consistent regardless of system brightness.
      'indicatorFullDay': AppColorsV2.greenTheme500,
      'indicatorFullDaySelected': AppColorsV2.greenTheme700,
      'indicatorOffDay': AppColorsV2.neutral200,
      'indicatorHalfDayLeft': AppColorsV2.greenTheme500,
      'indicatorHalfDayRight': AppColorsV2.neutral200,
      'indicatorHalfDaySelectedLeft': AppColorsV2.genericWhite,
      'indicatorHalfDaySelectedRight': AppColorsV2.greenTheme700,

      // Calendar picker — text colors
      'txDayDefault': AppColorsV2.genericWhite,
      'txDayInRange': AppColorsV2.neutral900,
      'txDayDimmed': AppColorsV2.neutral300,
      'txDaySelected': AppColorsV2.genericWhite,

      // Banner
      'bnBgAttention': AppColorsV2.semanticAttention100,
      'bnBorderAttention': AppColorsV2.semanticAttention400,
      'bnTextAttention': AppColorsV2.semanticAttention800,
      'bnBgCritical': AppColorsV2.semanticCritical100,
      'bnBorderCritical': AppColorsV2.semanticCritical400,
      'bnTextCritical': AppColorsV2.semanticCritical800,
      'bnBgInfo': AppColorsV2.semanticInfo100,
      'bnBorderInfo': AppColorsV2.semanticInfo400,
      'bnTextInfo': AppColorsV2.semanticInfo700,
      'bnBgSuccess': AppColorsV2.semanticSuccess100,
      'bnBorderSuccess': AppColorsV2.semanticSuccess500,
      'bnTextSuccess': AppColorsV2.semanticSuccess800,
      'bnBgWarning': AppColorsV2.badgeOrange100,
      'bnBorderWarning': AppColorsV2.semanticWarning400,
      'bnTextWarning': AppColorsV2.badgeOrange600,

      // Border
      'bdCard': AppColorsV2.greenTheme500,
      'bdCardRed': AppColorsV2.redBlush300,
      'bdDefault': AppColorsV2.neutral500,
      'bdDirectBtn': AppColorsV2.neutral100,
      'bdTabInactive': AppColorsV2.neutral500,
      'bdTextInputDefault': AppColorsV2.neutral500,
      'bdTextInputInactiveSearch': AppColorsV2.neutral500,
      'bdOutlineDefault': AppColorsV2.neutral500,
      'bdTextInputError': AppColorsV2.semanticCritical600,
      'bdTextInputBorder': AppColorsV2.greenTheme600,

      // Button
      'btnBgCriticalOutlineDefault': AppColorsV2.semanticCritical50,
      'btnBgCriticalOutlineDisable': AppColorsV2.neutral50,
      'btnCriticalOutlineDefault': AppColorsV2.semanticCritical700,
      'btnCriticalOutlineDisable': AppColorsV2.neutral300,
      'btnCriticalPrimaryDefault': AppColorsV2.semanticCritical700,
      'btnCriticalPrimaryDisable': AppColorsV2.neutral600,
      'btnBgDisablePrimary': AppColorsV2.neutral500,
      'btnBgDisableSecondary': AppColorsV2.neutral100,
      'btnOutlineDefault': AppColorsV2.greenTheme600,
      'btnPrimaryBorderDefault': AppColorsV2.transparent,
      'btnPrimaryDefault': AppColorsV2.greenTheme500,
      'btnSecondaryDefault': AppColorsV2.neutral600,
      'btnTextonlyDefault': AppColorsV2.buttonTextOnlyBlueIndigo200,

      // Divider, icon, shadow
      'dvDefault': AppColorsV2.neutral500,
      'icColor': AppColorsV2.genericWhite,
      'icDisable': AppColorsV2.neutral400,
      'icDirectBtn': AppColorsV2.neutral200,
      'icPrimary': AppColorsV2.genericWhite,
      'icSecondary': AppColorsV2.neutral100,
      'sdBannerCritical': AppColorsV2.semanticCritical800,
      'sdBannerInfo': AppColorsV2.purpleIndigo700,
      'sdBtnDefault': AppColorsV2.greenTheme700,
      'sdBtnGreenDefault': AppColorsV2.greenTheme700,
      'sdBtnGreenSecondary': AppColorsV2.greenTheme500,
      'sdBtnOrangeDefault': AppColorsV2.orangeTheme700,
      'sdBtnOrangeSecondary': AppColorsV2.orangeTheme600,
      'sdBtnPinkDefault': AppColorsV2.pinkTheme700,
      'sdBtnPinkSecondary': AppColorsV2.pinkTheme600,
      'sdBtnPrimaryDefault': AppColorsV2.neutral300,
      'sdBtnPrimaryDisable': AppColorsV2.neutral900,
      'sdBtnSecondaryDisable': AppColorsV2.neutral500,
      'sdBtnOutlineDefault': AppColorsV2.neutral500,
      'sdCard': AppColorsV2.greenTheme700,
      'sdCriticalBtnDefault': AppColorsV2.semanticCritical300,
      'sdDefault': AppColorsV2.neutral500,
      'sdGreen': AppColorsV2.greenTheme600,
      'sdGreenDark': AppColorsV2.greenTheme800,
      'sdOrange': AppColorsV2.orangeTheme600,
      'sdOutlineCritBtnDefault': AppColorsV2.semanticCritical700,
      'sdPink': AppColorsV2.pinkTheme600,
      'sdTabActive': AppColorsV2.greenTheme700,
      'sdRadio': AppColorsV2.greenTheme600,

      // Text
      'txBgColorSecondary': AppColorsV2.neutral200,
      'txBtnGreenSecondaryOutline': AppColorsV2.greenTheme600,
      'txBtnCriticalDefault': AppColorsV2.genericWhite,
      'txBtnOrangeSecondaryOutline': AppColorsV2.orangeTheme600,
      'txBtnPinkSecondaryOutline': AppColorsV2.pinkTheme600,
      'txBtnThemeLabel': AppColorsV2.genericWhite,
      'txButtonPrimary': AppColorsV2.neutral900,
      'txBtnPrimaryDisable': AppColorsV2.genericWhite,
      'txBtnSecondaryDisable': AppColorsV2.neutral300,
      'txContentPrimaryDefault': AppColorsV2.genericWhite,
      'txContentSecondaryDefault': AppColorsV2.neutral50,
      'txCancel': AppColorsV2.neutral300,
      'txCritical': AppColorsV2.semanticCritical500,
      'txDirectBtn': AppColorsV2.neutral200,
      'txHelptext': AppColorsV2.genericWhite,
      'txModalDescription': AppColorsV2.neutral300,
      'txTextInputPlaceholder': AppColorsV2.genericWhite,
      'txToastMessage': AppColorsV2.genericWhite,
      'txToastmessage': AppColorsV2.genericWhite,
      'txTabActive': AppColorsV2.genericWhite,
      'txTitleEmptyState': AppColorsV2.neutral300,
      'txDescriptionEmptyState': AppColorsV2.neutral400,
      'txToastMsgDefault': AppColorsV2.neutral900,
      'txContentTertiary': AppColorsV2.neutral300,
      'txPrimaryTheme': AppColorsV2.greenTheme600,
    },
  );

  static ThemeData get theme => light;

  static ThemeData get light {
    return _buildTheme(
      brightness: Brightness.light,
      colors: lightColors,
    );
  }

  static ThemeData get dark {
    return _buildTheme(
      brightness: Brightness.dark,
      colors: darkColors,
    );
  }

  static ThemeData get lightTheme => light;

  static ThemeData get darkTheme => dark;

  static ThemeData _buildTheme({
    required Brightness brightness,
    required MayThemeColorsV2 colors,
  }) {
    final isDark = brightness == Brightness.dark;
    final colorScheme = ColorScheme(
      brightness: brightness,
      primary: colors.btnPrimaryDefault,
      onPrimary: colors.txButtonPrimary,
      secondary: colors.btnTextonlyDefault,
      onSecondary: colors.txButtonPrimary,
      error: colors.btnCriticalPrimaryDefault,
      onError: colors.txBtnCriticalDefault,
      surface: colors.bgCard,
      onSurface: colors.txContentPrimaryDefault,
      surfaceContainerHighest: colors.bgCard,
      onSurfaceVariant: colors.txContentSecondaryDefault,
      outline: colors.bdDefault,
      outlineVariant: colors.dvDefault,
      inverseSurface: colors.bgToastmessageDefault,
      onInverseSurface: colors.txToastmessage,
      surfaceTint: AppColorsV2.transparent,
    );
    final baseTheme = ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
    );
    final textTheme = GoogleFonts.robotoTextTheme(baseTheme.textTheme).apply(
      bodyColor: colors.txContentPrimaryDefault,
      displayColor: colors.txContentPrimaryDefault,
    );

    return baseTheme.copyWith(
      primaryColor: colors.btnPrimaryDefault,
      scaffoldBackgroundColor: colors.bgAppSurface,
      canvasColor: colors.bgAppSurface,
      cardColor: colors.bgCard,
      dividerColor: colors.dvDefault,
      disabledColor: colors.disabledText,
      hintColor: colors.txTextInputPlaceholder,
      splashColor: AppColorsV2.transparent,
      highlightColor: isDark
          ? AppColorsV2.genericWhite.withValues(alpha: 0.08)
          : AppColorsV2.genericBlack.withValues(alpha: 0.05),
      hoverColor: isDark
          ? AppColorsV2.genericWhite.withValues(alpha: 0.08)
          : AppColorsV2.genericBlack.withValues(alpha: 0.05),
      extensions: <ThemeExtension<dynamic>>[
        colors,
      ],
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        backgroundColor: colors.bgHeaderSurface,
        foregroundColor: colors.txContentPrimaryDefault,
        surfaceTintColor: AppColorsV2.transparent,
        iconTheme: IconThemeData(color: colors.icPrimary),
        actionsIconTheme: IconThemeData(color: colors.icPrimary),
        titleTextStyle: textTheme.titleLarge?.copyWith(
          color: colors.txContentPrimaryDefault,
          fontWeight: FontWeight.w600,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colors.bgCard,
        surfaceTintColor: AppColorsV2.transparent,
        modalBackgroundColor: colors.bgCard,
        modalBarrierColor: AppColorsV2.genericBlack.withValues(alpha: 0.45),
      ),
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        buttonColor: colors.btnPrimaryDefault,
        disabledColor: colors.disabledButton,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonRadius),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.btnPrimaryDefault,
          disabledBackgroundColor: colors.disabledButton,
          disabledForegroundColor: colors.disabledText,
          foregroundColor: colors.txButtonPrimary,
          shadowColor: AppColorsV2.transparent,
          surfaceTintColor: AppColorsV2.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonRadius),
          ),
          textStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colors.btnPrimaryDefault,
          disabledBackgroundColor: colors.disabledButton,
          disabledForegroundColor: colors.disabledText,
          foregroundColor: colors.txButtonPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonRadius),
          ),
          textStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.txContentPrimaryDefault,
          disabledForegroundColor: colors.disabledText,
          backgroundColor: colors.bgBtnOutlineDefault,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonRadius),
          ),
          side: BorderSide(color: colors.bdOutlineDefault, width: DimensV2.d_05),
          textStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colors.btnTextonlyDefault,
          disabledForegroundColor: colors.disabledText,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonRadius),
          ),
          textStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          backgroundColor: colors.bgIconButton,
          foregroundColor: colors.icPrimary,
          disabledForegroundColor: colors.disabledText,
          highlightColor: AppColorsV2.transparent,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.bgTextInputDefault,
        hintStyle: textTheme.bodyMedium?.copyWith(color: colors.txTextInputPlaceholder),
        labelStyle: textTheme.bodyMedium?.copyWith(color: colors.txContentSecondaryDefault),
        errorStyle: textTheme.bodySmall?.copyWith(color: colors.btnCriticalPrimaryDefault),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.bdTextInputDefault),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.btnPrimaryDefault),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.bdTextInputError),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.bdTextInputError),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.dvDefault),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: colors.dvDefault,
        space: 1,
        thickness: 1,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colors.btnPrimaryDefault,
        circularTrackColor: colors.dvDefault,
        linearTrackColor: colors.dvDefault,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colors.bgToastmessageDefault,
        closeIconColor: colors.txToastmessage,
        contentTextStyle: textTheme.bodyMedium?.copyWith(color: colors.txToastmessage),
        actionTextColor: colors.txToastmessage,
      ),
      cardTheme: CardThemeData(
        color: colors.bgCard,
        surfaceTintColor: AppColorsV2.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: colors.bdDefault),
        ),
      ),
    );
  }
}

@immutable

/// Theme extension exposing semantic color tokens used by the UIKit.
class MayThemeColorsV2 extends ThemeExtension<MayThemeColorsV2> {
  const MayThemeColorsV2({required this.tokens});

  final Map<String, Color> tokens;

  Color _color(String name) => tokens[name]!;

  // Background
  Color get bgAppSurface => _color('bgAppSurface');
  Color get bgBtnOutlineDefault => _color('bgBtnOutlineDefault');
  Color get bgCard => _color('bgCard');
  Color get bgCardBlue => _color('bgCardBlue');
  Color get bgCardGradientDefaultEnd => _color('bgCardGradientDefaultEnd');
  Color get bgCardGradientDefaultStart => _color('bgCardGradientDefaultStart');
  Color get bgCardGradientThemeEnd => _color('bgCardGradientThemeEnd');
  Color get bgCardGradientThemeStart => _color('bgCardGradientThemeStart');
  Color get bgCardHighlight => _color('bgCardHighlight');
  Color get bgCardMiniStudent => _color('bgCardMiniStudent');
  Color get bgCardOrange => _color('bgCardOrange');

  /// End color of the placeholder image background gradient.
  Color get bgImagePlaceholderEnd => _color('bgImagePlaceholderEnd');

  /// Start color of the placeholder image background gradient.
  Color get bgImagePlaceholderStart => _color('bgImagePlaceholderStart');

  Color get bgHeaderSurface => _color('bgHeaderSurface');
  Color get headerDefault => _color('headerDefault');
  Color get bgIconButton => _color('bgIconButton');
  Color get bgIcon => _color('bgIcon');
  Color get bgIconTertiary => _color('bgIconTertiary');
  Color get bgTabActive => _color('bgTabActive');
  Color get bgTabToday => _color('bgTabToday');
  Color get bdTabToday => _color('bdTabToday');
  Color get txTabToday => _color('txTabToday');
  Color get bgTabInactive => _color('bgTabInactive');
  Color get bgTextInputDefault => _color('bgTextInputDefault');
  Color get bgTextInputInactive => _color('bgTextInputInactive');
  Color get bgTextInputError => _color('bgTextInputError');
  Color get bgToastmessageDefault => _color('bgToastmessageDefault');
  Color get bgWhiteBtn => _color('bgWhiteBtn');
  Color get bgCardRed => _color('bgCardRed');
  Color get bgGreySurface => _color('bgGreySurface');
  Color get bgSurface => _color('bgSurface');

  /// Background shared by sent chat message bubbles.
  Color get bgChatMessage => _color('bgChatMessage');

  Color get bgFieldDisabled => _color('bgFieldDisabled');
  Color get bgDefault => _color('bgDefault');
  Color get bgToastMsgDefault => _color('bgToastMsgDefault');

  // Banner
  Color get bnBgAttention => _color('bnBgAttention');
  Color get bnBorderAttention => _color('bnBorderAttention');
  Color get bnTextAttention => _color('bnTextAttention');
  Color get bnBgCritical => _color('bnBgCritical');
  Color get bnBorderCritical => _color('bnBorderCritical');
  Color get bnTextCritical => _color('bnTextCritical');
  Color get bnBgCrititcal => bnBgCritical;
  Color get bnBorderCrititcal => bnBorderCritical;
  Color get bnTextCrititcal => bnTextCritical;
  Color get bnBgInfo => _color('bnBgInfo');
  Color get bnBorderInfo => _color('bnBorderInfo');
  Color get bnTextInfo => _color('bnTextInfo');
  Color get bnBgSuccess => _color('bnBgSuccess');
  Color get bnBorderSuccess => _color('bnBorderSuccess');
  Color get bnTextSuccess => _color('bnTextSuccess');
  Color get bnBgWarning => _color('bnBgWarning');
  Color get bnBorderWarning => _color('bnBorderWarning');
  Color get bnTextWarning => _color('bnTextWarning');

  // Border
  Color get bdCard => _color('bdCard');
  Color get bdCardRed => _color('bdCardRed');
  Color get bdDefault => _color('bdDefault');
  Color get bdDirectBtn => _color('bdDirectBtn');
  Color get bdTextInputBorder => _color('bdTextInputBorder');
  Color get bdTabInactive => _color('bdTabInactive');
  Color get bdTextInputDefault => _color('bdTextInputDefault');
  Color get bdTextInputInactiveSearch => _color('bdTextInputInactiveSearch');
  Color get bdOutlineDefault => _color('bdOutlineDefault');
  Color get bdTextInputError => _color('bdTextInputError');
  Color get bdRadio => _color('bdRadio');

  // Button
  Color get btnBgCriticalOutlineDefault => _color('btnBgCriticalOutlineDefault');
  Color get btnBgCriticalOutlineDisable => _color('btnBgCriticalOutlineDisable');
  Color get btnCriticalOutlineDefault => _color('btnCriticalOutlineDefault');
  Color get btnCriticalOutlineDisable => _color('btnCriticalOutlineDisable');
  Color get btnCriticalPrimaryDefault => _color('btnCriticalPrimaryDefault');
  Color get btnCriticalPrimaryDisable => _color('btnCriticalPrimaryDisable');
  Color get btnBgDisablePrimary => _color('btnBgDisablePrimary');
  Color get btnBgDisableSecondary => _color('btnBgDisableSecondary');
  Color get btnOutlineDefault => _color('btnOutlineDefault');
  Color get btnPrimaryBorderDefault => _color('btnPrimaryBorderDefault');
  Color get btnPrimaryDefault => _color('btnPrimaryDefault');
  Color get btnSecondaryDefault => _color('btnSecondaryDefault');
  Color get btnTextonlyDefault => _color('btnTextonlyDefault');

  // Divider, icon, shadow
  Color get dvDefault => _color('dvDefault');
  Color get icColor => _color('icColor');
  Color get icDisable => _color('icDisable');
  Color get icDirectBtn => _color('icDirectBtn');
  Color get icPrimary => _color('icPrimary');
  Color get icSecondary => _color('icSecondary');
  Color get sdBannerCritical => _color('sdBannerCritical');
  Color get sdBannerInfo => _color('sdBannerInfo');
  Color get sdBtnDefault => _color('sdBtnDefault');
  Color get sdBtnGreenDefault => _color('sdBtnGreenDefault');
  Color get sdBtnGreenSecondary => _color('sdBtnGreenSecondary');
  Color get sdBtnOrangeDefault => _color('sdBtnOrangeDefault');
  Color get sdBtnOrangeSecondary => _color('sdBtnOrangeSecondary');
  Color get sdBtnPinkDefault => _color('sdBtnPinkDefault');
  Color get sdBtnPinkSecondary => _color('sdBtnPinkSecondary');
  Color get sdBtnPrimaryDefault => _color('sdBtnPrimaryDefault');
  Color get sdBtnPrimaryDisable => _color('sdBtnPrimaryDisable');
  Color get sdBtnSecondaryDisable => _color('sdBtnSecondaryDisable');
  Color get sdBtnOutlineDefault => _color('sdBtnOutlineDefault');
  Color get sdCard => _color('sdCard');
  Color get sdCriticalBtnDefault => _color('sdCriticalBtnDefault');
  Color get sdDefault => _color('sdDefault');
  Color get sdGreen => _color('sdGreen');
  Color get sdGreenDark => _color('sdGreenDark');
  Color get sdOrange => _color('sdOrange');
  Color get sdOutlineCritBtnDefault => _color('sdOutlineCritBtnDefault');
  Color get sdPink => _color('sdPink');
  Color get sdTabActive => _color('sdTabActive');
  Color get sdRadio => _color('sdRadio');

  // Text
  Color get txBgColorSecondary => _color('txBgColorSecondary');
  Color get txBtnGreenSecondaryOutline => _color('txBtnGreenSecondaryOutline');
  Color get txBtnCriticalDefault => _color('txBtnCriticalDefault');
  Color get txBtnOrangeSecondaryOutline => _color('txBtnOrangeSecondaryOutline');
  Color get txBtnPinkSecondaryOutline => _color('txBtnPinkSecondaryOutline');
  Color get txBtnThemeLabel => _color('txBtnThemeLabel');
  Color get txButtonPrimary => _color('txButtonPrimary');
  Color get txBtnPrimaryDisable => _color('txBtnPrimaryDisable');
  Color get txBtnSecondaryDisable => _color('txBtnSecondaryDisable');
  Color get txContentPrimaryDefault => _color('txContentPrimaryDefault');
  Color get txContentSecondaryDefault => _color('txContentSecondaryDefault');
  Color get txCancel => _color('txCancel');
  Color get txCritical => _color('txCritical');
  Color get txDirectBtn => _color('txDirectBtn');
  Color get txHelptext => _color('txHelptext');
  Color get txModalDescription => _color('txModalDescription');
  Color get txTextInputPlaceholder => _color('txTextInputPlaceholder');
  Color get txToastMessage => _color('txToastMessage');
  Color get txToastmessage => _color('txToastmessage');
  Color get txTabActive => _color('txTabActive');
  Color get txTitleEmptyState => _color('txTitleEmptyState');
  Color get txDescriptionEmptyState => _color('txDescriptionEmptyState');
  Color get txToastMsgDefault => _color('txToastMsgDefault');
  Color get txContentTertiary => _color('txContentTertiary');
  Color get txPrimaryTheme => _color('txPrimaryTheme');

  // Calendar picker
  Color get bgSelectedDay => _color('bgSelectedDay');
  Color get bgInRangeDay => _color('bgInRangeDay');
  Color get bgDayArrowButton => _color('bgDayArrowButton');
  Color get indicatorFullDay => _color('indicatorFullDay');
  Color get indicatorFullDaySelected => _color('indicatorFullDaySelected');
  Color get indicatorOffDay => _color('indicatorOffDay');
  Color get indicatorHalfDayLeft => _color('indicatorHalfDayLeft');
  Color get indicatorHalfDayRight => _color('indicatorHalfDayRight');
  Color get indicatorHalfDaySelectedLeft => _color('indicatorHalfDaySelectedLeft');
  Color get indicatorHalfDaySelectedRight => _color('indicatorHalfDaySelectedRight');
  Color get txDayDefault => _color('txDayDefault');
  Color get txDayInRange => _color('txDayInRange');
  Color get txDayDimmed => _color('txDayDimmed');
  Color get txDaySelected => _color('txDaySelected');

  // Compatibility getters for existing UIKit code.
  Color get background => bgAppSurface;
  Color get surface => bgCard;
  Color get inverseSurface => bgToastmessageDefault;
  Color get primaryText => txContentPrimaryDefault;
  Color get secondaryText => txContentSecondaryDefault;
  Color get modalDescription => txModalDescription;
  Color get tertiaryText => txBgColorSecondary;
  Color get disabledText => btnCriticalOutlineDisable;
  Color get border => bdDefault;
  Color get divider => dvDefault;
  Color get primaryButton => btnPrimaryDefault;
  Color get pressedPrimaryButton => btnPrimaryDefault;
  Color get disabledButton => btnCriticalPrimaryDisable;
  Color get onPrimaryButton => txButtonPrimary;
  Color get secondaryButton => btnSecondaryDefault;
  Color get onSecondaryButton => txContentPrimaryDefault;
  Color get error => btnCriticalPrimaryDefault;
  Color get success => bnBorderSuccess;
  Color get warning => bnBorderWarning;
  Color get shimmerBase => bgAppSurface;
  Color get shimmerHighlight => bgCard;
  Color get infoBannerBg => bnBgInfo;
  Color get infoBannerText => txContentPrimaryDefault;
  Color get bannerTextInfo => bnTextInfo;
  Color get infoBannerSubText => txContentSecondaryDefault;

  // Palette-specific optional tokens — safe fallbacks for base themes.
  Color get themeAccent => tokens['themeAccent'] ?? primaryButton;
  Color get themeAccentSoft => tokens['themeAccentSoft'] ?? bgCardHighlight;
  Color get headerGradientStart => tokens['headerGradientStart'] ?? bgAppSurface;
  Color get headerGradientMiddle => tokens['headerGradientMiddle'] ?? bgAppSurface;
  Color get headerGradientEnd => tokens['headerGradientEnd'] ?? bgAppSurface;

  @override

  /// Returns a copy with overridden [tokens].
  MayThemeColorsV2 copyWith({Map<String, Color>? tokens}) {
    return MayThemeColorsV2(
      tokens: {
        ...this.tokens,
        if (tokens != null) ...tokens,
      },
    );
  }

  @override

  /// Linearly interpolates between this theme extension and [other].
  MayThemeColorsV2 lerp(ThemeExtension<MayThemeColorsV2>? other, double t) {
    if (other is! MayThemeColorsV2) {
      return this;
    }

    final lerpedTokens = <String, Color>{};
    for (final entry in tokens.entries) {
      lerpedTokens[entry.key] = Color.lerp(
        entry.value,
        other.tokens[entry.key] ?? entry.value,
        t,
      )!;
    }
    for (final entry in other.tokens.entries) {
      lerpedTokens.putIfAbsent(
        entry.key,
        () => Color.lerp(tokens[entry.key] ?? entry.value, entry.value, t)!,
      );
    }

    return MayThemeColorsV2(tokens: lerpedTokens);
  }
}

/// Exposes [MayThemeColorsV2] directly from [BuildContext].
extension MayThemeColorExtension on BuildContext {
  MayThemeColorsV2 get mayColors {
    return Theme.of(this).extension<MayThemeColorsV2>() ?? MainThemeV2.lightColors;
  }
}
