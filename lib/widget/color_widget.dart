import 'package:flutter/material.dart';

///A widget created to show generated colors and their RGB code.
class ColorWidget extends StatelessWidget {
  ///The color proper is for displaying the appropriate color as they change
  final Color color;

  ///The message property displays the RGB code of the generated color
  final String? message;

  ///This is the Constructor of the widget
  const ColorWidget({
    required this.color,
    this.message,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 50.0,
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.white24, width: 3),
      ),
      child: Center(
        child: Text(
          message ?? '',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),
        ),
      ),
    );
  }
}
