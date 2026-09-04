import 'package:flutter/material.dart';

import '../../may_uikit_internal.dart';
import '../../resources/generated/assets.gen.dart';

/// Định danh màu ứng dụng.
///
/// BE trả về giá trị này để xác định màu đang chọn.
enum AppColorId {
  /// Màu xanh lá.
  green,

  /// Màu hồng.
  pink,

  /// Màu cam.
  orange;

  /// Chuyển đổi chuỗi từ API sang [AppColorId].
  /// Trả về `null` nếu không tìm thấy.
  static AppColorId? fromCode(String value) {
    for (final id in AppColorId.values) {
      if (id.name == value) return id;
    }
    return null;
  }
}

/// Card hiển thị danh sách màu ứng dụng để người dùng chọn.
///
/// Toàn bộ màu sắc và ảnh nền được hardcode bên trong `may-uikit`.
/// Screen chỉ cần truyền [selectedId] và [onSelected].
class AppColorPickerCardV2 extends StatelessWidget {
  /// Khởi tạo [AppColorPickerCardV2].
  const AppColorPickerCardV2({
    super.key,
    required this.title,
    this.icon,
    required this.selectedId,
    this.onSelected,
  });

  /// Tiêu đề của thẻ.
  final String title;

  /// Biểu tượng của thẻ.
  final String? icon;

  /// ID của màu đang được chọn.
  final AppColorId selectedId;

  /// Callback khi người dùng chọn màu.
  final ValueChanged<AppColorId>? onSelected;

  static final _colorDefs = [
    _ColorDef(
      id: AppColorId.green,
      lightColor: AppColorsV2.greenTheme300,
      darkColor: AppColorsV2.greenTheme700,
      base500: AppColorsV2.greenTheme500,
      base700: AppColorsV2.greenTheme700,
      lightIcColor: AppColorsV2.greenTheme600,
      darkIcColor: AppColorsV2.genericWhite,
      lightBgIcon: AppColorsV2.greenTheme100,
      darkBgIcon: AppColorsV2.greenTheme600,
      lightBgSurface: AppColorsV2.greenTheme100,
      darkBgSurface: AppColorsV2.greenTheme600,
      lightBgTabActive: AppColorsV2.greenTheme500,
      darkBgTabActive: AppColorsV2.greenTheme600,
      bdRadio: AppColorsV2.greenTheme600,
      sdRadio: AppColorsV2.greenTheme600,
      gradientColors: [
        AppColorsV2.greenTheme300,
        AppColorsV2.greenTheme200,
        AppColorsV2.greenTheme100.withValues(alpha: 0.6),
      ],
      calendarAccent: AppColorsV2.greenTheme500,
      calendarAccentDark: AppColorsV2.greenTheme700,
      calendarTint: AppColorsV2.greenTheme100,
      textTheme: AppColorsV2.greenTheme600,
    ),
    _ColorDef(
      id: AppColorId.pink,
      lightColor: AppColorsV2.pinkTheme200,
      darkColor: AppColorsV2.pinkTheme700,
      base500: AppColorsV2.pinkTheme500,
      base700: AppColorsV2.pinkTheme700,
      lightIcColor: AppColorsV2.pinkTheme600,
      darkIcColor: AppColorsV2.genericWhite,
      lightBgIcon: AppColorsV2.pinkTheme100,
      darkBgIcon: AppColorsV2.pinkTheme600,
      lightBgSurface: AppColorsV2.pinkTheme100,
      darkBgSurface: AppColorsV2.pinkTheme600,
      lightBgTabActive: AppColorsV2.pinkTheme500,
      darkBgTabActive: AppColorsV2.pinkTheme600,
      bdRadio: AppColorsV2.pinkTheme600,
      sdRadio: AppColorsV2.pinkTheme600,
      gradientColors: [
        AppColorsV2.pinkTheme300,
        AppColorsV2.pinkTheme200,
        AppColorsV2.pinkTheme100.withValues(alpha: 0.6),
      ],
      calendarAccent: AppColorsV2.pinkTheme500,
      calendarAccentDark: AppColorsV2.pinkTheme700,
      calendarTint: AppColorsV2.pinkTheme100,
      textTheme: AppColorsV2.pinkTheme600,
    ),
    _ColorDef(
      id: AppColorId.orange,
      lightColor: AppColorsV2.orangeTheme200,
      darkColor: AppColorsV2.orangeTheme700,
      base500: AppColorsV2.orangeTheme500,
      base700: AppColorsV2.orangeTheme700,
      lightIcColor: AppColorsV2.orangeTheme600,
      darkIcColor: AppColorsV2.genericWhite,
      lightBgIcon: AppColorsV2.orangeTheme100,
      darkBgIcon: AppColorsV2.orangeTheme600,
      lightBgSurface: AppColorsV2.orangeTheme100,
      darkBgSurface: AppColorsV2.orangeTheme600,
      lightBgTabActive: AppColorsV2.orangeTheme500,
      darkBgTabActive: AppColorsV2.orangeTheme600,
      bdRadio: AppColorsV2.orangeTheme600,
      sdRadio: AppColorsV2.orangeTheme600,
      gradientColors: [
        AppColorsV2.orangeTheme300,
        AppColorsV2.orangeTheme200,
        AppColorsV2.orangeTheme100.withValues(alpha: 0.6),
      ],
      calendarAccent: AppColorsV2.orangeTheme500,
      calendarAccentDark: AppColorsV2.orangeTheme700,
      calendarTint: AppColorsV2.orangeTheme100,
      textTheme: AppColorsV2.orangeTheme600,
    ),
  ];

  static List<_AppColorEntry> _options(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return _colorDefs
        .map((def) => _AppColorEntry(
              id: def.id,
              color: isDark ? def.darkColor : def.lightColor,
              previewColor: def.base500,
              borderColor: def.base500,
              patternAssetPath: Assets.images.accountInfoColorPattern.path,
            ))
        .toList();
  }

  /// Trả về màu [Color] tương ứng với [AppColorId] theo mode hiện tại.
  static Color colorOf(AppColorId id, {bool isDark = false}) {
    final def = _colorDefs.firstWhere((e) => e.id == id, orElse: () => _colorDefs.first);
    return isDark ? def.darkColor : def.lightColor;
  }

  /// Trả về màu border (shade 500) cứng theo [AppColorId], không phụ thuộc theme.
  static Color borderColorOf(AppColorId id) {
    final def = _colorDefs.firstWhere((e) => e.id == id, orElse: () => _colorDefs.first);
    return def.base500;
  }

  /// Trả về màu shadow cứng theo [AppColorId], không phụ thuộc theme.
  static Color shadowColorOf(AppColorId id) {
    final def = _colorDefs.firstWhere((e) => e.id == id, orElse: () => _colorDefs.first);
    return def.base700;
  }

  /// Trả về màu [Color] tương ứng với [AppColorId] theo mode hiện tại.
  static Color textThemeOf(AppColorId id) {
    final def = _colorDefs.firstWhere((e) => e.id == id, orElse: () => _colorDefs.first);
    return def.textTheme;
  }

  /// Trả về [AppColorId] từ [color] nếu tìm thấy trong options.
  static AppColorId? idOfColor(Color color) {
    for (final def in _colorDefs) {
      if (def.lightColor.toARGB32() == color.toARGB32() ||
          def.darkColor.toARGB32() == color.toARGB32()) {
        return def.id;
      }
    }
    return null;
  }

  /// Tạo theme colors tùy chỉnh đã bao gồm các token gradient để hỗ trợ animation mượt mà
  static MayThemeColorsV2 getCustomColors(
    MayThemeColorsV2 base,
    AppColorId id, {
    bool isDarkMode = false,
  }) {
    final def = _colorDefs.firstWhere((e) => e.id == id);
    final gradient = gradientOf(id, isDarkMode: isDarkMode) as LinearGradient;
    return base.copyWith(tokens: {
      'headerDefault': colorOf(id, isDark: isDarkMode),
      'bdCard': borderColorOf(id),
      'sdCard': shadowColorOf(id),
      'btnPrimaryDefault': borderColorOf(id),
      'btnPrimaryBorderDefault': AppColorsV2.transparent,
      'sdBtnDefault': shadowColorOf(id),
      'icColor': icColorOf(id, isDarkMode: isDarkMode),
      'bgIcon': bgIconColorOf(id, isDarkMode: isDarkMode),
      'bgSurface': bgSurfaceColorOf(id, isDarkMode: isDarkMode),
      'bgTabActive': bgTabActiveColorOf(id, isDarkMode: isDarkMode),
      'bdRadio': bdRadioColorOf(id),
      'bdTextInputBorder': bdRadioColorOf(id),
      'sdRadio': sdRadioColorOf(id),
      'sdTabActive': sdTabActiveColorOf(id),
      'bgCardGradientThemeStart': themeGradientStartOf(id),
      'bgCardGradientThemeEnd': themeGradientEndOf(id),
      'headerGradientStart': gradient.colors[0],
      'headerGradientMiddle': gradient.colors[1],
      'headerGradientEnd': gradient.colors[2],
      'bgDefault': isDarkMode ? AppColorsV2.neutral600 : shadowColorOf(id),
      'bgSelectedDay': def.calendarAccent,
      'bgInRangeDay': def.calendarTint,
      'bgDayArrowButton': def.calendarTint,
      'indicatorFullDay': def.calendarAccent,
      'indicatorFullDaySelected': def.calendarAccentDark,
      'indicatorOffDay': AppColorsV2.neutral200,
      'indicatorHalfDayLeft': def.calendarAccent,
      'indicatorHalfDayRight': AppColorsV2.neutral200,
      'indicatorHalfDaySelectedLeft': AppColorsV2.genericWhite,
      'indicatorHalfDaySelectedRight': def.calendarAccentDark,
      'txDayDefault': isDarkMode ? AppColorsV2.neutral50 : AppColorsV2.neutral900,
      'txDayInRange': AppColorsV2.neutral900,
      'txDayDimmed': isDarkMode ? AppColorsV2.neutral500 : AppColorsV2.neutral300,
      'txDaySelected': AppColorsV2.genericWhite,
      'txPrimaryTheme': textThemeOf(id),
    });
  }

  /// Trả về gradient tương ứng với [AppColorId].
  static Gradient gradientOf(AppColorId id, {bool isDarkMode = false}) {
    if (isDarkMode) {
      return LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColorsV2.genericBlack,
          AppColorsV2.neutral700,
          AppColorsV2.neutral500.withValues(alpha: 0.6),
        ],
        stops: const [0, 0.65, 1],
      );
    }

    final def = _colorDefs.firstWhere((e) => e.id == id, orElse: () => _colorDefs.first);
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: def.gradientColors,
      stops: const [0, 0.65, 1],
    );
  }

  /// Trả về màu đầu gradient card theo [AppColorId].
  static Color themeGradientStartOf(AppColorId id) {
    return switch (id) {
      AppColorId.green => AppColorsV2.greenTheme500,
      AppColorId.pink => AppColorsV2.pinkTheme500,
      AppColorId.orange => AppColorsV2.orangeTheme500,
    };
  }

  /// Trả về màu cuối gradient card theo [AppColorId].
  static Color themeGradientEndOf(AppColorId id) {
    return switch (id) {
      AppColorId.green => AppColorsV2.greenTheme800,
      AppColorId.pink => AppColorsV2.pinkTheme800,
      AppColorId.orange => AppColorsV2.orangeTheme800,
    };
  }

  /// Trả về màu icon (token `icColor`) theo [AppColorId].
  static Color icColorOf(AppColorId id, {bool isDarkMode = false}) {
    final def = _colorDefs.firstWhere((e) => e.id == id, orElse: () => _colorDefs.first);
    return isDarkMode ? def.darkIcColor : def.lightIcColor;
  }

  /// Trả về màu nền icon tròn (token `bgIcon`) theo [AppColorId] và mode hiện tại.
  static Color bgIconColorOf(AppColorId id, {bool isDarkMode = false}) {
    final def = _colorDefs.firstWhere((e) => e.id == id, orElse: () => _colorDefs.first);
    return isDarkMode ? def.darkBgIcon : def.lightBgIcon;
  }

  /// Trả về màu surface (token `bgSurface`) theo [AppColorId] và mode hiện tại.
  static Color bgSurfaceColorOf(AppColorId id, {bool isDarkMode = false}) {
    final def = _colorDefs.firstWhere((e) => e.id == id, orElse: () => _colorDefs.first);
    return isDarkMode ? def.darkBgSurface : def.lightBgSurface;
  }

  /// Trả về màu nền tab đang active (token `bgTabActive`) theo [AppColorId] và mode hiện tại.
  static Color bgTabActiveColorOf(AppColorId id, {bool isDarkMode = false}) {
    final def = _colorDefs.firstWhere((e) => e.id == id, orElse: () => _colorDefs.first);
    return isDarkMode ? def.darkBgTabActive : def.lightBgTabActive;
  }

  /// Trả về màu border radio (token `bdRadio`) theo [AppColorId].
  static Color bdRadioColorOf(AppColorId id) {
    final def = _colorDefs.firstWhere((e) => e.id == id, orElse: () => _colorDefs.first);
    return def.bdRadio;
  }

  /// Trả về màu shadow radio (token `sdRadio`) theo [AppColorId].
  static Color sdRadioColorOf(AppColorId id) {
    final def = _colorDefs.firstWhere((e) => e.id == id, orElse: () => _colorDefs.first);
    return def.sdRadio;
  }

  /// Trả về màu shadow tab đang active (token `sdTabActive`) theo [AppColorId].
  static Color sdTabActiveColorOf(AppColorId id) {
    final def = _colorDefs.firstWhere((e) => e.id == id, orElse: () => _colorDefs.first);
    return def.base700;
  }

  /// Builds the app color picker card.
  @override
  Widget build(BuildContext context) {
    return CardV2(
      title: title,
      icon: icon,
      padding: const EdgeInsets.all(AppSpacingV2.cardLg),
      borderRadius: AppRadiusV2.x3l,
      child: _AppColorPickerList(
        options: _options(context),
        selectedId: selectedId,
        onSelected: onSelected,
      ),
    );
  }
}

class _ColorDef {
  const _ColorDef({
    required this.id,
    required this.lightColor,
    required this.darkColor,
    required this.base500,
    required this.base700,
    required this.lightIcColor,
    required this.darkIcColor,
    required this.lightBgIcon,
    required this.darkBgIcon,
    required this.lightBgSurface,
    required this.darkBgSurface,
    required this.lightBgTabActive,
    required this.darkBgTabActive,
    required this.bdRadio,
    required this.sdRadio,
    required this.gradientColors,
    required this.calendarAccent,
    required this.calendarAccentDark,
    required this.calendarTint,
    required this.textTheme,
  });

  final AppColorId id;
  final Color lightColor;
  final Color darkColor;
  final Color base500;
  final Color base700;
  final Color lightIcColor;
  final Color darkIcColor;
  final Color lightBgIcon;
  final Color darkBgIcon;
  final Color lightBgSurface;
  final Color darkBgSurface;
  final Color lightBgTabActive;
  final Color darkBgTabActive;
  final Color bdRadio;
  final Color sdRadio;
  final List<Color> gradientColors;
  final Color textTheme;

  /// Selected day background (e.g. green/pink/orange 500).
  final Color calendarAccent;

  /// Selected-state indicator (e.g. green/pink/orange 700).
  final Color calendarAccentDark;

  /// In-range day background tint (e.g. green/pink/orange 100).
  final Color calendarTint;
}

class _AppColorEntry {
  const _AppColorEntry({
    required this.id,
    required this.color,
    required this.previewColor,
    required this.borderColor,
    required this.patternAssetPath,
  });

  final AppColorId id;
  final Color color;
  final Color previewColor;
  final Color borderColor;
  final String patternAssetPath;
}

class _AppColorPickerList extends StatefulWidget {
  const _AppColorPickerList({
    required this.options,
    required this.selectedId,
    required this.onSelected,
  });

  final List<_AppColorEntry> options;
  final AppColorId selectedId;
  final ValueChanged<AppColorId>? onSelected;

  /// Creates the scrollable picker list state.
  @override
  State<_AppColorPickerList> createState() => _AppColorPickerListState();
}

class _AppColorPickerListState extends State<_AppColorPickerList> {
  late final ScrollController _scrollController;

  /// Initializes the internal scroll controller.
  @override
  void initState() {
    super.initState();
    final selectedIndex = widget.options.indexWhere((e) => e.id == widget.selectedId);
    double initialOffset = 0.0;
    if (selectedIndex > 0) {
      final itemWidth = _ColorOptionWidget._outerSize;
      const spacing = AppSpacingV2.x2s;
      initialOffset = selectedIndex * (itemWidth + spacing);
    }
    _scrollController = ScrollController(initialScrollOffset: initialOffset);
  }

  /// Disposes the internal scroll controller.
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// Reacts to selection updates and scrolls the active item into view.
  @override
  void didUpdateWidget(_AppColorPickerList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedId != widget.selectedId) {
      final selectedIndex = widget.options.indexWhere((e) => e.id == widget.selectedId);
      if (selectedIndex >= 0) {
        final itemWidth = _ColorOptionWidget._outerSize;
        const spacing = AppSpacingV2.x2s;
        final offset = selectedIndex * (itemWidth + spacing);

        if (mounted && _scrollController.hasClients) {
          _scrollController.animateTo(
            offset,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutBack,
          );
        }
      }
    }
  }

  /// Builds the horizontal list of selectable color options.
  @override
  Widget build(BuildContext context) {
    final selectedIndex = widget.options.indexWhere((e) => e.id == widget.selectedId);
    final selectedEntry = selectedIndex >= 0 ? widget.options[selectedIndex] : null;
    const itemStep = _ColorOptionWidget._outerSize + AppSpacingV2.x2s;
    final borderLeft = selectedIndex >= 0 ? selectedIndex * itemStep : 0.0;

    return SizedBox(
      height: _ColorOptionWidget._outerSize,
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              children: List.generate(widget.options.length, (index) {
                return Padding(
                  padding: EdgeInsets.only(
                    right: index < widget.options.length - 1 ? AppSpacingV2.x2s : 0,
                  ),
                  child: GestureDetector(
                    onTap: widget.onSelected != null
                        ? () => widget.onSelected!(widget.options[index].id)
                        : null,
                    child: _ColorOptionWidget(
                      option: widget.options[index],
                      isSelected: widget.options[index].id == widget.selectedId,
                    ),
                  ),
                );
              }),
            ),
            if (selectedEntry != null)
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOutBack,
                left: borderLeft,
                top: 0,
                width: _ColorOptionWidget._outerSize,
                height: _ColorOptionWidget._outerSize,
                child: IgnorePointer(
                  child: TweenAnimationBuilder<Color?>(
                    tween: ColorTween(end: selectedEntry.borderColor),
                    duration: const Duration(milliseconds: 350),
                    builder: (context, color, _) => DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          _ColorOptionWidget._outerRadius,
                        ),
                        border: Border.all(
                          color: color ?? selectedEntry.borderColor,
                          width: DimensV2.d1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ColorOptionWidget extends StatelessWidget {
  const _ColorOptionWidget({
    required this.option,
    required this.isSelected,
  });

  static const double _outerSize = DimensV2.d72;
  static const double _innerSize = DimensV2.d60;
  static const double _outerRadius = DimensV2.d22;
  static const double _innerRadius = DimensV2.d16;
  static const double _indicatorSize = DimensV2.d30;

  final _AppColorEntry option;
  final bool isSelected;

  /// Builds a single animated color option.
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      key: ValueKey(isSelected),
      tween: Tween<double>(begin: isSelected ? 1.18 : 1.0, end: 1.0),
      duration: isSelected ? const Duration(milliseconds: 650) : const Duration(milliseconds: 250),
      curve: isSelected ? Curves.elasticOut : Curves.easeOut,
      builder: (context, scale, child) => Transform.scale(scale: scale, child: child),
      child: SizedBox(
        width: _outerSize,
        height: _outerSize,
        child: Padding(
          padding: const EdgeInsets.all(DimensV2.d6),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(_innerRadius),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: _innerSize,
                  height: _innerSize,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: option.previewColor,
                      borderRadius: BorderRadius.circular(_innerRadius),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: CommonImageV2.asset(
                    path: option.patternAssetPath,
                    package: Assets.package,
                    fit: BoxFit.cover,
                  ),
                ),
                if (isSelected)
                  SizedBox(
                    width: _indicatorSize,
                    height: _indicatorSize,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Assets.icons.accountInfoColorTickRing.svg(
                          width: _indicatorSize,
                          height: _indicatorSize,
                        ),
                        Assets.icons.accountInfoColorTickCheck.svg(
                          width: DimensV2.d13,
                          height: DimensV2.d13,
                          colorFilter: ColorFilter.mode(
                            option.borderColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Enum định nghĩa chế độ giao diện ứng dụng.
enum AppThemeMode {
  /// Giao diện sáng.
  light,

  /// Giao diện tối.
  dark,

  /// Theo hệ thống (tự động).
  auto;

  /// Chuyển đổi chuỗi từ API sang [AppThemeMode].
  /// Trả về `null` nếu không tìm thấy.
  static AppThemeMode? fromCode(String value) {
    for (final mode in AppThemeMode.values) {
      if (mode.name == value) return mode;
    }
    return null;
  }
}

/// Card bọc ngoài picker giao diện, hardcode danh sách theme bên trong.
///
/// Screen chỉ cần truyền [selectedMode], [onModeSelected], và [title].
class AppThemePickerCardV2 extends StatelessWidget {
  /// Khởi tạo [AppThemePickerCardV2].
  const AppThemePickerCardV2({
    super.key,
    required this.title,
    this.icon,
    required this.selectedMode,
    this.selectedBorderColor,
    this.colorId = AppColorId.green,
    this.onModeSelected,
  });

  /// Tiêu đề thẻ.
  final String title;

  /// Biểu tượng thẻ.
  final String? icon;

  /// Chế độ giao diện đang chọn.
  final AppThemeMode selectedMode;

  /// Màu viền khi item được chọn. Mặc định dùng [Theme.of(context).primaryColor].
  final Color? selectedBorderColor;

  /// ID màu ứng dụng đang chọn — dùng để chọn ảnh preview đúng bộ màu.
  final AppColorId colorId;

  /// Callback khi chọn chế độ.
  final ValueChanged<AppThemeMode>? onModeSelected;

  /// Builds the outer theme picker card.
  @override
  Widget build(BuildContext context) {
    return CardV2(
      title: title,
      icon: icon,
      padding: const EdgeInsets.all(AppSpacingV2.cardLg),
      borderRadius: AppRadiusV2.x3l,
      child: AppThemePickerV2(
        selectedMode: selectedMode,
        selectedBorderColor: selectedBorderColor ?? AppColorPickerCardV2.borderColorOf(colorId),
        colorId: colorId,
        onModeSelected: onModeSelected,
      ),
    );
  }
}

/// Widget picker giao diện — tự build danh sách Sáng/Tối/Tự động.
///
/// Toàn bộ ảnh preview hardcode bên trong `may-uikit`.
/// Screen chỉ truyền [selectedMode] và [onModeSelected].
class AppThemePickerV2 extends StatelessWidget {
  /// Khởi tạo [AppThemePickerV2].
  const AppThemePickerV2({
    super.key,
    required this.selectedMode,
    this.selectedBorderColor,
    this.colorId = AppColorId.green,
    this.onModeSelected,
    this.borderRadius = DimensV2.d16,
    this.spacing = AppSpacingV2.sm,
  });

  /// Chế độ giao diện đang được chọn.
  final AppThemeMode selectedMode;

  /// Màu viền khi item được chọn. Mặc định dùng [Theme.of(context).primaryColor].
  final Color? selectedBorderColor;

  /// ID màu ứng dụng — quyết định bộ ảnh preview.
  final AppColorId colorId;

  /// Callback khi người dùng chọn giao diện.
  final ValueChanged<AppThemeMode>? onModeSelected;

  /// Border radius của ảnh preview.
  final double borderRadius;

  /// Khoảng cách giữa các item.
  final double spacing;

  /// Danh sách chế độ hardcode.
  static const _modes = [AppThemeMode.light, AppThemeMode.dark, AppThemeMode.auto];

  /// Builds the inline theme picker.
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;
    final effectiveBorderColor = selectedBorderColor ?? AppColorPickerCardV2.borderColorOf(colorId);
    final selectedIndex = _modes.indexOf(selectedMode);

    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;
        final itemWidth = (totalWidth - spacing * (_modes.length - 1)) / _modes.length;
        final borderLeft = selectedIndex >= 0 ? selectedIndex * (itemWidth + spacing) : 0.0;

        return Stack(
          children: [
            Row(children: _buildItems(colors)),
            if (selectedIndex >= 0)
              AnimatedPositioned(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeOutBack,
                left: borderLeft,
                top: 0,
                width: itemWidth,
                height: itemWidth,
                child: IgnorePointer(
                  child: TweenAnimationBuilder<Color?>(
                    tween: ColorTween(end: effectiveBorderColor),
                    duration: const Duration(milliseconds: 250),
                    builder: (context, color, _) => DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(DimensV2.d22),
                        border: Border.all(
                          color: color ?? effectiveBorderColor,
                          width: DimensV2.d1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  List<Widget> _buildItems(MayThemeColorsV2 colors) {
    final result = <Widget>[];
    for (var i = 0; i < _modes.length; i++) {
      if (i > 0) {
        result.add(SizedBox(width: spacing));
      }
      result.add(Expanded(
        child: _ThemePickerItem(
          mode: _modes[i],
          label: _labelFor(_modes[i]),
          isSelected: _modes[i] == selectedMode,
          colors: colors,
          colorId: colorId,
          borderRadius: borderRadius,
          onTap: onModeSelected != null ? () => onModeSelected!(_modes[i]) : null,
        ),
      ));
    }
    return result;
  }

  static String _labelFor(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.light:
        return S.current.themeLight;
      case AppThemeMode.dark:
        return S.current.themeDark;
      case AppThemeMode.auto:
        return S.current.themeAuto;
    }
  }
}

class _ThemePickerItem extends StatelessWidget {
  const _ThemePickerItem({
    required this.mode,
    required this.label,
    required this.isSelected,
    required this.colors,
    required this.colorId,
    required this.borderRadius,
    this.onTap,
  });

  final AppThemeMode mode;
  final String label;
  final bool isSelected;
  final MayThemeColorsV2 colors;
  final AppColorId colorId;
  final double borderRadius;
  final VoidCallback? onTap;

  String get _assetPath {
    switch (colorId) {
      case AppColorId.green:
        switch (mode) {
          case AppThemeMode.light:
            return Assets.images.themeGreenLight.path;
          case AppThemeMode.dark:
            return Assets.images.themeGreenDark.path;
          case AppThemeMode.auto:
            return Assets.images.themeGreenAuto.path;
        }
      case AppColorId.pink:
        switch (mode) {
          case AppThemeMode.light:
            return Assets.images.themePinkLight.path;
          case AppThemeMode.dark:
            return Assets.images.themePinkDark.path;
          case AppThemeMode.auto:
            return Assets.images.themePinkAuto.path;
        }
      case AppColorId.orange:
        switch (mode) {
          case AppThemeMode.light:
            return Assets.images.themeOrangeLight.path;
          case AppThemeMode.dark:
            return Assets.images.themeOrangeDark.path;
          case AppThemeMode.auto:
            return Assets.images.themeOrangeAuto.path;
        }
    }
  }

  /// Builds an individual theme preview item.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TweenAnimationBuilder<double>(
            key: ValueKey(isSelected),
            tween: Tween<double>(begin: isSelected ? 1.15 : 1.0, end: 1.0),
            duration:
                isSelected ? const Duration(milliseconds: 600) : const Duration(milliseconds: 250),
            curve: isSelected ? Curves.elasticOut : Curves.easeOut,
            builder: (context, scale, child) => Transform.scale(scale: scale, child: child),
            child: Padding(
              padding: const EdgeInsets.all(DimensV2.d6),
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 380),
                    switchInCurve: Curves.easeOutCubic,
                    switchOutCurve: Curves.easeInCubic,
                    transitionBuilder: (child, animation) {
                      final isIncoming = child.key == ValueKey(_assetPath);
                      final offsetAnim = Tween<Offset>(
                        begin: isIncoming ? const Offset(0, 0.25) : const Offset(0, -0.25),
                        end: Offset.zero,
                      ).animate(animation);
                      return FadeTransition(
                        opacity: animation,
                        child: SlideTransition(
                          position: offsetAnim,
                          child: child,
                        ),
                      );
                    },
                    child: CommonImageV2.asset(
                      path: _assetPath,
                      key: ValueKey(_assetPath),
                      package: Assets.package,
                      fit: BoxFit.cover,
                      errorBuilder: (context, _) => Container(
                        color: colors.surface,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: DimensV2.d8),
          Text(
            label,
            style: AppTextStylesV2.text13Medium.copyWith(
              color: colors.secondaryText,
            ),
          ),
        ],
      ),
    );
  }
}
