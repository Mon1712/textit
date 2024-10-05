class UserModel {
  String? id;
  String? name;
  String? username;
  String? email;
  String? dateOfBirth;
  String? status;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.dateOfBirth,
    required this.status,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      dateOfBirth: json['dateOfBirth'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'dateOfBirth': dateOfBirth,
      'status': status,
    };
  }
}