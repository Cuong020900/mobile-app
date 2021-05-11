class Endpoints {
  Endpoints._();

  static const String host = "http://127.0.0.1:3000";

  // base url
  static const String baseUrl = "$host/api";

  // receiveTimeout
  static const int receiveTimeout = 5000;

  // connectTimeout
  static const int connectionTimeout = 3000;

  // user routes
  static const String loginAPI = baseUrl + "/user/auth/login";

  static const String registerApi = baseUrl + "/user/auth/register";

  static const String getProfile = baseUrl + "/user/profile";

}
