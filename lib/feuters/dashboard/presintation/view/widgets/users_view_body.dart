import 'package:dookanti/core/style/app_colors.dart';
import 'package:dookanti/feuters/dashboard/presintation/view/widgets/user_view_tabel.dart';
import 'package:dookanti/feuters/dashboard/presintation/view_model/get_users/get_users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersViewBody extends StatelessWidget {
  const UsersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            BlocBuilder<GetUsersCubit, GetUsersState>(
              builder: (context, state) {
                if (state is GetUsersSucsess) {
                  return UserViewTabile(
                    users: state.users,
                  );
                } else if (state is GetUsersFailure) {
                  return Center(
                    child: Text(state.errMessage),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
