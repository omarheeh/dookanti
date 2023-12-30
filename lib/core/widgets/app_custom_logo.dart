import 'package:flutter/material.dart';

class AppCustomLogo extends StatelessWidget {
  const AppCustomLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/image/logo.png',
          width: 50,
        ),
        const SizedBox(height: 15),
        const Text(
          'Dookanti',
          style: TextStyle(
            fontSize: 32,
          ),
        ),
      ],
    );
  }
}
