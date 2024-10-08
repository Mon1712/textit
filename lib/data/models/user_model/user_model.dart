class UserModel {
  String? id;
  String? name;
  String? phoneNumber;
  String? email;
  String? dateOfBirth;
  String? about;
  String? createdAt;
  String? lastActive;
  String? profileImage;
  bool? isOnline;

  UserModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.dateOfBirth,
    required this.about,
    this.createdAt,
    this.isOnline,
    this.lastActive,
    this.profileImage,
  });

  // Factory constructor to create a UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      dateOfBirth: json['dateOfBirth'],
      about: json['about'],
      createdAt: json['createdAt'],
      lastActive: json['lastActive'],
      profileImage: json['profileImage'],
      isOnline: json['isOnline'], // Defaulting to false if null
    );
  }

  // Convert UserModel instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'dateOfBirth': dateOfBirth,
      'about': about,
      'createdAt': createdAt,
      'profileImage': profileImage,
      'lastActive': lastActive,
      'isOnline': isOnline, // Ensure a non-null value is sent
    };
  }
}
