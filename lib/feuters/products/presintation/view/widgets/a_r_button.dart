import 'package:flutter/material.dart';

class ARButton extends StatelessWidget {
  const ARButton({
    super.key,
    required this.color,
    required this.icon,
  });
  final Color color;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 5,
            color: Colors.grey.shade400,
          ),
        ],
      ),
      child: Center(
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
