class Models {
  String title;
  String likes;
  String discraption;
  String version;
  List<String> tags;
  Models({
    required this.title,
    required this.likes,
    required this.discraption,
    required this.version,
    required this.tags,
  });
  factory Models.fromJson(Map<String, dynamic> json) {
    return Models(
      title: json['title']??'',
      likes: json['likes']??'',
      discraption: json['discraption']??'',
      version: json['version']??'',
      tags: List<String>.from(json['tags']),
    );
  }
}
