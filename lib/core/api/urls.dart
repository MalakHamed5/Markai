class Urls {
  static const String baseUrl = "https://supermarket-dan1.onrender.com/api/v1";

  // -------------------------END PONINTS----------------------------------------------
  // Authentication
  static const String signIn = "/auth/signIn";
  static const String signUp = "/auth/signUp";
  static const String verficationOTP = "/auth/resetPassCode";
  static const String resetPW = "/auth/resetPassword";
  static const String getUserData = "/portfoilo/userData";

  // Home
  static const String getProducts = "/home/products";
}

class ApiKeys {
  static const String message = "message";
  static const String statusCode = "statusCode";
  static const String token = "token";
  static const String id = "id";

  // User Data
  // static const String data = "data";
  static const String name = "name";
  static const String email = "email";
  static const String phone = "phone";
  static const String password = "password";
  static const String confirmPassword = "confirmPassword";
  static const String image = "image";
  static const String address = "address";
  static const String user = "user";

  // Home
  static const String list = "list";
}
