import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

/// Shared text widget with optional tap and linkify support.
class CommonTextV2 extends StatelessWidget {
  // ignore: prefer_named_parameters
  const CommonTextV2(
    this.text, {
    required this.style,
    super.key,
    this.onTap,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.enableLinkify = false,
    this.onOpenLink,
  });

  final String? text;
  final VoidCallback? onTap;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final bool enableLinkify;
  final void Function(String)? onOpenLink;

  /// Factory constructor for linkified text (text with clickable URLs)
  // ignore: prefer_named_parameters
  factory CommonTextV2.linkify(
    String? text, {
    required TextStyle? style,
    required void Function(String) onOpenLink,
    Key? key,
    int? maxLines,
    TextOverflow? overflow,
    TextAlign? textAlign,
  }) {
    return CommonTextV2(
      text,
      key: key,
      style: style,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      enableLinkify: true,
      onOpenLink: onOpenLink,
    );
  }

  /// Factory constructor for tappable text
  // ignore: prefer_named_parameters
  factory CommonTextV2.canTap(
    String? text, {
    required TextStyle? style,
    required VoidCallback onTap,
    Key? key,
    int? maxLines,
    TextOverflow? overflow,
    TextAlign? textAlign,
  }) {
    return CommonTextV2(
      text,
      key: key,
      style: style,
      onTap: onTap,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }

  @override
  Widget build(BuildContext context) {
    final textWidget = enableLinkify
        ? Linkify(
            text: text ?? (kDebugMode ? '' : ''),
            style: style,
            maxLines: maxLines,
            overflow: overflow ?? TextOverflow.clip,
            textAlign: textAlign ?? TextAlign.start,
            onOpen: (link) => onOpenLink,
            options: const LinkifyOptions(looseUrl: true),
          )
        // ignore: prefer_common_widgets
        : Text(
            text ?? '',
            style: style,
            maxLines: maxLines,
            overflow: overflow,
            textAlign: textAlign,
          );

    return onTap != null
        ? GestureDetector(
            onTap: onTap,
            behavior: HitTestBehavior.translucent,
            child: textWidget,
          )
        : textWidget;
  }
}

/// Notification dispatched when a card's text value is tapped,
/// allowing the parent card to intercept the gesture and navigate.
class CardTapNotification extends Notification {
  /// Creates a new [CardTapNotification].
  const CardTapNotification();
}

/// A text widget that wraps its content in a SelectionArea to allow copy/selection.
class CommonSelectableTextV2 extends StatelessWidget {
  const CommonSelectableTextV2(
    this.text, {
    required this.style,
    super.key,
    this.maxLines,
    this.overflow,
    this.textAlign,
  });

  final String text;
  final TextStyle style;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  @override
  ///
  Widget build(BuildContext context) {
    return SelectionArea(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          const CardTapNotification().dispatch(context);
        },
        child: Text(
          text,
          style: style,
          maxLines: maxLines,
          overflow: overflow,
          textAlign: textAlign,
        ),
      ),
    );
  }
}
