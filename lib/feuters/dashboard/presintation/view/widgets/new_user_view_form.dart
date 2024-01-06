import 'dart:developer';

import 'package:dookanti/core/widgets/custom_button.dart';
import 'package:dookanti/feuters/dashboard/presintation/view/users_view.dart';
import 'package:dookanti/feuters/dashboard/presintation/view_model/add_users/add_users_cubit.dart';
import 'package:dookanti/feuters/home/presentaiton/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class NewUserViewForm extends StatefulWidget {
  const NewUserViewForm({
    super.key,
  });

  @override
  State<NewUserViewForm> createState() => _NewUserViewFormState();
}

class _NewUserViewFormState extends State<NewUserViewForm> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late TextEditingController emailController;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 16),
          CustomTextField(
            iconData: IconlyLight.profile,
            hintText: 'username',
            controller: usernameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'this field is requaired';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomTextField(
            iconData: IconlyLight.message,
            hintText: 'email',
            controller: emailController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'this field is requaired';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomTextField(
            iconData: IconlyLight.password,
            hintText: 'password',
            controller: passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'this field is requaired';
              }
              return null;
            },
          ),
          const SizedBox(height: 30),
          BlocListener<AddUsersCubit, AddUsersState>(
            listener: (context, state) {
              if (state is AddUsersSucsess) {
                Navigator.pop(context);
              } else {
                log('error');
              }
            },
            child: CustomButton(
              title: 'Add',
              onTap: () {
                if (formKey.currentState!.validate()) {
                  BlocProvider.of<AddUsersCubit>(context).adduser(
                    username: usernameController.text,
                    password: passwordController.text,
                    email: emailController.text,
                  );
                } else {
                  autovalidateMode = AutovalidateMode.disabled;
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
