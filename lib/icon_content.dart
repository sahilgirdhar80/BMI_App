import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent({super.key, required this.label, required this.icon});
  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        Text(
          "$label",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
        )
      ],
    );
  }
}
