import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "d89a369d835e4641f15e9316c4a350ec";
  static const String imageBaseUrl = "https://image.tmdb.org/t/p/w500";

  Future<Map<String, dynamic>> get(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint?api_key=$apiKey&language=fr-FR');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Échec du chargement des données');
    }
  }

  Future<List<dynamic>> getPopularMovies() async {
    final data = await get('/movie/popular');
    return data['results'];
  }

  static String getImageUrl(String path) {
    return '$imageBaseUrl$path';
  }
}
