class Movimento {
  int? id;
  int artigo;
  String descricao;
  int qtd;

  Movimento(
      {this.id,
      required this.artigo,
      required this.descricao,
      required this.qtd});

  factory Movimento.fromMap(Map<String, dynamic> map) {
    return Movimento(
        id: map['id'],
        artigo: map['artigo'],
        descricao: map['descricao'],
        qtd: map['qtd']);
  }
  Map<String, dynamic> toMap() {
    return {'id': id, 'artigo': artigo, 'descricao': descricao, 'qtd': qtd};
  }
}
