
import 'package:equatable/equatable.dart';

import '../../model/user.dart';

abstract class BlocUserState extends Equatable {

}


class BlocUserStateInit extends BlocUserState{

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}


class BlocUserStateError extends BlocUserState{
  String error;
  BlocUserStateError({required this.error});
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}


class BlocUserStateLoading extends BlocUserState{

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class BlocUserStateSuccess extends BlocUserState{
  List<User> user;
  BlocUserStateSuccess({required this.user});
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

