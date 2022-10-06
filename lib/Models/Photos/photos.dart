class Photos {
  final String title;
  final String url;

  Photos(
    this.title,
    this.url,
  );

  // Photos.fromJson(Map<String, dynamic> json)
  //     : albumId = json['albumId'] as int?,
  //       id = json['id'] as int?,
  //       title = json['title'] as String?,
  //       url = json['url'] as String?,
  //       thumbnailUrl = json['thumbnailUrl'] as String?;

  // Map<String, dynamic> toJson() => {
  //       'albumId': albumId,
  //       'id': id,
  //       'title': title,
  //       'url': url,
  //       'thumbnailUrl': thumbnailUrl
  //     };
}
