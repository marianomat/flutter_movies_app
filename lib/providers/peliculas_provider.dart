import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/pelicula_model.dart';

class PeliculasProvider {
  final String _apiKey = '44d4a3974f181c442980c11221d8f311';
  final String _url = 'api.themoviedb.org';
  final String _language = 'es-ES';
  final String _region = 'AR';

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'region': _region});
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final pelis = Peliculas.fromJsonList(decodedData['results']);
    return pelis.items;
  }
}
