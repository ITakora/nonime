class RecentModel {
  String title;
  String image;
  String animeId;
  String ratings;

  RecentModel({
    required this.title,
    required this.image,
    required this.animeId,
    required this.ratings,
  });

  factory RecentModel.fromJson(Map<String, dynamic> json) => RecentModel(
        title: json["title"] ?? '',
        image: json["image"] ?? '',
        animeId: json["animeId"] ?? '',
        ratings: json["ratings"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "image": image,
        "animeId": animeId,
        "ratings": ratings,
      };
}
