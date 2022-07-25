import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petugas_tps3r/model/message_model.dart';
import 'package:petugas_tps3r/services/data_service.dart';

import 'cubit/bloc_message_state.dart';

class BlocMessage extends Cubit<BlocMessageState>{
  BlocMessage():super(BlocMessageStateInit());

  void message(String id)async{
    print('Bloc Message');
    try{
      emit(BlocMessageStateLoading());
       var list = await DataService().getMessageUser(id);
       list.forEach((element) {print(element.text);});
      emit(BlocMessageStateSuccess(messageUser: list));
    }catch(e){
      emit(BlocMessageStateError(error: e.toString()));
    }
  }

}