import 'dart:convert';

class User {
  final String firstname;
  final String lastname;
  final String email;
  final String type;
  final String password;
  User({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.type,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'type': type,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      firstname: map['firstname'] ?? '',
      lastname: map['lastname'] ?? '',
      email: map['email'] ?? '',
      type: map['type'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
