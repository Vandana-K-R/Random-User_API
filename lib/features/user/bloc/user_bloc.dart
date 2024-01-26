import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:random_user_api/features/user/model/user_model.dart';
import 'package:random_user_api/features/user/repos/user_api.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserInitialEvent>(userInitialEvent);
  }

  FutureOr<void> userInitialEvent(
      UserInitialEvent event, Emitter<UserState> emit) async {
    try {
      emit(UserFetchingLoadingState());
      List<UserModel> user = await UserApi.userFetch();
      emit(UserFetchingSuccessState(user: user));
      print(user);
    } catch (e) {
      emit(UserFetchingErrorState());
      log(e.toString());
    }
  }
}
