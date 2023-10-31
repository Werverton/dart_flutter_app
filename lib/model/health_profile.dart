/*import 'package:baid_health_dev/model/diabetes_type.dart';
import 'package:baid_health_dev/model/doenca.dart';
import 'package:baid_health_dev/model/habit.dart';
import 'package:baid_health_dev/model/diabetes_duration.dart';

class HealthProfile {
  final double peso;
  final double altura;
  final double imc;
  final DiabetesType tipoDiabete;
  final DiabetesDuration tempoDiabete;
  final List<Disease> doencas;
  final List<Habit> habitos;

  HealthProfile({
    this.peso= 0,
    this.altura =0,
    this.imc=0,
    required this.tipoDiabete,
    required this.tempoDiabete,
    required this.doencas,
    required this.habitos,
  });

  factory HealthProfile.fromJson(Map<String, dynamic> json) {
    return HealthProfile(
      peso: json['peso'].toDouble(),
      altura: json['altura']?.toDouble(),
      imc: json['imc']?.toDouble(),
      tipoDiabete: DiabetesType.fromJson(json['tipo_diabete']),
      tempoDiabete: DiabetesDuration.fromJson(json['tempo_diabete']),
      doencas: (json['doencas'] as List<dynamic>)
          .map((disease) => Disease.fromJson(disease))
          .toList(),
      habitos: (json['habitos'] as List<dynamic>)
          .map((habit) => Habit.fromJson(habit))
          .toList(),
    );
  }
}*/
