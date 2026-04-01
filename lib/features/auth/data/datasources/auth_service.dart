



// import 'package:dio/dio.dart';
// import 'package:ecommerse/core/constants/ursls.dart';
// import 'package:retrofit/retrofit.dart';

// part 'auth_service.g.dart';

// @RestApi(baseUrl: Urls.baseUrl)
// abstract class AuthService {
//   factory AuthService(Dio dio, {String? baseUrl}) = _AuthService;

//   @POST(Urls.signIn)
//   Future<void> signIn(@Body() Map<String, dynamic> body);

//   @POST(Urls.signUp)
//   Future<void> signUp(@Body() Map<String, dynamic> body);

//   @POST(Urls.verficationOTP)
//   Future<void> verifyOtp(@Body() Map<String, dynamic> body);

//   @POST(Urls.resetPW)
//   Future<void> resetPW(@Body() Map<String, dynamic> body);
// }