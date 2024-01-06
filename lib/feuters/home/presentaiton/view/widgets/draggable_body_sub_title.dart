import 'package:dookanti/core/functions/size_config.dart';
import 'package:dookanti/feuters/home/presentaiton/view/widgets/rps_custom_painter_basket.dart';
import 'package:dookanti/feuters/products/presintation/view_model/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DraggableBodySubTotal extends StatelessWidget {
  const DraggableBodySubTotal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: CustomPaint(
          size: Size(SizeConfig.screenWidth,
              (SizeConfig.screenWidth * 0.25).toDouble()),
          painter: RPSCustomPainterBasket(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  return Text(
                    'SubTotal : \$ ${BlocProvider.of<CartCubit>(context).sumPrice().toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
