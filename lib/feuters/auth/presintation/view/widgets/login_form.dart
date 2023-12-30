import 'package:dookanti/core/style/app_colors.dart';
import 'package:dookanti/core/widgets/custom_button.dart';
import 'package:dookanti/feuters/auth/presintation/view/widgets/custom_auth_text_field.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController emailControler;
  late TextEditingController passwordControler;
  @override
  void initState() {
    super.initState();
    emailControler = TextEditingController();
    passwordControler = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailControler.dispose();
    passwordControler.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomAuthTextField(
            textEditingController: emailControler,
            title: 'Email',
          ),
          const SizedBox(height: 20),
          CustomAuthTextField(
            textEditingController: passwordControler,
            title: 'Password',
          ),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: AppColors.primaryColor.withOpacity(0.8),
                ),
              ),
            ),
          ),
          CustomButton(
            title: 'Login',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
