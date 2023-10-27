class Habit {
  final int id;
  final String nome;

  Habit({
    required this.id,
    required this.nome,
  });

  factory Habit.fromJson(Map<String, dynamic> json) {
    return Habit(
      id: json['id'],
      nome: json['nome'],
    );
  }
}
