class UserModel {
  final String name;
  final String email;
  final String token;
  final String img;

  UserModel({
    required this.name,
    required this.email,
    required this.token,
    required this.img,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      token: map['token'] as String,
      img: map['image'] as String,
    );
  }

  @override
  String toString() {
    return 'LoginModel(name: $name, email: $email, token: $token, img: $img)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.token == token &&
        other.img == img;
  }

  @override
  int get hashCode {
    return name.hashCode ^ email.hashCode ^ token.hashCode ^ img.hashCode;
  }
}
