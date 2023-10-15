class DetailModel {
  String type;
  String title;
  String englishTitle;
  String synopsis;
  String status;
  String image;
  String ratings;
  String totalEps;
  String season;
  String duration;
  List<String> genres;
  String demografis;
  String theme;
  String skors;
  String studio;
  List<Episode> episode;

  DetailModel({
    required this.type,
    required this.title,
    required this.englishTitle,
    required this.synopsis,
    required this.status,
    required this.image,
    required this.ratings,
    required this.totalEps,
    required this.season,
    required this.duration,
    required this.genres,
    required this.demografis,
    required this.theme,
    required this.skors,
    required this.studio,
    required this.episode,
  });

  factory DetailModel.fromJson(Map<String, dynamic> json) => DetailModel(
        type: json["type"],
        title: json["title"],
        englishTitle: json["englishTitle"],
        synopsis: json["synopsis"],
        status: json["status"],
        image: json["image"],
        ratings: json["ratings"],
        totalEps: json["totalEps"],
        season: json["season"],
        duration: json["duration"],
        genres: List<String>.from(json["genres"].map((x) => x)),
        demografis: json["demografis"],
        theme: json["theme"],
        skors: json["skors"],
        studio: json["studio"],
        episode:
            List<Episode>.from(json["episode"].map((x) => Episode.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
        "englishTitle": englishTitle,
        "synopsis": synopsis,
        "status": status,
        "image": image,
        "ratings": ratings,
        "totalEps": totalEps,
        "season": season,
        "duration": duration,
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "demografis": demografis,
        "theme": theme,
        "skors": skors,
        "studio": studio,
        "episode": List<dynamic>.from(episode.map((x) => x.toJson())),
      };
}

class Episode {
  String episodeId;
  String epsTitle;

  Episode({
    required this.episodeId,
    required this.epsTitle,
  });

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        episodeId: json["episodeId"],
        epsTitle: json["epsTitle"],
      );

  Map<String, dynamic> toJson() => {
        "episodeId": episodeId,
        "epsTitle": epsTitle,
      };
}
