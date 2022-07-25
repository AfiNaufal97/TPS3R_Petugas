class PetugasModel {
  String id;
  String email;
  String nama;
  String noHp;
  String role;
  String long;
  String lat;
  bool status;

  PetugasModel(
      {required this.id,
      required this.email,
      required this.lat,
      required this.long,
      required this.role,
      required this.nama,
      required this.noHp,
      required this.status});

  factory PetugasModel.fromMap(String id, Map<String, dynamic> map) {
    return PetugasModel(
        id: id,
        lat: map['lat'],
        email: map['email'],
        role: map['role'],
        long: map['long'],
        nama: map['nama'],
        noHp: map['noHp'],
        status: map['status']);
  }

  Map<String, dynamic> fromJson() {
    return {
      'id': id,
      'nama': nama,
      'email':email,
      'role': role,
      'lat': lat,
      'long': long,
      'noHp': noHp,
      'status': status
    };
  }
}
