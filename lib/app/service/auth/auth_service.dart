import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:universe_store/app/models/login_user.dart';

class AuthService {
  var client = http.Client();

  Future<WPUser?> login(LoginUser user,
      {Function(Map<String, dynamic>)? onError}) async {
    // String endpoint = "https://store.universe1910.com/wp-json/jwt-auth/v1/token";
    var endpoint =
        Uri.https('store.universe1910.com', 'wp-json/jwt-auth/v1/token');
    var response = await http.post(endpoint, body: user.toJson());
    Map<String, dynamic> data = json.decode(response.body);
    if (data["success"]) {
      WPUser wpUser = WPUser.fromJson(data["data"]);
      return wpUser;
    } else {
      onError!(data);
    }
    return null;
  }
}
