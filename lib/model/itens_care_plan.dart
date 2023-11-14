import 'dart:convert';
class ItemCarePlan {
    int? id;
    String? nome;
    String? frequencia;
    int? quantidade;
    String? observacao;
    String? code;

    ItemCarePlan({
        this.id,
        this.nome,
        this.frequencia,
        this.quantidade,
        this.observacao,
        this.code,
    });

    static List<ItemCarePlan> itemCareFromJson(String str) => List<ItemCarePlan>.from(json.decode(str).map((x) => ItemCarePlan.fromJson(x)));
    

    factory ItemCarePlan.fromRawJson(String str) => ItemCarePlan.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ItemCarePlan.fromJson(Map<String, dynamic> json) => ItemCarePlan(
        id: json["id"],
        nome: json["nome"],
        frequencia: json["frequencia"],
        quantidade: json["quantidade"],
        observacao: json["observacao"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "frequencia": frequencia,
        "quantidade": quantidade,
        "observacao": observacao,
        "code": code,
    };
}

class Medicamento {
    int? id;
    String? nome;
    String? frequencia;
    int? quantidade;
    List<Horario>? horarios;

    Medicamento({
        this.id,
        this.nome,
        this.frequencia,
        this.quantidade,
        this.horarios,
    });

    static List<Medicamento> medicamentoFromJson(String str) => List<Medicamento>.from(json.decode(str).map((x) => Medicamento.fromJson(x)));

    factory Medicamento.fromRawJson(String str) => Medicamento.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Medicamento.fromJson(Map<String, dynamic> json) => Medicamento(
        id: json["id"],
        nome: json["nome"],
        frequencia: json["frequencia"],
        quantidade: json["quantidade"],
        horarios: json["horarios"] == null ? [] : List<Horario>.from(json["horarios"]!.map((x) => Horario.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "frequencia": frequencia,
        "quantidade": quantidade,
        "horarios": horarios == null ? [] : List<dynamic>.from(horarios!.map((x) => x.toJson())),
    };
}

class Horario {
    String? hora;

    Horario({
        this.hora,
    });

    static List<Horario> horarioFromJson(String str) => List<Horario>.from(json.decode(str).map((x) => Horario.fromJson(x)));

    factory Horario.fromRawJson(String str) => Horario.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Horario.fromJson(Map<String, dynamic> json) => Horario(
        hora: json["hora"],
    );

    Map<String, dynamic> toJson() => {
        "hora": hora,
    };
}