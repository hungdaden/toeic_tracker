/// Selects which presentation the unified [AppTextField] renders as.
///
/// All three variants share the same focus / state / decoration pipeline —
/// they only differ in their inner content and trailing affordance.
enum CommonTextFieldVariant {
  /// Single-line editable text input. Hosts a [TextEditingController] and
  /// supports a trailing icon (default: calendar) plus a clear button.
  input,

  /// Non-editable picker. Tapping the field calls [AppTextField.onTap]
  /// instead of requesting focus and shows a trailing chevron.
  dropdown,

  /// Multi-line editable text area. Hosts a [TextEditingController] and
  /// grows vertically between [AppTextField.minLines] and
  /// [AppTextField.maxLines].
  textArea,
}
