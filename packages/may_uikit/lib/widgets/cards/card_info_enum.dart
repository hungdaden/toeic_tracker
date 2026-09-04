/// Represents the types of actions supported in card detail rows.
enum CardInfoActionType {
  /// Phone call action.
  phone('PHONE'),

  /// Chat message action.
  chat('CHAT'),

  /// Copy text to clipboard action.
  copy('COPY'),

  /// Unknown action fallback.
  unknown('');

  /// Creates a [CardInfoActionType] with the given [code].
  const CardInfoActionType(this.code);

  /// The raw string code representing the action from the server.
  final String code;

  /// Parses a raw [code] string into a matching [CardInfoActionType].
  static CardInfoActionType fromCode(String? code) {
    return CardInfoActionType.values.firstWhere(
      (e) => e.code == code?.toUpperCase(),
      orElse: () => CardInfoActionType.unknown,
    );
  }
}
