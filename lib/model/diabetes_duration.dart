class DiabetesDuration {
  final int id;
  final String nome;

  DiabetesDuration({
    this.id = 0,
    this.nome="",
  });

  factory DiabetesDuration.fromJson(Map<String, dynamic> json) {
    return DiabetesDuration(
      id: json['id'],
      nome: json['nome'],
    );
  }
}