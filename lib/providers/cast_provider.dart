import 'package:clase_3/models/cast_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/pelicula_model.dart';

class CastProvider {
  final String _apiKey = '44d4a3974f181c442980c11221d8f311';
  final String _url = 'api.themoviedb.org';
  final String _language = 'es-ES';
  final String _region = 'AR';

  Future<List<CastActor>> getCast(int movieId) async {
    final url = Uri.https(_url, '3/movie/${movieId}/credits',
        {'api_key': _apiKey, 'language': _language});
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final actores = Cast.fromJsonList(decodedData['cast']);
    return actores.actores;
  }
}
