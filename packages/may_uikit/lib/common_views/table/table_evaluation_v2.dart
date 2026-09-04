import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';

/// Data model cho một row trong bảng đánh giá.
/// [cells] là danh sách giá trị các ô, trong đó ô đầu tiên dùng cho cột cố định.
class SubjectYearEvaluationRowV2 {
  const SubjectYearEvaluationRowV2({
    required this.cells,
  });

  final List<String> cells;

  factory SubjectYearEvaluationRowV2.fromRawRow(List<String> row) {
    return SubjectYearEvaluationRowV2(cells: row);
  }
}

/// Width cố định cột đầu tiên theo Figma: 117px
const double _kFirstColumnWidth = 117.0;

// ---------------------------------------------------------------------------
// Header Row
// ---------------------------------------------------------------------------

/// Row tiêu đề của bảng. Cells dùng style Medium 13px, primary color.
class TableEvaluationHeaderRowV2 extends StatelessWidget {
  const TableEvaluationHeaderRowV2({
    super.key,
    required this.cells,
    this.showBottomDivider = true,
    this.isEqualColumns = false,
    this.hasDividerPadding = true,
    this.headerBold = false,
  });

  final List<String> cells;

  /// Hiển thị divider dưới row hay không (false cho row cuối cùng).
  final bool showBottomDivider;

  final bool isEqualColumns;
  final bool hasDividerPadding;
  final bool headerBold;

  /// Builds the header row using [text13Medium] style and [txContentPrimaryDefault] color.
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;
    return _RowContainer(
      showBottomDivider: showBottomDivider,
      hasDividerPadding: hasDividerPadding,
      isEqualColumns: isEqualColumns,
      child: _RowContent(
        cells: cells,
        isEqualColumns: isEqualColumns,
        textStyle: headerBold
            ? AppTextStylesV2.text14Semibold.copyWith(
                color: colors.txContentPrimaryDefault,
              )
            : AppTextStylesV2.text13Medium.copyWith(
                color: colors.txContentPrimaryDefault,
              ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Data Row
// ---------------------------------------------------------------------------

/// Row dữ liệu của bảng. Cells dùng style Medium 13px, primary color.
class TableEvaluationDataRowV2 extends StatelessWidget {
  const TableEvaluationDataRowV2({
    super.key,
    required this.cells,
    this.showBottomDivider = true,
    this.onTap,
    this.isEqualColumns = false,
    this.hasDividerPadding = true,
  });

  final List<String> cells;

  /// Hiển thị divider dưới row hay không (false cho row cuối cùng).
  final bool showBottomDivider;

  final VoidCallback? onTap;

  final bool isEqualColumns;
  final bool hasDividerPadding;

  /// Builds the data row using [text13Medium] style and [txContentPrimaryDefault] color.
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;
    final content = _RowContainer(
      showBottomDivider: showBottomDivider,
      hasDividerPadding: hasDividerPadding,
      isEqualColumns: isEqualColumns,
      child: _RowContent(
        cells: cells,
        isEqualColumns: isEqualColumns,
        textStyle: AppTextStylesV2.text13Medium.copyWith(
          color: colors.txContentPrimaryDefault,
        ),
      ),
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        child: content,
      );
    }
    return content;
  }
}

// ---------------------------------------------------------------------------
// Table (composed of header + data rows)
// ---------------------------------------------------------------------------

/// Bảng đánh giá V2.
///
/// [rows] là danh sách TẤT CẢ các row, bao gồm cả header:
/// - `rows[0]`  → header row (style tiêu đề)
/// - `rows[1:]` → data rows
class TableEvaluationV2 extends StatelessWidget {
  const TableEvaluationV2({
    super.key,
    required this.title,
    required this.rows,
    this.onRowTap,
    this.isEqualColumns = false,
    this.hasDividerPadding = true,
    this.headerBold = false,
  });

  final String title;

  /// Toàn bộ rows, rows[0] là header.
  final List<SubjectYearEvaluationRowV2> rows;

  /// Callback khi nhấn vào 1 row (trả về index nguyên bản của row, với rows[0] là header)
  final void Function(int index)? onRowTap;

  /// Nếu true, chia đều các cột (Expanded cho tất cả các cột).
  /// Nếu false, cột đầu tiên fix 117px.
  final bool isEqualColumns;
  final bool hasDividerPadding;
  final bool headerBold;

  /// Builds a [Column] containing the [title] and a [CardV2] wrapping all rows.
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty) ...[
          // Title
          Text(
            title,
            style: AppTextStylesV2.title3SemiBold.copyWith(
              color: colors.txContentPrimaryDefault,
            ),
          ),
          const SizedBox(height: DimensV2.d12),
        ],

        // Card bảng
        CardV2(
          padding: EdgeInsets.zero,
          borderColor: AppColorsV2.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(DimensV2.d20),
            child: Column(
              children: [
                for (int i = 0; i < rows.length; i++)
                  i == 0
                      ? TableEvaluationHeaderRowV2(
                          cells: rows[i].cells,
                          showBottomDivider: rows.length > 1,
                          isEqualColumns: isEqualColumns,
                          hasDividerPadding: hasDividerPadding,
                          headerBold: headerBold,
                        )
                      : TableEvaluationDataRowV2(
                          cells: rows[i].cells,
                          showBottomDivider: i < rows.length - 1,
                          onTap: onRowTap != null ? () => onRowTap!(i) : null,
                          isEqualColumns: isEqualColumns,
                          hasDividerPadding: hasDividerPadding,
                        ),
              ],
            ),
          ),
        ),
        const SizedBox(height: DimensV2.d12),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Private helpers
// ---------------------------------------------------------------------------

/// Container của một row: content indent trái 16px + CommonDividerV2 indent trái 16px.
/// Giống paddingDividerOverride: EdgeInsets.only(left: Dimens.d16) của CardListItem cũ.
class _RowContainer extends StatelessWidget {
  const _RowContainer({
    required this.showBottomDivider,
    required this.child,
    this.hasDividerPadding = true,
    this.isEqualColumns = false,
  });

  final bool showBottomDivider;
  final Widget child;
  final bool hasDividerPadding;
  final bool isEqualColumns;

  /// Builds a [Column] with the row [child] and an optional [CommonDividerV2].
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: DimensV2.d16,
            right: isEqualColumns ? DimensV2.d16 : 0.0,
          ),
          child: child,
        ),
        if (showBottomDivider)
          Padding(
            padding:
                hasDividerPadding ? const EdgeInsets.only(left: DimensV2.d16) : EdgeInsets.zero,
            child: const CommonDividerV2(),
          ),
      ],
    );
  }
}

/// Nội dung của một row: cột đầu cố định 117px, các cột còn lại Expanded.
class _RowContent extends StatelessWidget {
  const _RowContent({
    required this.cells,
    required this.textStyle,
    this.isEqualColumns = false,
  });

  final List<String> cells;
  final TextStyle textStyle;
  final bool isEqualColumns;

  /// Builds a [Row] with a fixed-width first column (117px) and [Expanded] columns for the rest.
  @override
  Widget build(BuildContext context) {
    final firstCellWidget = Padding(
      padding: EdgeInsets.only(
        right: isEqualColumns ? 0.0 : DimensV2.d8,
        top: DimensV2.d16,
        bottom: DimensV2.d16,
      ),
      child: Text(
        cells.firstOrNull ?? '',
        style: textStyle,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Cột đầu tiên
        isEqualColumns
            ? Expanded(child: firstCellWidget)
            : SizedBox(
                width: _kFirstColumnWidth,
                child: firstCellWidget,
              ),
        // Các cột còn lại: flex expanded, căn trái
        ...(cells.length > 1 ? cells.sublist(1) : const <String>[]).map(
          (cell) => Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: isEqualColumns ? 0.0 : DimensV2.d8,
                top: DimensV2.d16,
                bottom: DimensV2.d16,
              ),
              child: Text(
                cell,
                style: textStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
