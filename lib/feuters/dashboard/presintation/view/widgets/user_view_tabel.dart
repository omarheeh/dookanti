import 'package:dookanti/core/style/app_colors.dart';
import 'package:dookanti/feuters/auth/data/models/user_model.dart';
import 'package:dookanti/feuters/dashboard/presintation/view/new_user_view.dart';
import 'package:dookanti/feuters/dashboard/presintation/view/widgets/user_tr.dart';
import 'package:dookanti/feuters/dashboard/presintation/view/widgets/usre_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class UserViewTabile extends StatelessWidget {
  const UserViewTabile({
    super.key,
    required this.users,
  });

  final List<UserModel> users;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, NewUserView.id);
              },
              icon: const Icon(
                IconlyLight.addUser,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const UserTr(),
        const Divider(),
        ...List.generate(
            users.length,
            (index) => Column(
                  children: [
                    UserTd(
                      email: users[index].email,
                      stutus: users[index].status,
                      id: users[index].userId,
                    ),
                    const Divider(),
                  ],
                )),
      ],
    );
  }
}
