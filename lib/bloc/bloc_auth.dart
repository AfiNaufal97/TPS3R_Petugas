import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/petugas_model.dart';
import '../services/auth_service.dart';
import '../services/data_service.dart';
import '../services/permission_service.dart';
import 'cubit/bloc_auth_state.dart';

class BlocAuth extends Cubit<BlocAuthState> {
  BlocAuth() : super(BlocAuthStateInit());

  void registerPetugasWithEmailAndPassword({required String nama,
    required String password,
    required String email,
    required String noHp,
    String role = 'petugas',
    bool status = true}) async {
    try {
      var position = await PermissionService().determinePosition();
      emit(BlocAuthStateLoading());

      var data = await AuthService()
          .petugasRegisterWithEmailAndPassword(email, password);
      PetugasModel petugasModel = PetugasModel(
          id: data.user!.uid,
          email: email,
          lat: position.latitude.toString(),
          long: position.longitude.toString(),
          role: 'petugas',
          nama: nama,
          noHp: noHp,
          status: true);
      await DataService().addData(petugasModel: petugasModel);
      emit(BlocAuthStateSuccess(petugasModel: petugasModel));
    } catch (e) {
      emit(BlocAuthStateError(error: e.toString()));
    }
  }

  void loginPetugasWithEmailAndPassword(String email, String password) async {
    try {
      emit(BlocAuthStateLoading());
      var data = await AuthService().petugasLoginWithEmailAndPassword(
          email, password);
      var petugas = await DataService().getPetugas(data.user!.uid);
      if (petugas.role == 'petugas') {
        emit(BlocAuthStateSuccess(petugasModel: petugas));
      } else {
        emit(BlocAuthStateError(error: 'bukan petugas'));
      }
    } catch (e) {
      emit(BlocAuthStateError(error: e.toString()));
    }
  }


  void getUserById(String id) async {
    try {
      emit(BlocAuthStateLoading());
      var petugas = await DataService().getPetugas(id);
      emit(BlocAuthStateSuccess(petugasModel: petugas));
    } catch (e) {
      emit(BlocAuthStateError(error: e.toString()));
    }
  }
}
