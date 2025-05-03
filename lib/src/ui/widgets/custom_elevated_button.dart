import 'package:flutter/material.dart';

final class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final BorderRadiusGeometry borderRadius;
  final TextStyle textStyle;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    this.textStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    this.padding,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        textStyle: textStyle,
        padding: padding,
        backgroundColor: backgroundColor,
        foregroundColor: textStyle.copyWith(color: foregroundColor).color,
      ),
      child: Text(text),
    );
  }
}
