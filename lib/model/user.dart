import 'package:baid_health_dev/model/health_profile.dart';
class User {
  final String id;
  final String name;
  final String email;
  final DateTime dateOfBirth;
  final String gender;
  final String celular;
  final String cpf;
  final HealthProfile healthProfile;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.dateOfBirth,
    required this.gender,
    required this.celular,
    required this.cpf,
    required this.healthProfile,
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
    );
  }
}





class Disease {
  final int id;
  final String nome;

  Disease({
    required this.id,
    required this.nome,
  });

  factory Disease.fromJson(Map<String, dynamic> json) {
    return Disease(
      id: json['id'],
      nome: json['nome'],
    );
  }
}
