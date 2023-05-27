class PostModel {
  int id;
  int author;
  String title;
  String content;
  // store date as date object
  DateTime lastUpdate;
  DateTime creationDate;
  DateTime publicationDate;

  PostModel({
    required this.id,
    required this.title,
    required this.content,
    required this.publicationDate,
    required this.author,
    required this.lastUpdate,
    required this.creationDate,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      author: json['author'],
      title: json['title'],
      content: json['content'],
      lastUpdate: DateTime.parse(json['last_update']),
      creationDate: DateTime.parse(json['creation_date']),
      publicationDate: DateTime.parse(json['publication_date']),
    );
  }
}
