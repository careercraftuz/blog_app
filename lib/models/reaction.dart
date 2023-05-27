class Reaction {
  int id;
  int post;
  int user;
  bool like;

  Reaction({
    required this.id,
    required this.post,
    required this.user,
    required this.like,
  });

  factory Reaction.fromJson(Map<String, dynamic> json) {
    return Reaction(
      id: json['id'],
      post: json['post'],
      user: json['user'],
      like: json['like'],
    );
  }
}
