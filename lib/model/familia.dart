class Familia{
  int? id;
  String name;

  Familia ({
    this.id,
    required this.name
  });

  factory Familia.fromMap(Map<String, dynamic> map){
    return Familia(id: map['id'], name: map['name']);
  }
  Map<String, dynamic>  toMap(){
    return {
      'id': this.id,
      'name': this.name
    };
  }
}