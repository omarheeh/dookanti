import 'package:dookanti/core/functions/methods.dart';
import 'package:dookanti/feuters/dashboard/presintation/view/widgets/dashboard_view_body.dart';
import 'package:flutter/material.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Methods.DashBoardAppBar(context, 'DashBoard'),
      body: const DashBoardViewBody(),
    );
  }
}
