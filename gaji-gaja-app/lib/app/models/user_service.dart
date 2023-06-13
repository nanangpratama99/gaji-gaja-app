class User {
  String email;
  String password;
  User(this.email, this.password);
}

class Posts {
  int id;
  String name;
  String body;

  Posts({required this.id, required this.name, required this.body});

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(id: json['id'], name: json['title'], body: json['body']);
  }
}
