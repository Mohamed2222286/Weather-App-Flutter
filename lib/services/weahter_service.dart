import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherService {
  final String apikey = 'a8639ab6cf404336af335329241707';
  final String forcastBaseUrl = 'http://api.weatherapi.com/v1/forecast.json';
  final String searchBaseUrl = 'http://api.weatherapi.com/v1/search.json';

  Future<Map<String, dynamic>> featchCurrentWeather(String city) async {
    final url = '$forcastBaseUrl?key=$apikey&q=$city&days=1&aqi=no&alerts=no';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<Map<String, dynamic>> featch7dayforcast(String city) async {
    final url = '$forcastBaseUrl?key=$apikey&q=$city&days=7&aqi=no&alerts=no';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load forecast data');
    }
  }

  Future<List<dynamic>?> featchcitySuggestions(String query) async {
    final url = '$searchBaseUrl?key=$apikey&q=$query';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }
}
