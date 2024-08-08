class Artigo{
  int? id;
  String name;
  dynamic? familia=0;
  // int? stock=0;

  Artigo ({
    this.id,
    required this.name,
    required this.familia,
    // this.stock
  });

  factory Artigo.fromMap(Map<String, dynamic> map){
    return Artigo(id: map['id'], name: map['name'], familia: map['familia']);
  }
  Map<String, dynamic>  toMap(){
    return {
      'id': this.id,
      'name': this.name,
      'familia':this.familia,
      // 'stock':this.stock
    };
  }
}