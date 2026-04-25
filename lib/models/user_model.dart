class UserModel {

  String uid;
  String role;

  String name;
  String email;
  String phone;

  String birthDate;
  String gender;

  String governorate;
  String city;
  String street;
  String building;
  String apartment;
  String landmark;

  UserModel({
    required this.uid,
    required this.role,
    required this.name,
    required this.email,
    required this.phone,
    required this.birthDate,
    required this.gender,
    required this.governorate,
    required this.city,
    required this.street,
    required this.building,
    required this.apartment,
    required this.landmark, required String fullName,
  });

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "role": role,
      "name": name,
      "email": email,
      "phone": phone,
      "birthDate": birthDate,
      "gender": gender,
      "governorate": governorate,
      "city": city,
      "street": street,
      "building": building,
      "apartment": apartment,
      "landmark": landmark,
    };
  }
}