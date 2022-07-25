import 'package:equatable/equatable.dart';

import '../../model/message_model.dart';

abstract class BlocMessageState extends Equatable{}

class BlocMessageStateInit extends BlocMessageState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}


class BlocMessageStateLoading extends BlocMessageState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}


class BlocMessageStateError extends BlocMessageState{
  String error;
  BlocMessageStateError({required this.error});
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}


class BlocMessageStateSuccess extends BlocMessageState{
  List<MessageModel> messageUser;
  BlocMessageStateSuccess({ required this.messageUser});
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}