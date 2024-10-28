// To parse this JSON data, do
//
//     final genreListJsonModel = genreListJsonModelFromJson(jsonString);

import 'dart:convert';

GenreListJsonModel genreListJsonModelFromJson(String str) =>
    GenreListJsonModel.fromJson(json.decode(str));

String genreListJsonModelToJson(GenreListJsonModel data) =>
    json.encode(data.toJson());

class GenreListJsonModel {
  List<Genre>? genres;

  GenreListJsonModel({
    this.genres,
  });

  factory GenreListJsonModel.fromJson(Map<String, dynamic> json) =>
      GenreListJsonModel(
        genres: json["genres"] == null
            ? []
            : List<Genre>.from(json["genres"]!.map((x) => Genre.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "genres": genres == null
            ? []
            : List<dynamic>.from(genres!.map((x) => x.toJson())),
      };
}

class Genre {
  int? id;
  String? name;

  Genre({
    this.id,
    this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
