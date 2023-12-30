import 'dart:developer';

import 'package:dookanti/core/style/app_colors.dart';
import 'package:dookanti/core/widgets/k_spaser.dart';
import 'package:dookanti/feuters/aboutus/presintaion/view/widgets/custom_contact_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ContactUsViewBody extends StatelessWidget {
  const ContactUsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
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
                'Contact Us',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomContactTitle(
                    title: 'User Name',
                  ),
                  const SizedBox(height: 7),
                  const CustomContactTextField(),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  const CustomContactTitle(
                    title: 'Topic',
                  ),
                  const SizedBox(height: 7),
                  const CustomContactTextField(),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  const CustomContactTitle(
                    title: 'Message',
                  ),
                  const SizedBox(height: 7),
                  const CustomContactTextField(),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        log('message');
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('SEND'),
                          SizedBox(width: 8),
                          CircleAvatar(
                            backgroundColor: AppColors.primaryColor,
                            child: Icon(
                              IconlyLight.message,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomContactTextField extends StatelessWidget {
  const CustomContactTextField({
    super.key,
    this.controller,
  });
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
