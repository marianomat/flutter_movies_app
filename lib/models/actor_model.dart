import 'package:flutter/material.dart';

class Actor {
  String? birthday;
  late String knowForDepartment;
  late String? deathday;
  late int id;
  late String name;
  late List<String> alsoKnowAs;
  late int gender;
  late String biography;
  late double popularity;
  String? placeOfBirth;
  String? profilePath;
  late bool adult;
  late String imdbId;
  late String? homepage;

  Actor(
      {this.birthday,
      required this.knowForDepartment,
      this.deathday,
      required this.id,
      required this.name,
      required this.alsoKnowAs,
      required this.gender,
      required this.biography,
      required this.popularity,
      this.placeOfBirth,
      this.profilePath,
      required this.adult,
      required this.imdbId,
      this.homepage});

  Actor.fromJsonMap(Map<String, dynamic> json) {
    birthday = json['birthday'];
    knowForDepartment = json['know_for_department'];
    deathday = json['deathday'];
    id = json['id'];
    name = json['name'];
    alsoKnowAs = json['also_know_as'];
    gender = json['gender'];
    biography = json['biography'];
    popularity = json['popularity'] / 1;
    placeOfBirth = json['place_of_birth'];
    profilePath = json['profile_path'];
    adult = json['adult'];
    imdbId = json['imdb_id'];
    homepage = json['homepage'];
  }
}
