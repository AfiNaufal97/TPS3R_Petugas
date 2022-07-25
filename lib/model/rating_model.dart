import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petugas_tps3r/model/user.dart';

class RatingModel{
  User user;
  double value;
  Timestamp time;
  String comentar;

  RatingModel({required this.user, required this.comentar, required this.time, required this.value});
  factory RatingModel.fromMap(Map<String, dynamic> map){
    return RatingModel(user: map['user'], comentar: map['comentar'], time: map['time'], value: map['value']);
  }

  Map<String, dynamic> toJson(){
    return{
      'user':user,
      'comentar':comentar,
      'time':time,
      'value':value
    };
  }
}