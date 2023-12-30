import 'package:dookanti/feuters/home/presentaiton/view/widgets/home_view_body.dart';
import 'package:dookanti/feuters/home/presentaiton/view/widgets/notification_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
    required this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: onPressed,
          icon: SvgPicture.asset('assets/svg/list.svg'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: const NotificationView(),
                ),
              );
            },
            icon: const Icon(IconlyLight.notification),
          )
        ],
      ),
      body: const HomeViewBody(),
    );
  }
}
