import 'package:flutter/material.dart';

class CustomAuthTextField extends StatelessWidget {
  const CustomAuthTextField({
    super.key,
    required this.title,
    this.textEditingController,
    this.validator,
  });
  final String title;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: validator,
      decoration: InputDecoration(
        label: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        enabledBorder: inputCustomBorder(),
        focusedBorder: inputCustomBorder(),
      ),
    );
  }

  OutlineInputBorder inputCustomBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Colors.grey.shade400,
        width: 2,
      ),
    );
  }
}
