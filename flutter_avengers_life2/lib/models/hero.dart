class hero {
  String code;
  String name;
  String typeHero;
  int age;

  hero({this.code, this.name, this.typeHero, this.age});

  hero.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    typeHero = json['type_hero'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['type_hero'] = this.typeHero;
    data['age'] = this.age;
    return data;
  }
}