class Urls {
  static const String baseUrl = "https://supermarket-dan1.onrender.com/api/v1";

  // -------------------------END PONINTS----------------------------------------------
  // Authentication
  static const String signIn = "/auth/signIn";
  static const String signUp = "/auth/signUp";
  static const String verficationOTP = "/auth/resetPassCode";
  static const String resetPW = "/auth/resetPassword";

  // Profile
  static const String getUserData = "/portfoilo/userData";

  // Home
  static const String getProducts = "/home/products";
  static String getProductById(int id) => "/home/products/$id";
  static const String getCategories = "/home/categories";
  static const String getBrands = "/home/brands";

  // Fav
  static const String getFav = "/user/getFavorite";
  static const String addToFav = "/user/addFavorite";
  static const String removeFav = "/user/deleteFavorite";

  // Cart
  static const String getCart = "/user/getCart";
  static const String addCart = "/user/addCart";
  static const String deleteCart = "/user/deleteCart";
}

//---------------------------- Api Keys ----------------------------------------------
class ApiKeys {
  static const String message = "message";
  static const String statusCode = "statusCode";
  static const String token = "token";
  static const String id = "id";

  // Get Items
  static const String total = "total";
  static const String skip = "skip";
  static const String limit = "limit";

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

  // favorite
  static const String productId = "productId";

  // Product Model info
  static const String title = "title";
  static const String description = "description";
  static const String category = "category";
  static const String price = "price";
  static const String discountPercentage = "discountPercentage";
  static const String rating = "rating";
  static const String stock = "stock";
  static const String tags = "tags";
  static const String brand = "brand";
  static const String sku = "sku";
  static const String weight = "weight";
  static const String dimensions = "dimensions";
  static const String width = "width";
  static const String height = "height";
  static const String depth = "depth";
  static const String warrantyInformation = "warrantyInformation";
  static const String shippingInformation = "shippingInformation";
  static const String availabilityStatus = "availabilityStatus";
  static const String reviews = "reviews";
  static const String comment = "comment";
  static const String date = "date";
  static const String reviewerName = "reviewerName";
  static const String reviewerEmail = "reviewerEmail";
  static const String returnPolicy = "returnPolicy";
  static const String minimumOrderQuantity = "minimumOrderQuantity";
  static const String meta = "meta";
  static const String createdAt = "createdAt";
  static const String updatedAt = "updatedAt";
  static const String barcode = "barcode";
  static const String qrCode = "qrCode";
  static const String images = "images";
  static const String thumbnail = "thumbnail";
}
