import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class UserTr extends StatelessWidget {
  const UserTr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(
          width: 50,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              IconlyBold.user3,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            'Email',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            'Stutus',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
