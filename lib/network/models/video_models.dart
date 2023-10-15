class VideoModel {
  String episode;
  String type;
  String size;

  VideoModel({
    required this.episode,
    required this.type,
    required this.size,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        episode: json["episode"],
        type: json["type"],
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "episode": episode,
        "type": type,
        "size": size,
      };
}
