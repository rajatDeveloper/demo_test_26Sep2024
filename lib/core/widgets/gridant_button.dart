import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Gradient gradient;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final TextStyle textStyle;

  const GradientButton({
    Key? key,
    required this.title,
    required this.onTap,
    required this.gradient,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    this.textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: textStyle,
        ),
      ),
    );
  }
}
