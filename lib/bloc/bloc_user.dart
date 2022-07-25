import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petugas_tps3r/services/data_service.dart';

import '../model/user.dart';
import 'cubit/bloc_auth_state.dart';
import 'cubit/bloc_user_state.dart';

class BlocUser extends Cubit<BlocUserState>{
  BlocUser() : super(BlocUserStateInit());

  Future<void> getAllUser()async{
    try{
      emit(BlocUserStateLoading());
      List<User> users = await DataService().getAllUser();
      emit(BlocUserStateSuccess(user: users));
    }catch(e){
      emit(BlocUserStateError(error: e.toString()));
    }
  }

}

