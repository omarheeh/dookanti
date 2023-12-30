import 'package:card_swiper/card_swiper.dart';
import 'package:dookanti/core/widgets/k_spaser.dart';
import 'package:flutter/material.dart';

class CustomSwiper extends StatelessWidget {
  const CustomSwiper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 160,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/image/swipar${index + 1}.png",
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            itemCount: 3,
            loop: true,
            autoplay: true,
            viewportFraction: 0.9,
          ),
        ),
        const VSpaser(2),
      ],
    );
  }
}
