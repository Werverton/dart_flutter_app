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