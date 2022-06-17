import 'package:flutter/material.dart';

class CastActor {
  late int id;
  String? profilePath;
  late String name;
  late String originalName;

  CastActor.fromJsonMap(Map<String, dynamic> json) {
    id = json["id"];
    profilePath = json["profile_path"];
    name = json["name"];
    originalName = json["original_name"];
  }

  ImageProvider getActorImg() {
    if (profilePath == null) {
      return const AssetImage('assets/images/no-image.jpg');
    } else {
      return NetworkImage('https://image.tmdb.org/t/p/w500/$profilePath');
    }
  }
}

class Cast {
  List<CastActor> actores = [];

  Cast.fromJsonList(List<dynamic> jsonList) {
    for (var data in jsonList) {
      final CastActor actor = CastActor.fromJsonMap(data);
      actores.add(actor);
    }
  }
}
