import 'dart:convert';
import 'address.dart';
import 'package:http/http.dart' as http ;
class LocalApi{
  static Future<List<City>> getLocal() async {
    final url = Uri.parse('https://provinces.open-api.vn/api/p/');
    final response = await http.get(url);

    final List cities = json.decode(utf8.decode(response.bodyBytes));

    return cities.map((json) => City.fromJson(json)).toList();
  }
}

class DistrictsApi{
  static Future<List<District>> getLocal() async {
    final url = Uri.parse('https://provinces.open-api.vn/api/d/');
    final response = await http.get(url);

    final List cities = json.decode(utf8.decode(response.bodyBytes));

    return cities.map((json) => District.fromJson(json)).toList();
  }
}