class ReactionModel {
  int id;
  int post;
  int user;
  bool like;

  ReactionModel({
    required this.id,
    required this.post,
    required this.user,
    required this.like,
  });

  factory ReactionModel.fromJson(Map<String, dynamic> json) {
    return ReactionModel(
      id: json['id'],
      post: json['post'],
      user: json['user'],
      like: json['like'],
    );
  }
}
