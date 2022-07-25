import 'package:equatable/equatable.dart';

import '../../model/petugas_model.dart';
import '../../model/user.dart';

abstract class BlocGetPetugasByIdState extends Equatable{}

class BlocGetPetugasByIdStateInit extends BlocGetPetugasByIdState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}


class BlocGetPetugasByIdStateLoading extends BlocGetPetugasByIdState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}


class BlocGetPetugasByIdStateError extends BlocGetPetugasByIdState{
  String error;
  BlocGetPetugasByIdStateError({required this.error});
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class BlocGetPetugasByIdStateSuccess extends BlocGetPetugasByIdState{
  PetugasModel petugas;
  BlocGetPetugasByIdStateSuccess({required this.petugas});
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}