class UserModel {
  String id;
  String name;
  String email;
  UserModel({required this.email, required this.id, required this.name});
   Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
    };
  }
}
