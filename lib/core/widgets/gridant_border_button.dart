import 'package:flutter/material.dart';

class GradientBorderButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Gradient gradient; // For the border gradient
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final TextStyle textStyle;
  final IconData? prefixIcon;
  final Color? iconColor;
  final double borderWidth;
  final List<BoxShadow> shadow;
  final Color backgroundColor; // New: Background color for the button

  const GradientBorderButton({
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
    this.prefixIcon,
    this.iconColor,
    this.borderWidth = 2.0,
    this.shadow = const [], // Empty shadow list by default
    this.backgroundColor = Colors.transparent, // Default background color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: shadow, // Apply the customizable shadow here
        ),
        child: Stack(
          children: [
            // Gradient border
            Container(
              decoration: BoxDecoration(
                gradient: gradient,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              padding: EdgeInsets.all(borderWidth), // Border width as padding
              child: Container(
                padding: padding,
                decoration: BoxDecoration(
                  color: backgroundColor, // Button background color
                  borderRadius:
                      BorderRadius.circular(borderRadius - borderWidth),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (prefixIcon != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          prefixIcon,
                          color: iconColor ?? textStyle.color, // Icon color
                        ),
                      ),
                    Text(
                      title,
                      style: textStyle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
