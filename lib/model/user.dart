import 'dart:convert';
import 'package:baid_health_dev/model/doenca.dart';

class Welcome {
  User? user;
  String? token;

  Welcome({
    this.user,
    this.token,
  });

  factory Welcome.fromRawJson(String str) => Welcome.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "token": token,
      };
}

class User {
  String? id;
  String? name;
  String? email;
  DateTime? dtNascimento;
  String? genero;
  String? celular;
  String? cpf;
  PerfilSaude? perfilSaude;

  User({
    this.id,
    this.name,
    this.email,
    this.dtNascimento,
    this.genero,
    this.celular,
    this.cpf,
    this.perfilSaude,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        dtNascimento: json["dt_nascimento"] == null
            ? null
            : DateTime.parse(json["dt_nascimento"]),
        genero: json["genero"],
        celular: json["celular"],
        cpf: json["cpf"],
        perfilSaude: json["perfil_saude"] == null
            ? null
            : PerfilSaude.fromJson(json["perfil_saude"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "dt_nascimento": dtNascimento?.toIso8601String(),
        "genero": genero,
        "celular": celular,
        "cpf": cpf,
        "perfil_saude": perfilSaude?.toJson(),
      };
}

class PerfilSaude {
  int? peso;
  double? altura;
  double? imc;
  TempoDiabete? tipoDiabete;
  TempoDiabete? tempoDiabete;
  List<Doenca>? doencas;
  List<Habito>? habitos;

  PerfilSaude({
    this.peso,
    this.altura,
    this.imc,
    this.tipoDiabete,
    this.tempoDiabete,
    this.doencas,
    this.habitos,
  });

  factory PerfilSaude.fromRawJson(String str) =>
      PerfilSaude.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PerfilSaude.fromJson(Map<String, dynamic> json) => PerfilSaude(
        peso: json["peso"],
        altura: json["altura"]?.toDouble(),
        imc: json["imc"]?.toDouble(),
        tipoDiabete: json["tipo_diabete"] == null
            ? null
            : TempoDiabete.fromJson(json["tipo_diabete"]),
        tempoDiabete: json["tempo_diabete"] == null
            ? null
            : TempoDiabete.fromJson(json["tempo_diabete"]),
        doencas: json["doencas"] == null
            ? []
            : List<Doenca>.from(
                json["doencas"]!.map((x) => Doenca.fromJson(x))),
        habitos: json["habitos"] == null
            ? []
            : List<Habito>.from(
                json["habitos"]!.map((x) => Habito.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "peso": peso,
        "altura": altura,
        "imc": imc,
        "tipo_diabete": tipoDiabete?.toJson(),
        "tempo_diabete": tempoDiabete?.toJson(),
        "doencas": doencas == null
            ? []
            : List<dynamic>.from(doencas!.map((x) => x.toJson())),
        "habitos": habitos == null
            ? []
            : List<dynamic>.from(habitos!.map((x) => x.toJson())),
      };
}

class TempoDiabete {
  int? id;
  String? nome;

  TempoDiabete({
    this.id,
    this.nome,
  });

  factory TempoDiabete.fromRawJson(String str) =>
      TempoDiabete.fromJson(json.decode(str));

      

  String toRawJson() => json.encode(toJson());

  factory TempoDiabete.fromJson(Map<String, dynamic> json) => TempoDiabete(
        id: json["id"],
        nome: json["nome"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
      };
}

class Habito {
  int? id;
  String? nome;

  Habito({
    this.id,
    this.nome,
  });

  static List<Habito> habitoFromJson(String str) => List<Habito>.from(json.decode(str).map((x) => Habito.fromJson(x)));

  factory Habito.fromRawJson(String str) => Habito.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Habito.fromJson(Map<String, dynamic> json) => Habito(
        id: json["id"],
        nome: json["nome"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
      };
}
