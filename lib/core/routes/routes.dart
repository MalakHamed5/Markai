class AppPath {
  const AppPath._();
  static const String splash = "/";
  static const String onBoarding = "/onBoarding";
  static const String noInternet = "/noInternet";

  static const String login = "/login";
  static const String signup = "$login/${PathName.signup}";
  static const String verifyOtp = "$login/${PathName.verifyOtp}";

  // home
  static const String home = "/home";
  static const String productPopular = "$home/${PathName.productsPopular}";
  static const String bestForYou = "$home/${PathName.bestForYou}";
  static const String brands = "$home/${PathName.brands}";
  static const String buyAgain = "$home/${PathName.buyAgain}";
  static const String favourites = "$home/${PathName.favourites}";

  // nav bar items
  static const String cart = "/cart";
  static const String favorite = "/favorite";
  static const String profile = "/profile";
}

class PathName {
  const PathName._();
  static const String signup = "signup";
  static const String verifyOtp = "verifyOtp";
  static const String bestForYou = "bestForyYou";
  static const String brands = "brands";
  static const String buyAgain = "buyAgain";
  static const String favourites = "favourites";
  static const String productsPopular = "productsPopular";
}
