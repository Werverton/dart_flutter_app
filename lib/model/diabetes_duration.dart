class DiabetesDuration {
  final int id;
  final String nome;

  DiabetesDuration({
    required this.id,
    required this.nome,
  });

  factory DiabetesDuration.fromJson(Map<String, dynamic> json) {
    return DiabetesDuration(
      id: json['id'],
      nome: json['nome'],
    );
  }
}