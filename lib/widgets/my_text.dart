import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final FontStyle? fontStyle;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? softWrap;
  final List<Shadow>? shadows;

  const MyText(
    this.text, {
    Key? key,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.fontStyle,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.shadows,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      style: GoogleFonts.montserrat(
        fontSize: fontSize ?? 12,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color ?? Colors.black,
        fontStyle: fontStyle ?? FontStyle.normal,
        shadows: shadows,
      ),
      softWrap: softWrap ?? true,
      overflow: overflow,
      maxLines: maxLines ?? 1,
    );
  }
}
