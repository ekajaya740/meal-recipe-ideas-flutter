import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class RandomMealProvider {
  final String _httpRandom = 'http://www.themealdb.com/api/json/v1/1/random.php';
  // final FlutterSecureStorage _storage = FlutterSecureStorage();
  
  Future<Map<String, dynamic>> getRandomMeal() async {
    var _res = await http.get(Uri.parse(_httpRandom));

    return json.decode(_res.body)['meals'];
  }
}
