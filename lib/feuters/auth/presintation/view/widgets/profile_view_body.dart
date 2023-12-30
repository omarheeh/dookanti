import 'package:dookanti/core/style/app_colors.dart';
import 'package:dookanti/core/widgets/k_spaser.dart';
import 'package:dookanti/core/widgets/title_widget.dart';
import 'package:dookanti/feuters/aboutus/presintaion/view/widgets/contact_us_view_body.dart';
import 'package:dookanti/feuters/aboutus/presintaion/view/widgets/custom_contact_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomContactTitle(
                      title: 'User Name',
                    ),
                    SizedBox(height: 7),
                    TitleWidget(
                      title: 'OmarHeeh',
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    SizedBox(height: 10),
                    CustomContactTitle(
                      title: 'Email',
                    ),
                    SizedBox(height: 7),
                    TitleWidget(
                      title: 'codeomar3@gmail.com',
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    SizedBox(height: 10),
                    CustomContactTitle(
                      title: 'City',
                    ),
                    SizedBox(height: 7),
                    TitleWidget(
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
