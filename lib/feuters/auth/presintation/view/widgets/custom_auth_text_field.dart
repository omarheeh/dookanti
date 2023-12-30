import 'package:flutter/material.dart';

class CustomAuthTextField extends StatelessWidget {
  const CustomAuthTextField({
    super.key,
    required this.title,
    this.textEditingController,
  });
  final String title;
  final TextEditingController? textEditingController;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
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
