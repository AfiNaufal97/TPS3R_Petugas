import 'package:equatable/equatable.dart';

import '../../model/petugas_model.dart';

abstract class BlocAuthState extends Equatable{

}

class BlocAuthStateInit extends BlocAuthState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class BlocAuthStateLoading extends BlocAuthState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class BlocAuthStateError extends BlocAuthState{
  String error;
  BlocAuthStateError({required this.error});
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class BlocAuthStateSuccess extends BlocAuthState{
  PetugasModel petugasModel;
  BlocAuthStateSuccess({required this.petugasModel});
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}