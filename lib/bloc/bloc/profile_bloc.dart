import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {
    });
    on<FetchDetails>(fetchdetails);
  }

  FutureOr<void> fetchdetails(FetchDetails event, Emitter<ProfileState> emit) async{
    emit(DetailLoading());
    try{
    final SharedPreferences prefs=await SharedPreferences.getInstance();
    final String name = prefs.getString('name')!;
    final String email= prefs.getString('email')!;
    emit(DetailsFetched(name: name, email: email));
    }
    catch(e){
      emit(ErrorFetching(message: e.toString()));
    }

  }
}
