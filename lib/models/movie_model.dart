import 'dart:convert';

MovieModel movieModelFromJson(String str) =>
    MovieModel.fromJson(json.decode(str));

String movieModelToJson(MovieModel data) => json.encode(data.toJson());

class MovieModel {
  List<Data> data;
  int total;

  MovieModel({
    required this.data,
    required this.total,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "total": total,
      };
}

class Data {
  int id;
  String title;
  DateTime releaseDate;
  String boxOffice;
  int duration;
  String? overview;
  String coverUrl;
  String? trailerUrl;
  String directedBy;
  int phase;
  Saga saga;
  int chronology;
  int postCreditScenes;
  String imdbId;
  DateTime updatedAt;

  Data({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.boxOffice,
    required this.duration,
    required this.overview,
    required this.coverUrl,
    required this.trailerUrl,
    required this.directedBy,
    required this.phase,
    required this.saga,
    required this.chronology,
    required this.postCreditScenes,
    required this.imdbId,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        title: json["title"],
        releaseDate: DateTime.parse(json["release_date"]),
        boxOffice: json["box_office"],
        duration: json["duration"],
        overview: json["overview"] ?? '',
        coverUrl: json["cover_url"],
        trailerUrl: json["trailer_url"] ?? '',
        directedBy: json["directed_by"],
        phase: json["phase"],
        saga: sagaValues.map[json["saga"]]!,
        chronology: json["chronology"],
        postCreditScenes: json["post_credit_scenes"],
        imdbId: json["imdb_id"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "box_office": boxOffice,
        "duration": duration,
        "overview": overview,
        "cover_url": coverUrl,
        "trailer_url": trailerUrl,
        "directed_by": directedBy,
        "phase": phase,
        "saga": sagaValues.reverse[saga],
        "chronology": chronology,
        "post_credit_scenes": postCreditScenes,
        "imdb_id": imdbId,
        "updated_at": updatedAt.toIso8601String(),
      };
}

// ignore: constant_identifier_names
enum Saga { INFINITY_SAGA, MULTIVERSE_SAGA }

final sagaValues = EnumValues({
  "Infinity Saga": Saga.INFINITY_SAGA,
  "Multiverse Saga": Saga.MULTIVERSE_SAGA
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
