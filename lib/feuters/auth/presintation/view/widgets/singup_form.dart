import 'package:dookanti/PageNavigator.dart';
import 'package:dookanti/core/utils/validator.dart';
import 'package:dookanti/core/widgets/custom_button.dart';
import 'package:dookanti/feuters/auth/presintation/view/widgets/custom_auth_text_field.dart';
import 'package:dookanti/feuters/auth/presintation/view_model/auth_cubit/auth_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

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
            textEditingController: userNameControler,
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
          BlocListener<AuthCubitCubit, AuthCubitState>(
            listener: (context, state) {
              if (state is AuthCubitSucsess) {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade, child: PageNavigator()));
              } else if (state is AuthCubitFailure) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errMessage)));
              }
            },
            child: CustomButton(
              title: 'Regester',
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  await BlocProvider.of<AuthCubitCubit>(context).regester(
                    email: emailControler.text,
                    password: passwordControler.text,
                    username: userNameControler.text,
                  );
                } else {
                  autovalidateMode = AutovalidateMode.always;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
