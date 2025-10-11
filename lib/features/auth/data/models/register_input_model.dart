import 'dart:io';

import 'package:dio/dio.dart';

class RegisterInputModel {
  final String name;
  final String email;
  final String password;
  final String phoneNumber;
  final File? image;
  RegisterInputModel({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'phone': phoneNumber,
      'image': image != null
          ? MultipartFile.fromFileSync(
              image!.path,
              filename: image!.path.split('/').last,
            )
          : null,
    };
  }

  @override
  String toString() {
    return 'RegisterInputModel(name: $name, email: $email, password: $password, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(covariant RegisterInputModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.password == password &&
        other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        phoneNumber.hashCode;
  }
}
