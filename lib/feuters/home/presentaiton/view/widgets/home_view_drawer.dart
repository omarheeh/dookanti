import 'package:dookanti/core/widgets/app_custom_logo.dart';
import 'package:dookanti/core/widgets/k_spaser.dart';
import 'package:dookanti/feuters/aboutus/presintaion/view/compaints_view.dart';
import 'package:dookanti/feuters/aboutus/presintaion/view/contact_us.dart';
import 'package:dookanti/feuters/auth/presintation/view/login_view.dart';
import 'package:dookanti/feuters/auth/presintation/view/profile_view.dart';
import 'package:dookanti/feuters/home/presentaiton/view/widgets/drawer_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';

class HomeViewDrawer extends StatelessWidget {
  const HomeViewDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const VSpaser(3),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 30,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const AppCustomLogo(),
              const SizedBox(height: 15),
              const Divider(),
              const SizedBox(height: 15),
              Column(
                children: [
                  DrawerListItem(
                    title: 'My Profile',
                    iconData: IconlyLight.profile,
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const ProfileView()));
                    },
                  ),
                  DrawerListItem(
                    title: 'My Orders',
                    iconData: IconlyLight.buy,
                    onTap: () {},
                  ),
                  DrawerListItem(
                    title: 'Favorite Items',
                    iconData: IconlyLight.heart,
                    onTap: () {},
                  ),
                  DrawerListItem(
                    title: 'Saved Addresses',
                    iconData: IconlyLight.location,
                    onTap: () {},
                  ),
                  DrawerListItem(
                    title: 'Rate Our App',
                    iconData: IconlyLight.star,
                    onTap: () {},
                  ),
                  DrawerListItem(
                    title: 'Contact Us',
                    iconData: IconlyLight.call,
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const ContactUsView()));
                    },
                  ),
                  DrawerListItem(
                    title: 'Compaints & Suggestion',
                    iconData: IconlyLight.document,
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const CompaintsView()));
                    },
                  ),
                  DrawerListItem(
                    title: 'Login',
                    iconData: IconlyLight.login,
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: const LoginView(),
                        ),
                      );
                    },
                  ),
                  DrawerListItem(
                    title: 'Delete Acount',
                    iconData: IconlyLight.delete,
                    onTap: () {},
                  ),
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
