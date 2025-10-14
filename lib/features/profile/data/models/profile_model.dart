import 'dart:io';

import 'package:dio/dio.dart';

class ProfileModel {
  final String name;
  final String email;
  final String? image;
  final String? address;
  final File? imageFile;
  final String? phoneNumber;
  const ProfileModel({
    required this.name,
    required this.email,
    this.image,
    this.address,
    this.imageFile,
    this.phoneNumber,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'],
      email: json['email'],
      image: json['image'],
      phoneNumber: json['phone'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'address': address,
      'image': imageFile != null
          ? MultipartFile.fromFileSync(
              imageFile!.path,
              filename: imageFile!.path.split('/').last,
            )
          : null,
      'phone': phoneNumber,
    };
  }
}
