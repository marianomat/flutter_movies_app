import 'package:clase_3/models/actor_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/pelicula_model.dart';

class ActorProvider {
  final String _apiKey = '44d4a3974f181c442980c11221d8f311';
  final String _url = 'api.themoviedb.org';
  final String _language = 'es-ES';
  final String _region = 'AR';

  Future<Actor> getActor(int personId) async {
    final url = Uri.https(_url, '3/person/${personId}', {
      'api_key': _apiKey,
    });
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final actor = Actor.fromJsonMap(decodedData);
    return actor;
  }
}
