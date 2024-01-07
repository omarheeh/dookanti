import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.iconData,
    this.hintText,
    this.onSubmitted,
    this.controller,
    this.validator,
  });
  final IconData? iconData;
  final String? hintText;
  final void Function(String)? onSubmitted;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        validator: validator,
        controller: controller,
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
