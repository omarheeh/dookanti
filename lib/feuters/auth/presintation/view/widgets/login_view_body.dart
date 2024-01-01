import 'package:dookanti/core/widgets/app_custom_logo.dart';
import 'package:dookanti/core/widgets/custom_button.dart';
import 'package:dookanti/core/widgets/k_spaser.dart';
import 'package:dookanti/feuters/auth/presintation/view/singup_view.dart';
import 'package:dookanti/feuters/auth/presintation/view/widgets/login_form.dart';
import 'package:dookanti/feuters/auth/presintation/view_model/auth_cubit/auth_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubitCubit, AuthCubitState>(
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AuthCubitLoading,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const VSpaser(3),
                    const AppCustomLogo(),
                    const SizedBox(height: 50),
                    const LoginForm(),
                    const SizedBox(height: 20),
                    const Text('- OR -'),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: CustomButton(
                        title: 'Continue As Guest',
                        outLine: true,
                        filldText: true,
                        color: Colors.grey,
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('you don\'t have account!'),
                        const SizedBox(width: 15),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: const SingupView(),
                              ),
                            );
                          },
                          child: const Text(
                            'Regester',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
