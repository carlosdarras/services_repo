import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:services_repo/data/models/footballFieldModel.dart';

part 'football_event.dart';
part 'football_state.dart';

class FootballBloc extends Bloc<FootballEvent, FootballState> {
  FootballBloc() : super(FootballInitial()) {
    on<GetAllFields>(_onGetAllFields);
  }

  List<FootballFieldModel> footballFieldModel = [];

  void _onGetAllFields(
    GetAllFields event,
    Emitter emit,
  ) async {
    emit(FootballGetAllFieldLoadingState());
    var field = await FirebaseFirestore.instance
        .collection("fields")
        .get()
        .then((value) {
      for (var e in value.docs) {
        footballFieldModel.add(FootballFieldModel.fromJson(e.data(), e.id));
      }
      print('the field issssssss ${footballFieldModel}');
      emit(FootballGetAllFieldSuccessState());
    }).catchError((e) {
      emit(FootballGetAllFieldFailState());
    });

  }
}
