class User {
  int? id;
  String name;
  String email;
  String password;
  String? avatar;

  User({
    this.id,
    this.name = '',
    this.email = '',
    this.password = '',
    this.avatar = '',
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: int.parse(json["id"]),
    name: json["name"],
    email: json["email"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "avatar": avatar,
  };

  @override
  String toString() {
    return 'User: {id: $id, name: $name, email: $email, avatar: $avatar}';
  }

}