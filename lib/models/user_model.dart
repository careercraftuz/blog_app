class UserModel {
  int id;
  String username;
  String password;

  UserModel({required this.id, required this.username, required this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      password: json['password'],
    );
  }
}
