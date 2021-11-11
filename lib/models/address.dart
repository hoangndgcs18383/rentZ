
class City {
  String? name;
  int? code;
  List<District>? districts;

  City(this.name, this.code, [this.districts]);

  factory City.fromJson(dynamic json) {
    if (json['districts'] != null) {
      var districtObjJson = json['districts'] as List;
      List<District> _district = districtObjJson.map((districtJson) => District.fromJson(districtJson))
          .toList();

        return City(
          json['name'] as String,
          json['code'] as int,
          _district
      );
    } else {
      return City(
          json['name'] as String,
          json['code'] as int,
      );
    }

    // City.fromJson(Map<String, dynamic> json)
    // {
    //   name = json["name"] as String;
    //   code = json['code'] as int;
    // }
  }
}

class District{
  String? name;
  int? code;

  District({this.name, this.code});

  District.fromJson(Map<String, dynamic> json){
    name = json['name'] as String;
    code = json['code'] as int;
  }
}

class Ward{
  String? name;

  Ward({this.name});

  Ward.fromJson(Map<String, dynamic> json){
    name = json['name'] as String;
  }
}

