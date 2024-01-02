import 'package:dookanti/core/style/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.outLine = false,
    this.onTap,
    required this.title,
    this.color = AppColors.primaryColor,
    this.filldText = false,
    this.isLoading = false,
  });
  final bool outLine;
  final void Function()? onTap;
  final String title;
  final Color color;
  final bool filldText;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Material(
        color: outLine ? Colors.white : AppColors.primaryColor,
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 55,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: color,
                width: 2,
              ),
            ),
            child: Center(
              child: isLoading
                  ? SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: filldText
                            ? color
                            : outLine
                                ? AppColors.primaryColor
                                : Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
