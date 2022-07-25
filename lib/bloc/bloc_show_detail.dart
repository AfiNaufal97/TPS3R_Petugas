import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/detail_location_model.dart';
import '../resources/string_assets.dart';
import '../resources/string_resource.dart';
import 'cubit/bloc_show_detail_state.dart';

class BlocShowDetail extends Cubit<BlocShowDetailSstate> {
  BlocShowDetail() : super(StateInit());

  void showDetail({required String nameLoc, required String noTelp,required String alamat}) {
    try {
      emit(StateLoading());
      var data = DetailLocationModel(
          imageLocation: StringAssets.imgTps3r,
          nameLocation: nameLoc,
          address: alamat,
          noTelepon: noTelp,
          open: StringResource.textValueTimeOpen);
      emit(StateSuccess(model: data));
    } catch (e) {
      emit(StateError(error: e.toString()));
    }
  }

  void endShow() {
    emit(StateInit());
  }
}
