import 'card_data.dart';

/// Option model used by [CardListV2] to render a selectable item.
class CardListOptionV2<T> {
  const CardListOptionV2({
    this.value,
    this.name,
    this.subtitle,
    this.subtitleIconNetworkUrl,
    this.isShowImage,
    this.imageUrl,
    this.trailingIcon,
    this.enabled,
    this.id,
    this.code,
    this.customTitle,
  });

  final T? value;
  final String? name;
  final String? subtitle;
  final String? subtitleIconNetworkUrl;
  final bool? isShowImage;
  final String? imageUrl;
  final String? trailingIcon;
  final bool? enabled;
  final int? id;
  final String? code;
  final List<CardDataV2>? customTitle;
}
