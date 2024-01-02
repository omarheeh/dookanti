import 'package:dookanti/core/style/app_colors.dart';
import 'package:dookanti/feuters/products/presintation/view_model/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DraggableScrollTitle extends StatelessWidget {
  const DraggableScrollTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Basket',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              GestureDetector(
                child: TextButton(
                  child: const Text(
                    'Clear All',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    BlocProvider.of<CartCubit>(context).clear();
                  },
                ),
              ),
              const SizedBox(width: 16),
              CircleAvatar(
                backgroundColor: AppColors.primaryColor.withOpacity(0.7),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      return Text(
                        BlocProvider.of<CartCubit>(context)
                            .cartLength()
                            .toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
