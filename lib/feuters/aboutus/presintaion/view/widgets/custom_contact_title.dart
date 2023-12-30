import 'package:flutter/material.dart';

class CustomContactTitle extends StatelessWidget {
  const CustomContactTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.grey.shade700,
      ),
    );
  }
}
