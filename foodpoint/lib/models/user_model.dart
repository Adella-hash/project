// lib/models/user_model.dart
class UserModel {
  final String id;
  final String name;
  final String email;
  final String profileImage;
  final String phoneNumber;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImage,
    required this.phoneNumber,
  });

  // Конвертация из JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      profileImage: json['profileImage'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
    );
  }

  // Конвертация в JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profileImage': profileImage,
      'phoneNumber': phoneNumber,
    };
  }
}
