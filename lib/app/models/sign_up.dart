class SignUp {
  String? email;
  String? firstName;
  String? lastName;
  String? password;

  SignUp({this.email, this.firstName, this.lastName, this.password});

  Map<String, dynamic> toJson() => {
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "password": password
      };
}
