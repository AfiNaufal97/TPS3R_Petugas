class User {
  String alamat;
  String email;
  String id;
  String lat;
  String long;
  String nama;
  String nohp;

  User({required this.nama, required this.email, required this.id, required this.alamat, required this.lat, required this.long, required this.nohp});

  factory User.fromMap(Map<String, dynamic> map){
    return User(nama: map['nama'], email: map['email'], id: map['id'], alamat: map['alamat'], lat: map['lat'], long: map['long'], nohp: map['nohp']);
  }

  Map<String, dynamic> toJson(){
    return {
      'id':id,
      'alamat':alamat,
      'email':email,
      'lat':lat,
      'long':long,
      'nama':nama,
      'nohp':nohp
    };
  }
}