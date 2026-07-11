import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLabelTextView extends StatelessWidget {
  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final TextAlign? textAlign;
  final bool? softWrap;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final TextDirection? textDirection;
  final double? decorationThickness;
  final Color? decorationColor;
  final double? letterSpacing;

  const AppLabelTextView(this.title, {
    super.key,
    required this.fontSize,
    required this.fontWeight,
    required this.textColor,
    this.textAlign = TextAlign.start,
    this.softWrap,
    this.maxLines,
    this.overflow,
    this.decoration = TextDecoration.none,
    this.textDirection,
    this.decorationThickness,
    this.decorationColor,
    this.letterSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      softWrap: softWrap,
      maxLines: maxLines,
      overflow: overflow,
      textDirection: textDirection,
      style: GoogleFonts.raleway(
      // style: GoogleFonts.poppins(
      // style: GoogleFonts.montserrat(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: textColor,
        decoration: decoration,
        decorationThickness: decorationThickness,
        decorationColor: decorationColor,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
