import 'package:dookanti/core/widgets/custom_button.dart';
import 'package:dookanti/feuters/dashboard/presintation/view_model/add_category/add_category_cubit.dart';
import 'package:dookanti/feuters/home/presentaiton/view/widgets/custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class AddCategoryAddPart extends StatefulWidget {
  const AddCategoryAddPart({
    super.key,
  });

  @override
  State<AddCategoryAddPart> createState() => _AddCategoryAddPartState();
}

class _AddCategoryAddPartState extends State<AddCategoryAddPart> {
  late TextEditingController partController;

  @override
  void initState() {
    super.initState();
    partController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                iconData: Icons.category,
                hintText: 'Part',
                controller: partController,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: CustomButton(
                title: 'Add',
                onTap: () {
                  if (partController.text.isNotEmpty &&
                      partController.text.trim() != '') {
                    BlocProvider.of<AddCategoryCubit>(context)
                        .partsList
                        .add(partController.text);
                    partController.clear();
                    setState(() {});
                  }
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount:
                  BlocProvider.of<AddCategoryCubit>(context).partsList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text('${index + 1}'),
                  title: Text(BlocProvider.of<AddCategoryCubit>(context)
                      .partsList[index]),
                );
              }),
        ),
      ],
    );
  }
}
