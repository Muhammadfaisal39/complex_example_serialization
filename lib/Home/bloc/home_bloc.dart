import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:complex_example_serialization/Home/Repository/fetch_data.dart';
import 'package:complex_example_serialization/Models/user_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<FetchUserDataEvent>(fetchUserDataEvent);
  }

  FutureOr<void> fetchUserDataEvent(FetchUserDataEvent event, Emitter<HomeState> emit) async {
    emit(LoadingUserState());
    List<User> userList = await UserRepo.fetchUsers();
    emit(FetchingUserState(userList: userList));
  }
}
