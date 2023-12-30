import 'package:dookanti/core/style/app_colors.dart';
import 'package:dookanti/core/widgets/k_spaser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Notifications',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ListTile(
                    leading: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.done_all,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    title: Text("Sucsess Your Order"),
                    subtitle: Text("order has 20m "),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
