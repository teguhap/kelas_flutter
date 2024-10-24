// To parse this JSON data, do
//
//     final popularFilmResponseModel = popularFilmResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:mulai_flutter_2/views/home/model/film_model.dart';

class PopularFilmResponseModel {
  int? page;
  List<FilmModel>? results;
  int? totalPages;
  int? totalResults;

  PopularFilmResponseModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory PopularFilmResponseModel.fromJson(Map<String, dynamic> json) =>
      PopularFilmResponseModel(
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<FilmModel>.from(
                json["results"]!.map((x) => FilmModel.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}
