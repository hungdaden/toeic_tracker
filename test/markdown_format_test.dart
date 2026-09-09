import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

List<InlineSpan> parseMarkdownSpans(
  String text, {
  required TextStyle baseStyle,
  required TextStyle boldStyle,
}) {
  final spans = <InlineSpan>[];
  final regex = RegExp(r'\*\*(.*?)\*\*', dotAll: true);
  int lastIndex = 0;

  for (final match in regex.allMatches(text)) {
    if (match.start > lastIndex) {
      spans.add(TextSpan(
        text: text.substring(lastIndex, match.start),
        style: baseStyle,
      ));
    }
    final boldText = match.group(1);
    if (boldText != null && boldText.isNotEmpty) {
      spans.add(TextSpan(
        text: boldText,
        style: boldStyle,
      ));
    }
    lastIndex = match.end;
  }

  if (lastIndex < text.length) {
    spans.add(TextSpan(
      text: text.substring(lastIndex),
      style: baseStyle,
    ));
  }

  return spans;
}

void main() {
  test('parseMarkdownSpans extracts bold spans and removes asterisks', () {
    const normal = TextStyle(fontWeight: FontWeight.normal);
    const bold = TextStyle(fontWeight: FontWeight.bold);

    const input = 'Chào bạn! Dưới đây là mẹo thi **Part 5 TOEIC** cực kỳ hiệu quả: **Từ loại**.';
    final spans = parseMarkdownSpans(input, baseStyle: normal, boldStyle: bold);

    expect(spans.length, equals(5));
    expect((spans[0] as TextSpan).text, equals('Chào bạn! Dưới đây là mẹo thi '));
    expect((spans[0] as TextSpan).style?.fontWeight, equals(FontWeight.normal));

    expect((spans[1] as TextSpan).text, equals('Part 5 TOEIC'));
    expect((spans[1] as TextSpan).style?.fontWeight, equals(FontWeight.bold));

    expect((spans[2] as TextSpan).text, equals(' cực kỳ hiệu quả: '));
    expect((spans[2] as TextSpan).style?.fontWeight, equals(FontWeight.normal));

    expect((spans[3] as TextSpan).text, equals('Từ loại'));
    expect((spans[3] as TextSpan).style?.fontWeight, equals(FontWeight.bold));

    expect((spans[4] as TextSpan).text, equals('.'));
    expect((spans[4] as TextSpan).style?.fontWeight, equals(FontWeight.normal));
  });

  test('parseMarkdownSpans handles plain text without asterisks', () {
    const normal = TextStyle(fontWeight: FontWeight.normal);
    const bold = TextStyle(fontWeight: FontWeight.bold);

    const input = 'Không có dấu sao nào ở đây.';
    final spans = parseMarkdownSpans(input, baseStyle: normal, boldStyle: bold);

    expect(spans.length, equals(1));
    expect((spans[0] as TextSpan).text, equals(input));
    expect((spans[0] as TextSpan).style?.fontWeight, equals(FontWeight.normal));
  });
}
