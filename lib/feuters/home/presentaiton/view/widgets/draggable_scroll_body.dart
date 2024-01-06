import 'package:dookanti/feuters/auth/data/models/user_model.dart';
import 'package:dookanti/feuters/auth/presintation/view/login_view.dart';
import 'package:dookanti/feuters/auth/presintation/view_model/auth_cubit/auth_cubit_cubit.dart';
import 'package:dookanti/feuters/home/presentaiton/view/widgets/basket_list_view.dart';
import 'package:dookanti/feuters/home/presentaiton/view/widgets/draggable_body_sub_title.dart';
import 'package:dookanti/feuters/home/presentaiton/view/widgets/draggable_scroll_title.dart';
import 'package:dookanti/feuters/products/presintation/view_model/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../../core/widgets/custom_button.dart';

class DraggableScrollBody extends StatelessWidget {
  const DraggableScrollBody({
    super.key,
    required this.controller,
  });

  final DraggableScrollableController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                controller.animateTo(0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              },
              icon: const Icon(
                IconlyLight.arrowLeft2,
              ),
            ),
            const DraggableScrollTitle(),
            const BasketListView(),
            const DraggableBodySubTotal(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onTap: () {
                        controller.animateTo(0,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      },
                      title: 'ADD ITEMS',
                      outLine: true,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) {
                        return CustomButton(
                          onTap: () {
                            if (BlocProvider.of<AuthCubitCubit>(context)
                                .isLogin()) {
                              UserModel userModel =
                                  BlocProvider.of<AuthCubitCubit>(context)
                                      .userModel!;
                              BlocProvider.of<CartCubit>(context).sendOreder(
                                  email: userModel.email,
                                  username: userModel.username);
                            } else {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: LoginView()));
                            }
                          },
                          title: 'CHECKOUT',
                          isLoading: state is CartSendLoading,
                        );
                      },
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
