class RecentModel {
  String slug;
  String title;
  int episode;
  String cover;
  String url;

  RecentModel({
    required this.slug,
    required this.title,
    required this.episode,
    required this.cover,
    required this.url,
  });

  factory RecentModel.fromJson(Map<String, dynamic> json) => RecentModel(
        slug: json["slug"],
        title: json["title"],
        episode: json["episode"],
        cover: json["cover"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "title": title,
        "episode": episode,
        "cover": cover,
        "url": url,
      };
}
