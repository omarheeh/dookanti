import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dookanti/core/servise/firestore_servise.dart';
import 'package:dookanti/core/style/app_colors.dart';
import 'package:dookanti/feuters/dashboard/data/dashboard_repo/dashboard_repo_impl.dart';
import 'package:dookanti/feuters/dashboard/presintation/view_model/change_stutus/change_stutus_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class UserTd extends StatefulWidget {
  const UserTd({
    super.key,
    required this.email,
    required this.id,
    required this.stutus,
    this.header = false,
  });
  final String email;
  final String id;
  final bool stutus;
  final bool header;

  @override
  State<UserTd> createState() => _UserTdState();
}

class _UserTdState extends State<UserTd> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 50,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              IconlyLight.profile,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            widget.email,
          ),
        ),
        Expanded(
          flex: 1,
          child: BlocProvider(
            create: (context) => ChangeStutusCubit(
                DashBoardRepoImpl(FireStoreServise(FirebaseFirestore.instance)))
              ..getStutus(id: widget.id),
            child: ChangeStatus(
              id: widget.id,
              stutus: widget.stutus,
            ),
          ),
        ),
      ],
    );
  }
}

class ChangeStatus extends StatefulWidget {
  const ChangeStatus({
    super.key,
    required this.id,
    required this.stutus,
  });
  final String id;
  final bool stutus;
  @override
  State<ChangeStatus> createState() => _ChangeStatusState();
}

class _ChangeStatusState extends State<ChangeStatus> {
  late bool isActive;
  @override
  void initState() {
    super.initState();
    isActive = widget.stutus;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeStutusCubit, ChangeStutusState>(
      builder: (context, state) {
        return Row(
          children: [
            Text(
              isActive ? 'active' : 'block',
            ),
            Switch(
              activeColor: AppColors.primaryColor,
              value: isActive,
              onChanged: (value) {
                BlocProvider.of<ChangeStutusCubit>(context)
                    .changeStutus(id: widget.id, stutus: value);
                isActive = value;
                setState(() {});
              },
            ),
          ],
        );
      },
    );
  }
}
