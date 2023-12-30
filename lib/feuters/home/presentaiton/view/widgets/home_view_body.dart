import 'package:dookanti/core/widgets/k_spaser.dart';
import 'package:dookanti/core/widgets/title_widget.dart';
import 'package:dookanti/feuters/home/presentaiton/view/search_view.dart';
import 'package:dookanti/feuters/home/presentaiton/view/widgets/custom_search_button.dart';
import 'package:dookanti/feuters/home/presentaiton/view/widgets/custom_swiper.dart';
import 'package:dookanti/feuters/home/presentaiton/view/widgets/home_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VSpaser(1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomSearchButton(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: const SearchView(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            const CustomSwiper(),
            const VSpaser(1),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TitleWidget(
                title: 'Categores',
              ),
            ),
            const VSpaser(2),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: HomeGridView(),
            ),
            const VSpaser(10),
          ],
        ),
      ),
    );
  }
}
