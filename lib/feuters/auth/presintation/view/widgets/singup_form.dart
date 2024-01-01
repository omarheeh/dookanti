import 'package:dookanti/core/utils/validator.dart';
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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
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
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomAuthTextField(
            textEditingController: emailControler,
            title: 'User Name',
            validator: (value) {
              return MyValidators.displayNamevalidator(value);
            },
          ),
          const SizedBox(height: 20),
          CustomAuthTextField(
            textEditingController: emailControler,
            title: 'Email',
            validator: (value) {
              return MyValidators.emailValidator(value);
            },
          ),
          const SizedBox(height: 20),
          CustomAuthTextField(
            textEditingController: passwordControler,
            title: 'Password',
            validator: (value) {
              return MyValidators.passwordValidator(value);
            },
          ),
          const SizedBox(height: 20),
          CustomAuthTextField(
            textEditingController: confirmPasswordControler,
            title: 'Confirm Password',
            validator: (value) {
              return MyValidators.repeatPasswordValidator(
                  value: value, password: passwordControler.text);
            },
          ),
          const SizedBox(height: 30),
          CustomButton(
            title: 'Regester',
            onTap: () {
              if (formKey.currentState!.validate()) {
              } else {
                autovalidateMode = AutovalidateMode.always;
              }
            },
          ),
        ],
      ),
    );
  }
}
