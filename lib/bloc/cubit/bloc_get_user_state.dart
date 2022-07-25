import 'package:equatable/equatable.dart';

import '../../model/user.dart';

abstract class BlocGetUserState extends Equatable{}


class BlocGetUserStateInit extends BlocGetUserState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class BlocGetUserStateLoading extends BlocGetUserState{

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}


class BlocGetUserStateError extends BlocGetUserState{
  String error;
  BlocGetUserStateError({required this.error});
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}


class BlocGetUserStateSuccess extends BlocGetUserState{
  User user;
  BlocGetUserStateSuccess({required this.user});
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}