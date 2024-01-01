import 'package:dookanti/core/widgets/app_custom_logo.dart';
import 'package:dookanti/core/widgets/k_spaser.dart';
import 'package:dookanti/feuters/auth/presintation/view/widgets/singup_form.dart';
import 'package:flutter/material.dart';

class SingupViweBody extends StatelessWidget {
  const SingupViweBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const VSpaser(3),
              const AppCustomLogo(),
              const SizedBox(height: 50),
              const SingupForm(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('you don\'t have account!'),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
