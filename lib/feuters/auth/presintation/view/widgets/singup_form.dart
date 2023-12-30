import 'package:dookanti/core/widgets/custom_button.dart';
import 'package:dookanti/feuters/auth/presintation/view/widgets/custom_auth_text_field.dart';
import 'package:flutter/material.dart';

class SingupForm extends StatefulWidget {
  const SingupForm({
    super.key,
  });

  @override
  State<SingupForm> createState() => _SingupFormState();
}

class _SingupFormState extends State<SingupForm> {
  late TextEditingController userNameControler;
  late TextEditingController emailControler;
  late TextEditingController passwordControler;
  late TextEditingController confirmPasswordControler;
  @override
  void initState() {
    super.initState();
    userNameControler = TextEditingController();
    emailControler = TextEditingController();
    passwordControler = TextEditingController();
    confirmPasswordControler = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    userNameControler.dispose();
    emailControler.dispose();
    passwordControler.dispose();
    confirmPasswordControler.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomAuthTextField(
            textEditingController: emailControler,
            title: 'User Name',
          ),
          const SizedBox(height: 20),
          CustomAuthTextField(
            textEditingController: emailControler,
            title: 'Email',
          ),
          const SizedBox(height: 20),
          CustomAuthTextField(
            textEditingController: passwordControler,
            title: 'Password',
          ),
          const SizedBox(height: 20),
          CustomAuthTextField(
            textEditingController: confirmPasswordControler,
            title: 'Confirm Password',
          ),
          const SizedBox(height: 30),
          CustomButton(
            title: 'Regester',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
