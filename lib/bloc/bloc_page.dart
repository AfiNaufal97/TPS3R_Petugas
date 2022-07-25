import 'package:flutter_bloc/flutter_bloc.dart';

class BlocPage extends Cubit<int>{
  BlocPage() : super(1);


  void maps(){
    emit(0);
  }

  // void notif(){
  //   emit(2);
  // }

  void message(){
    emit(1);
  }
  
}