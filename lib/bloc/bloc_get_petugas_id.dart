import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petugas_tps3r/services/data_service.dart';

import 'cubit/bloc_get_user_by_id_state.dart';

class BlocGetPetugasById extends Cubit<BlocGetPetugasByIdState>{
  BlocGetPetugasById():super(BlocGetPetugasByIdStateInit());

  void getUserById(String id)async{
    try{
      emit(BlocGetPetugasByIdStateLoading());
      var petugas = await DataService().getPetugas(id);
      emit(BlocGetPetugasByIdStateSuccess(petugas:petugas ));
    }catch(e){
      emit(BlocGetPetugasByIdStateError(error: e.toString()));
    }
  }

}