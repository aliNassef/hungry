class ProfileModel {
  String name;
  String email;
  String image;
  String? address;

  ProfileModel({
    required this.name,
    required this.email,
    required this.image,
    this.address,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'],
      email: json['email'],
      image: json['image'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'image': image, 'address': address};
  }
}
