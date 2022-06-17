import 'package:clase_3/models/actor_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ActorProvider {
  final String _apiKey = '44d4a3974f181c442980c11221d8f311';
  final String _url = 'api.themoviedb.org';
  final String _language = 'es-ES';
  final String _region = 'AR';
}
