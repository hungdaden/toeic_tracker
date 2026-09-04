import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';

/// A common checkbox widget that displays a standard checkbox alongside a custom [text] widget.
/// The state is controlled externally via the [value] parameter and [onCheck] callback.
class CommonCheckboxFieldV2 extends StatelessWidget {
  const CommonCheckboxFieldV2({
    super.key,
    required this.text,
    this.value = false,
    this.onCheck,
    this.padding,
    this.isTextClickable = true,
  });

  final bool value;
  final ValueChanged<bool>? onCheck;
  final Widget text;
  final EdgeInsetsGeometry? padding;
  final bool isTextClickable;

  /// Builds the layout for the checkbox field.
  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: DimensV2.d20,
                height: DimensV2.d20,
              ),
              const SizedBox(
                width: AppSpacingV2.xs,
              ),
              Expanded(
                child: text,
              )
            ],
          ),
          Positioned(
            left: -DimensV2.d10,
            top: -DimensV2.d10,
            width: DimensV2.d40,
            height: DimensV2.d40,
            child: Checkbox(
              activeColor: context.mayColors.btnPrimaryDefault,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: value,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(DimensV2.d7)),
              ),
              side: WidgetStateBorderSide.resolveWith(
                (states) => BorderSide(
                  width: 1,
                  color: value
                      ? context.mayColors.btnPrimaryDefault
                      : context.mayColors.bdTextInputDefault,
                ),
              ),
              onChanged: (checked) {
                onCheck?.call(checked ?? false);
              },
            ),
          )
        ],
      ),
    );

    if (!isTextClickable) {
      return content;
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onCheck?.call(!value);
      },
      child: content,
    );
  }
}
