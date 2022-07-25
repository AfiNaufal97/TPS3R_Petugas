
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel{
  String text;
  String from;
  String to;
  Timestamp time;
  MessageModel({required this.from,required this.to, required this.time, required this.text});

  factory MessageModel.fromMap(Map<String, dynamic> map){
    return MessageModel( to: map['to'], time: map['time'],from: map['from'], text: map['text']);
  }

  Map<String, dynamic> toJSon(){
    return {
      'from':from,
      'to':to,
      'time':time,
      'text':text
    };
  }
}