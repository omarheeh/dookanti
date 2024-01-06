import 'package:bloc/bloc.dart';
import 'package:dookanti/feuters/dashboard/data/dashboard_repo/dashboard_repo_impl.dart';
import 'package:meta/meta.dart';

part 'change_stutus_state.dart';

class ChangeStutusCubit extends Cubit<ChangeStutusState> {
  DashBoardRepoImpl dashBoardRepoImpl;
  bool isActive = true;
  ChangeStutusCubit(this.dashBoardRepoImpl) : super(ChangeStutusInitial());
  Future<void> getStutus({required String id}) async {
    emit(ChangeStutusStartChange());
    var result = await dashBoardRepoImpl.getStutus(id: id);
    result.fold((failure) => emit(ChangeStutusFailure(failure.errMessage)),
        (value) {
      isActive = value;
      emit(ChangeStutusEndChange());
    });
  }

  Future<void> changeStutus({required String id, required bool stutus}) async {
    emit(ChangeStutusStartChange());
    var result = await dashBoardRepoImpl.updateStutus(id: id, stutus: stutus);
    result.fold((failure) => emit(ChangeStutusFailure(failure.errMessage)),
        (value) {
      isActive = value;
      emit(ChangeStutusEndChange());
    });
  }
}
