class User {
  late String email;
  late String password;

  User({required this.email, required this.password});

  User.from({required this.email, required this.password});

  User.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };

  @override
  String toString() {
    // TODO: implement toString
    return "{$email $password}";
  }
}
