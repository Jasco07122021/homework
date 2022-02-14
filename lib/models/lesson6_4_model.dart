class UserLesson6H4 {
  String? email;
  String? number;
  String? address;
  String? password;

  UserLesson6H4({
    this.email,
    this.number,
    this.address,
    this.password,
  });

  UserLesson6H4.from({
    this.email,
    this.password,
  });

  UserLesson6H4.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        number = json['number'],
        address = json['address'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
    'email': email,
    'number': number,
    'address': address,
    'password': password,
  };
}
