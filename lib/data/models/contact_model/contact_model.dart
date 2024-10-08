class ContactModel {
  String? id;
  String? name;
  String? phoneNumber;
  String? profileImage;

  ContactModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    this.profileImage,
  });

  // Factory constructor to create a UserModel from JSON
  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      profileImage: json['profileImage'], // Defaulting to false if null
    );
  }

  // Convert UserModel instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'profileImage': profileImage, // Ensure a non-null value is sent
    };
  }
}
