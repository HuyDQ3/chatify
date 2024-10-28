import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chatify/constant/enum/bloc/bloc_enum.dart';
import 'package:chatify/service/error/custom_logger.dart';
import 'package:chatify/utility/begin/repo/begin_repo.dart';
import 'package:equatable/equatable.dart';

part 'begin_event.dart';
part 'begin_state.dart';

class BeginBloc extends Bloc<BeginEvent, BeginState> {
  BeginBloc() : super(BeginInitial()) {
    on<BeginEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SetUpResourceEvent>(_onSetUpResourceEvent);
  }

  var beginRepo = BeginRepo();

  Future<void> _onSetUpResourceEvent(SetUpResourceEvent event, Emitter<BeginState> emit) async {
    try {
      emit(const SetUpResourceState(BlocStatusType.initial));
      await beginRepo.initial();
      emit(const SetUpResourceState(BlocStatusType.loading));
      await beginRepo.downloadResource();
      emit(const SetUpResourceState(BlocStatusType.success));
    }
    catch (e, s) {
      emit(const SetUpResourceState(BlocStatusType.failure));
      logger.log(error: e, stackTrace: s);
    }
  }
}
