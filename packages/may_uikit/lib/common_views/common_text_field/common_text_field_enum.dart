/// Field state machine for [AppTextField].
///
/// Maps 1:1 to the K12 mobile design system spec ("Fields" page). The set is
/// closed; new visual treatments must be added as a new enum value rather than
/// via boolean flags so the public API stays exhaustive.
enum MayFieldState {
  /// The field shows its placeholder; no user input yet.
  unfilled,

  /// The field has a committed value.
  filled,

  /// Error styling applied while the field is still empty.
  errorUnfilled,

  /// Error styling applied after the user typed something invalid.
  errorFilled,

  /// Read-only — the value is displayed but the field cannot receive input.
  readOnly,

  /// Disabled — the field is greyed out and not interactive.
  disabled,
}

/// Visual shape preset for the field container.
enum MayFieldShape {
  /// Pill-shaped border (used for single-line inputs and dropdowns).
  pill,

  /// 24-px rounded rectangle (used for text areas).
  rounded,
}

/// Trailing / leading icon slot kind.
enum MayFieldTrailingIcon {
  /// No trailing icon.
  none,

  /// Calendar icon — typical for date inputs.
  calendar,

  /// Dropdown chevron — typical for select inputs.
  chevron,

  /// A custom widget provided by the consumer via [AppTextField.swapIcon].
  custom,
}
