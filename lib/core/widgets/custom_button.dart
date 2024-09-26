import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;
  final Color borderColor;
  final Color textColor;

  const CustomElevatedButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.backgroundColor = Colors.blue, // Default background color
    this.padding = const EdgeInsets.all(16.0), // Default padding
    this.borderColor = Colors.transparent, // Default border color
    this.textColor = Colors.white, // Default text color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor, // Background color
        padding: padding, // Padding
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor), // Border color
          borderRadius:
              BorderRadius.circular(30.0), // Optional: for rounded corners
        ),
      ),
      child: Text(
        title,
        style: TextStyle(color: textColor), // Use the textColor parameter
      ),
    );
  }
}

// Example usage of the CustomElevatedButton widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Custom Elevated Button Example')),
        body: Center(
          child: CustomElevatedButton(
            title: 'Click Me',
            onTap: () {
              // Your onTap function logic here
              print('Button tapped!');
            },
            backgroundColor: Colors.green,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            borderColor: Colors.black,
            textColor: Colors.white, // Specify the text color
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
