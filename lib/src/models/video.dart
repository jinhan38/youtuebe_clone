// To parse this JSON data, do
//
//     final video = videoFromJson(jsonString);

import 'dart:convert';

Video videoFromJson(String str) => Video.fromJson(json.decode(str));

String videoToJson(Video data) => json.encode(data.toJson());

class Video {
  Video({
    required this.kind,
    required this.etag,
    required this.id,
    required this.snippet,
  });

  final String kind;
  final String etag;
  final Id id;
  final Snippet snippet;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        kind: json["kind"],
        etag: json["etag"],
        id: Id.fromJson(json["id"]),
        snippet: Snippet.fromJson(json["snippet"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "id": id.toJson(),
        "snippet": snippet.toJson(),
      };
}

class Id {
  Id({
    required this.kind,
    required this.videoId,
  });

  final String kind;
  final String videoId;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        kind: json["kind"],
        videoId: json["videoId"],
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "videoId": videoId,
      };
}

class Snippet {
  DateTime publishedAt;
  String channelId;

  String title;
  String description;

  Thumbnails thumbnails;
  String channelTitle;
  String liveBroadcastContent;

  // DateTime publishTime;

  // Snippet(
  //     {DateTime? publishedAt,
  //     String? channelId,
  //     String? title,
  //     String? description,
  //     Thumbnails? thumbnails,
  //     String? channelTitle,
  //     String? liveBroadcastContent,
  //     DateTime? publishTime}) {
  //   this.publishedAt = publishedAt!;
  //   this.channelId = channelId!;
  //   this.title = title!;
  //   this.description = description!;
  //   this.thumbnails = thumbnails!;
  //   this.channelTitle = channelTitle!;
  //   this.liveBroadcastContent = liveBroadcastContent!;
  //   this.publishTime = publishTime!;
  // }

  Snippet({
    required this.publishedAt,
    required this.channelId,
    required this.title,
    required this.description,
    required this.thumbnails,
    required this.channelTitle,
    required this.liveBroadcastContent,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        publishedAt: DateTime.parse(json["publishedAt"]),
        channelId: json["channelId"],
        title: json["title"],
        description: json["description"],
        thumbnails: Thumbnails.fromJson(json["thumbnails"]),
        channelTitle: json["channelTitle"],
        liveBroadcastContent: json["liveBroadcastContent"],
        // publishTime: json["publishTime"] == null
        //     ? DateTime.now()
        //     : DateTime.parse(json["publishTime"]),
        // publishTime: json["publishTime"] == null
        //     ? DateTime.now()
        //     : DateTime.parse(json["publishTime"]),
      );

  Map<String, dynamic> toJson() => {
        "publishedAt": publishedAt.toIso8601String(),
        "channelId": channelId,
        "title": title,
        "description": description,
        "thumbnails": thumbnails.toJson(),
        "channelTitle": channelTitle,
        "liveBroadcastContent": liveBroadcastContent,
        // "publishTime": publishTime.toIso8601String(),
      };
}

class Thumbnails {
  Thumbnails({
    required this.thumbnailsDefault,
    required this.medium,
    required this.high,
  });

  // Thumbnails({
  //   required this.thumbnailsDefault,
  //   required this.medium,
  //   required this.high,
  // });

  Default thumbnailsDefault;

  Default medium;
  Default high;

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault: Default.fromJson(json["default"]),
        medium: Default.fromJson(json["medium"]),
        high: Default.fromJson(json["high"]),
      );

  Map<String, dynamic> toJson() => {
        "default": thumbnailsDefault.toJson(),
        "medium": medium.toJson(),
        "high": high.toJson(),
      };
}

class Default {
  // Default({String url, int? width, int? height}) {
  //   this.url = url!;
  //   this.width = width!;
  //   this.height = height!;
  // }

  Default(this.url, this.width, this.height);

  String url = "";
  int width = 0;
  int height = 0;

  factory Default.fromJson(Map<String, dynamic> json) => Default(
        json["url"],
        json["width"],
        json["height"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
      };
}
