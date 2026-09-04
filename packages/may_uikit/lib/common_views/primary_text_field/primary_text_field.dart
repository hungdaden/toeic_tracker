import 'package:flutter/material.dart';

import '../../may_uikit.dart';
import '../../resources/styles/app_color.dart';
import '../common_text/common_text.dart';

/// Shared text field with optional password visibility handling.
class PrimaryTextFieldV2 extends StatefulWidget {
  const PrimaryTextFieldV2({
    required this.title,
    required this.hintText,
    this.onEyeIconPressed,
    this.suffixIcon,
    this.controller,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    super.key,
  });

  final String title;
  final String hintText;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final void Function(bool)? onEyeIconPressed;

  @override

  /// Creates the state used by [PrimaryTextFieldV2].
  State<PrimaryTextFieldV2> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextFieldV2> {
  late FocusNode _focusNode;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _obscureText = widget.keyboardType == TextInputType.visiblePassword;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  bool get _isPassword => widget.keyboardType == TextInputType.visiblePassword;

  @override
  Widget build(BuildContext context) {
    // ignore: missing_expanded_or_flexible
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: CommonTextV2(
            widget.title,
            style: AppTextStylesV2.bodyRegular.copyWith(
              color: AppColorsV2.genericBlack,
            ),
          ),
        ),
        TextField(
          focusNode: _focusNode,
          onChanged: widget.onChanged,
          controller: widget.controller,
          style: AppTextStylesV2.bodyRegular.copyWith(
            color: AppColorsV2.genericBlack,
          ),
          decoration: InputDecoration(
            hintStyle: AppTextStylesV2.bodyRegular.copyWith(
              color: AppColorsV2.neutral500, // Or fallback color
            ),
            hintText: widget.hintText,
            suffixIcon: _isPassword
                ? GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                      widget.onEyeIconPressed?.call(_obscureText);
                    },
                    child: _obscureText
                        ? const Icon(Icons.visibility_off, color: AppColorsV2.genericBlack)
                        : const Icon(Icons.visibility, color: AppColorsV2.genericBlack),
                  )
                : widget.suffixIcon,
          ),
          keyboardType: widget.keyboardType,
          obscureText: _isPassword ? _obscureText : false,
        ),
      ],
    );
  }
}
