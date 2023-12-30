import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CustomSearchButton extends StatelessWidget {
  const CustomSearchButton({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: GestureDetector(
            child: const Row(
              children: [
                Icon(IconlyLight.search),
                SizedBox(width: 12),
                Text(
                  'Search your Products',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
