import 'package:flutter/material.dart';

class MyCustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final dynamic fontWeight;
  final dynamic textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final FontStyle? fontStyle;

  const MyCustomText(
    this.text, {
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.fontStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Text(
        text,
        textAlign: textAlign ?? TextAlign.start,
        overflow: overflow,
        maxLines: maxLines,
        style: TextStyle(
          color: color ?? Theme.of(context).colorScheme.background,
          fontSize: fontSize ?? 16,
          height: 1,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontStyle: fontStyle ?? FontStyle.normal,
        ),
      );
}
