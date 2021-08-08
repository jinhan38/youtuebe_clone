class Statistics {
  String viewCount;

  String favoriteCount;
  String commentCount;

  String subscriberCount;

  // Statistics({
  //    this.viewCount,
  //    this.favoriteCount,
  //    this.commentCount,
  //    this.subscriberCount,
  // });

  Statistics({
    String viewCount = "",
    String favoriteCount = "",
    String commentCount = "",
    String subscriberCount = "",
  })  : this.viewCount = viewCount,
        this.favoriteCount = favoriteCount,
        this.commentCount = commentCount,
        this.subscriberCount = subscriberCount;

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
        viewCount: json["viewCount"],
        favoriteCount: json["favoriteCount"],
        commentCount: json["commentCount"],
        subscriberCount: json["subscriberCount"],
      );

  Map<String, dynamic> toJson() => {
        "viewCount": viewCount,
        "favoriteCount": favoriteCount,
        "commentCount": commentCount,
        "subscriberCount": subscriberCount,
      };
}
