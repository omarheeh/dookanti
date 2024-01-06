import 'package:dookanti/feuters/dashboard/presintation/view/widgets/new_user_view_form.dart';
import 'package:flutter/material.dart';

class NewUserViewBody extends StatelessWidget {
  const NewUserViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            NewUserViewForm(),
          ],
        ),
      ),
    );
  }
}
