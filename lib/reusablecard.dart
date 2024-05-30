import 'package:flutter/material.dart';

class ResusableCard extends StatelessWidget {
  ResusableCard(
      {required this.colour, required this.Cardchild, required this.onpress});
  final Color colour;
  final Widget Cardchild;
  final VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: colour),
        margin: EdgeInsets.all(20),
        child: Cardchild,
      ),
    );
  }
}
