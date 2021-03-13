class AuthModel{
  int status;
  AuthData data;

  AuthModel.fromJson(Map<String, dynamic> json):
      status = json["status"],
      data = AuthData.fromJson(json["data"]);
}

class AuthData{
  dynamic id;
  String login;
  dynamic userType;
  String accessToken;

  AuthData.fromJson(Map<String, dynamic> json):
      id = json["id"],
      login = json["login"],
      userType = json["user_type"],
      accessToken = json["access_token"];
}