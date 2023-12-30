import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.iconData,
    this.hintText,
    this.onSubmitted,
  });
  final IconData iconData;
  final String? hintText;
  final void Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
      ),
      child: TextField(
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Icon(
              iconData,
              color: Colors.black,
            ),
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
