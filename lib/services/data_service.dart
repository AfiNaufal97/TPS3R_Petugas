
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/message_model.dart';
import '../model/petugas_model.dart';
import '../model/user.dart';

class DataService {
  CollectionReference<Map<String, dynamic>> dataPetugas =
      FirebaseFirestore.instance.collection('petugas');

  Future<void> addData({required PetugasModel petugasModel}) async {
    await dataPetugas.doc(petugasModel.id).set({
      'id': petugasModel.id,
      'nama': petugasModel.nama,
      'email': petugasModel.email,
      'role': petugasModel.role,
      'lat': petugasModel.lat,
      'long': petugasModel.long,
      'noHp': petugasModel.noHp,
      'status': petugasModel.status
    });
  }

  Future<PetugasModel> getPetugas(String id)async{
    DocumentSnapshot data = await dataPetugas.doc(id).get();
    PetugasModel petugasModel = PetugasModel(id: id,
      email: data['email'],
      lat: data['lat'],
      long: data['long'],
      role: data['role'],
      nama: data['nama'],
      noHp: data['noHp'],
      status: data['status'],);
  return petugasModel;
  }

  Future<List<User>> getAllUser()async{
    var firestoreUser = FirebaseFirestore.instance.collection('users');
    var data = await firestoreUser.get();
    var listUser = data.docs.map((e) => User.fromMap(e.data())).toList();
    return listUser;
  }

  Future<User> getUserById(String id)async{
    var firestoreUser = FirebaseFirestore.instance.collection('users');
    var data = await firestoreUser.doc(id).get();
    User user = User(nama: data['nama'], email: data['email'], id: data['id'], alamat: data['alamat'], lat: data['lat'], long: data['long'], nohp: data['nohp']);
    return user;
  }

  Future<PetugasModel> getPetugasById(String id)async{
    var firestoreUser = FirebaseFirestore.instance.collection('users');
    var data = await firestoreUser.doc(id).get();
    PetugasModel petugasModel = PetugasModel(nama: data['nama'], email: data['email'], id: data['id'], lat: data['lat'], long: data['long'], noHp: data['nohp'], role: data['role'], status: data['status']);
    return petugasModel;
  }

  Future<List<MessageModel>> getMessageUser(String id)async{
    var message = FirebaseFirestore.instance.collection('message');
    var messageAll = await message.where('to', isEqualTo: id).get();
    messageAll.docs.map((e) => print(e));
    var list  = messageAll.docs.map((e) => MessageModel.fromMap(e.data())).toList();
    return list;
  }

}
