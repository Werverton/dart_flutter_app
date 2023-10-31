class Habit {
  final int id;
  final String nome;

  Habit({
    this.id=0,
    this.nome="",
  });

  factory Habit.fromJson(Map<String, dynamic> json) {
    return Habit(
      id: json['id'],
      nome: json['nome'],
    );
  }
}
