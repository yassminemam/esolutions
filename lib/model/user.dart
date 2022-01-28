class AppUser {
  AppUser({
    required this.email,
    required this.password,
  });

  final String? email;
  final String? password;

  factory AppUser.fromJson(Map<String, dynamic> json) => AppUser(
        email: json["email"] == null ? null :  json["email"],
        password: json["password"] == null ? null :json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
