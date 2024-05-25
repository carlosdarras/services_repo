import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:services_repo/data/models/user_info.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    on<MainEvent>((event, emit) {});
  }

  UserInfoModel? userInfoModel;
}
