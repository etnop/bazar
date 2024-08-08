class ArtigoResource{
  int? id;
  String name;
  dynamic? familia=0;
  int stock=0;

  ArtigoResource ({
    this.id,
    required this.name,
    required this.familia,
    required this.stock
  });

  factory ArtigoResource.fromMap(Map<String, dynamic> map){
    return ArtigoResource(id: map['id'], name: map['name'], familia: map['familia'],stock: map['stock']);
  }
  Map<String, dynamic>  toMap(){
    return {
      'id': this.id,
      'name': this.name,
      'familia':this.familia,
      'stock':this.stock
    };
  }
}