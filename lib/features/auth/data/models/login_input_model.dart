// ignore_for_file: public_member_api_docs, sort_constructors_first

class LoginInputModel {
  final String email;
  final String password;

  LoginInputModel({required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'email': email, 'password': password};
  }

  @override
  String toString() => 'LoginInputModel(email: $email, password: $password)';

  @override
  bool operator ==(covariant LoginInputModel other) {
    if (identical(this, other)) return true;

    return other.email == email && other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
