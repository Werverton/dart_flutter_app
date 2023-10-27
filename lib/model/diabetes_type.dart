class DiabetesType {
  final int id;
  final String nome;

  DiabetesType({
    required this.id,
    required this.nome,
  });

  factory DiabetesType.fromJson(Map<String, dynamic> json) {
    return DiabetesType(
      id: json['id'],
      nome: json['nome'],
    );
  }
}

