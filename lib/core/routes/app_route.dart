import 'package:ecommerse/core/services/secure_token_store.dart';
import 'package:ecommerse/core/services/service_locator.dart';
import 'package:ecommerse/features/favorites/persentation/pages/favorite_page.dart';
import 'package:ecommerse/features/home/presentation/pages/best_for_you_page.dart';
import 'package:ecommerse/features/home/presentation/pages/brands_page.dart';
import 'package:ecommerse/features/home/presentation/pages/buy_again_page.dart';
import 'package:ecommerse/features/home/presentation/pages/popular_product_page.dart';
import 'package:ecommerse/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:ecommerse/features/auth/presentation/pages/signup_page.dart';
import 'package:ecommerse/root.dart';
import 'package:ecommerse/splash_page.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:ecommerse/features/auth/presentation/pages/login_page.dart';
import 'package:ecommerse/core/routes/routes_name.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

final InternetConnection _internet = InternetConnection();

final GoRouter appRouter = GoRouter(
  initialLocation: RoutesName.splash,
  debugLogDiagnostics: kDebugMode,

  redirect: (context, state) async {
    final hasInternet = await _internet.hasInternetAccess;
    if (!hasInternet) {
      debugPrint("No Internet");
    }
    // there is internet
    final token = await sl<SecureTokenStore>().readToken();
    if (token != null && state.matchedLocation == RoutesName.splash) {
      return RoutesName.root;
    }
    if(token == null && state.matchedLocation == RoutesName.root){
      return RoutesName.login;
    }
    return null;
  },
  routes: [
    GoRoute(path: RoutesName.splash, builder: (context, state) => const SplashPage()),
    GoRoute(
      path: RoutesName.onBoarding,
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: RoutesName.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: RoutesName.signup,
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(path: RoutesName.root, builder: (context, state) => const Root()),

    
    // home
    GoRoute(
      path: RoutesName.bestForYou,
      builder: (context, state) => const BestForYouPage(),
    ),
    GoRoute(
      path: RoutesName.brands,
      builder: (context, state) => const BrandsPage(),
    ),
    GoRoute(
      path: RoutesName.favourites,
      builder: (context, state) => const FavoritePage(),
    ),
    GoRoute(
      path: RoutesName.productsPopular,
      builder: (context, state) => const PopularProductPage(),
    ),
    GoRoute(
      path: RoutesName.buyAgain,
      builder: (context, state) => const BuyAgainPage(),
    ),
  ],
);
