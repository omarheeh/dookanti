import 'package:dookanti/core/functions/size_config.dart';
import 'package:dookanti/core/style/app_colors.dart';
import 'package:dookanti/feuters/home/presentaiton/view/widgets/draggable_scroll_body.dart';
import 'package:dookanti/feuters/home/presentaiton/view/widgets/rps_custom_painrer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CustomDraggableScroll extends StatefulWidget {
  const CustomDraggableScroll({
    super.key,
  });

  @override
  State<CustomDraggableScroll> createState() => _CustomDraggableScrollState();
}

class _CustomDraggableScrollState extends State<CustomDraggableScroll> {
  Color color = AppColors.primaryColor;
  late DraggableScrollableController controller;
  @override
  void initState() {
    super.initState();
    initialDraggableController();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      snap: true,
      controller: controller,
      initialChildSize: 0.11,
      minChildSize: 0.11,
      builder: (BuildContext context, ScrollController scrollController) {
        return SingleChildScrollView(
            controller: scrollController,
            child: SizedBox(
              height: SizeConfig.screenHeight,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.animateTo(1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                    child: SizedBox(
                      height: SizeConfig.screenHeight * 0.11,
                      child: CustomPaint(
                        size: Size(
                          SizeConfig.screenWidth,
                          (SizeConfig.screenWidth * 0.16666666666666666)
                              .toDouble(),
                        ),
                        painter: RPSCustomPainter(color: color),
                        child: Column(
                          children: [
                            const SizedBox(
                              width: double.infinity,
                              height: 5,
                            ),
                            const Icon(
                              IconlyLight.arrowUp2,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 7),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  '10.99\$  Bay',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 7),
                                CircleAvatar(
                                  radius: 10,
                                  backgroundColor:
                                      Colors.white.withOpacity(0.3),
                                  child: const Text(
                                    '3',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  DraggableScrollBody(controller: controller),
                ],
              ),
            ));
      },
    );
  }

  void initialDraggableController() {
    controller = DraggableScrollableController();
    controller.addListener(() {
      double opacity = 1 - controller.size;

      if (controller.size < 0.3) {
        opacity = 1;
      }

      if (controller.size == 1) {
        opacity = 1;
        color = Colors.white;
        setState(() {});
      } else {
        color = AppColors.primaryColor.withOpacity(opacity);
        setState(() {});
      }
    });
  }
}
