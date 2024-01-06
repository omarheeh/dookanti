import 'package:dookanti/core/functions/methods.dart';
import 'package:dookanti/feuters/dashboard/presintation/view/widgets/categorys_view_body.dart';
import 'package:dookanti/feuters/home/presentaiton/view_model/cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategorysView extends StatefulWidget {
  const CategorysView({super.key});
  static const String id = '/categorysview';

  @override
  State<CategorysView> createState() => _CategorysViewState();
}

class _CategorysViewState extends State<CategorysView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CategoriesCubit>(context).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Methods.DashBoardAppBar(context, "Categorys"),
      body: const CategorysViewBody(),
    );
  }
}
