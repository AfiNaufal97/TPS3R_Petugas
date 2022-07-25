import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petugas_tps3r/services/data_service.dart';

import 'cubit/bloc_get_user_state.dart';

class BlocGetUser extends Cubit<BlocGetUserState>{
  BlocGetUser():super(BlocGetUserStateInit());

  void getUserById(String id)async{
    try{
    emit(BlocGetUserStateLoading());
    var user = await DataService().getUserById(id);
    print(user.nama);
    emit(BlocGetUserStateSuccess(user: user));
    }catch(e){
      emit(BlocGetUserStateError(error: e.toString()));
    }
  }


}