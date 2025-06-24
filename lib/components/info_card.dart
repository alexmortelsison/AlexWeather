import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String text;
  final IconData? icon;
  final String description;
  const InfoCard({
    super.key,
    required this.text,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icon),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(description),
        ),
      ],
    );
  }
}
