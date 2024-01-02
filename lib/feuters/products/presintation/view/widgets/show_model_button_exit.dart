import 'package:dookanti/core/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class showModelButtonExit extends StatelessWidget {
  const showModelButtonExit({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 1),
                blurRadius: 5,
                color: AppColors.primaryColor.withOpacity(0.2),
              ),
            ],
          ),
          child: Center(
            child: Icon(
              IconlyLight.arrowDown2,
              color: AppColors.primaryColor,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
