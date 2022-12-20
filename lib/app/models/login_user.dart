class LoginUser {
  String? username;
  String? password;

  LoginUser({this.username, this.password});

  Map<String, dynamic> toJson() => {"username": username, "password": password};
}

class WPUser {
  late final int id;
  late final String email;
  late final String niceName;
  late final String firstName;
  late final String lastName;
  late final String displayName;
  late final String token;

  WPUser(this.id, this.email, this.niceName, this.firstName, this.lastName,
      this.displayName, this.token);

  WPUser.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    email = json["email"];
    niceName = json["nicename"];
    firstName = json["firstName"];
    lastName = json["lastName"];
    displayName = json['displayName'];
    token = json['token'];
  }

  toJson() => {
        "token": token,
        "id": id,
        "email": email,
        "nicename": niceName,
        "firstName": firstName,
        "lastName": lastName,
        "displayName": displayName
      };
}
