class User {
  String? name;
  String? email;
  int? phone;
  String? password;
  String? confirmPassword;

  User({
    this.name,
    this.email,
    this.phone,
    this.password,
    this.confirmPassword,
  });

  User.from({
    this.email,
    this.password,
  });

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        phone = json['phone'],
        password = json['password'],
        confirmPassword = json['confirmPassword'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
        'confirmPassword': confirmPassword,
      };

  @override
  String toString() {
    // TODO: implement toString
    return "{name: $name, email: $email, phone: $phone, password: $password, confirm_p: $confirmPassword}";
  }
}
