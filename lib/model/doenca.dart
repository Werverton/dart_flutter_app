import 'dart:convert';
class Doenca {
    int? id;
    String? nome;

    Doenca({
        this.id,
        this.nome,
    });

    factory Doenca.fromRawJson(String str) => Doenca.fromJson(json.decode(str));
    
    static List<Doenca> doencaFromJson(String str) => List<Doenca>.from(json.decode(str).map((x) => Doenca.fromJson(x)));

    String toRawJson() => json.encode(toJson());

    String doencaToJson(List<Doenca> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

    factory Doenca.fromJson(Map<String, dynamic> json) => Doenca(
        id: json["id"],
        nome: json["nome"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
    };
}