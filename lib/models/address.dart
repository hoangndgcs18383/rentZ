

class City {
  String? name;
  int? code;

  City({this.name, this.code});

   City.fromJson(Map<String, dynamic> json){
    name = json["name"];
    code = json['code'];
  }
}

class District{
  String? name;
  int? code;

  District({this.name, this.code});

  District.fromJson(Map<String, dynamic> json){
    name = json['name'];
    code = json['province_code'];
  }
}

class Ward{
  String? name;

  Ward({this.name});

  Ward.fromJson(Map<String, dynamic> json){
    name = json['name'];
  }
}

