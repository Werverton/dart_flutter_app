class DiabetesType {
  final int id;
  final String nome;

  DiabetesType({
    this.id =0,
    this.nome="",
  });

  factory DiabetesType.fromJson(Map<String, dynamic> json) {
    return DiabetesType(
      id: json['id'],
      nome: json['nome'],
    );
  }
}

