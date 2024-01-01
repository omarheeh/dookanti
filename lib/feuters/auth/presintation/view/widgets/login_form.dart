import 'dart:developer';

import 'package:dookanti/PageNavigator.dart';
import 'package:dookanti/core/style/app_colors.dart';
import 'package:dookanti/core/utils/validator.dart';
import 'package:dookanti/core/widgets/custom_button.dart';
import 'package:dookanti/feuters/auth/presintation/view/widgets/custom_auth_text_field.dart';
import 'package:dookanti/feuters/auth/presintation/view_model/auth_cubit/auth_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
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
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
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
          BlocListener<AuthCubitCubit, AuthCubitState>(
            listener: (context, state) {
              if (state is AuthCubitSucsess) {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade, child: PageNavigator()));
              }
              if (state is AuthCubitFailure) {
                log(state.errMessage);
              }
            },
            child: CustomButton(
              title: 'Login',
              onTap: () {
                if (formKey.currentState!.validate()) {
                  BlocProvider.of<AuthCubitCubit>(context).singin(
                    email: emailControler.text,
                    password: passwordControler.text,
                  );
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
