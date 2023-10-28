import 'package:baid_health_dev/model/health_profile.dart';

class User {
  String id;
  String name;
  String email;
  DateTime dateOfBirth;
  String gender;
  String celular;
  String cpf;
  HealthProfile healthProfile;
  String token;

  User({
    this.id = "",
    this.name = "",
    this.email = "",
    required this.dateOfBirth,
    this.gender = "",
    this.celular = "",
    this.cpf = "",
    required this.healthProfile,
    this.token ="",
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      dateOfBirth: DateTime.parse(json['dt_nascimento']),
      gender: json['genero'],
      celular: json['celular'],
      cpf: json['cpf'],
      healthProfile: HealthProfile.fromJson(json['perfil_saude']),
      token: json['token']
    );
  }
}
