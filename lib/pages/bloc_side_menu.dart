import 'package:flutter_bloc/flutter_bloc.dart';

class BlocSideMenu extends Cubit<int>{
  BlocSideMenu() : super(0);

  void show(){
    emit(1);
  }

  void hidden(){
    emit(0);
  }

}