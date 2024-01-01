import 'package:dookanti/core/widgets/k_spaser.dart';
import 'package:dookanti/core/widgets/title_widget.dart';
import 'package:dookanti/feuters/aboutus/presintaion/view/widgets/custom_contact_title.dart';
import 'package:dookanti/feuters/auth/data/models/user_model.dart';
import 'package:dookanti/feuters/auth/presintation/view_model/auth_cubit/auth_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel userModel = BlocProvider.of<AuthCubitCubit>(context).userModel!;
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VSpaser(3),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    IconlyLight.arrowLeft2,
                    size: 30,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomContactTitle(
                      title: 'User Name',
                    ),
                    const SizedBox(height: 7),
                    TitleWidget(
                      title: userModel.username,
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    const SizedBox(height: 10),
                    const CustomContactTitle(
                      title: 'Email',
                    ),
                    const SizedBox(height: 7),
                    TitleWidget(
                      title: userModel.email,
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    const SizedBox(height: 10),
                    const CustomContactTitle(
                      title: 'City',
                    ),
                    const SizedBox(height: 7),
                    const TitleWidget(
                      title: 'Hebron',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
