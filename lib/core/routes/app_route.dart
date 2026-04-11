import 'package:ecommerse/core/routes/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
// import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';
import '../../features/cart/presentation/pages/cart_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/pages/popular_product_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/home/presentation/pages/best_for_you_page.dart';
import '../../features/favorites/persentation/pages/favorite_page.dart';
import '../../features/home/presentation/pages/brands_page.dart';
import '../../features/home/presentation/pages/buy_again_page.dart';
import '../../root.dart';
import '../../splash_page.dart';
import '../error/error_page.dart';
// import '../services/secure_token_store.dart';
// import '../services/service_locator.dart';

// final InternetConnection _internet = InternetConnection.createInstance();

final GoRouter appRouter = GoRouter(
  initialLocation: Routes.splash,
  debugLogDiagnostics: kDebugMode,

  //----------------- redirect ----------------//
  // redirect: (context, state) async {
  //   final hasInternet = await _internet.hasInternetAccess;
  //   if (!hasInternet) {
  //     // showNotifyMsg(text: tr.noInternet);
  //     return Routes.noInternet;
  //   }
  //   final token = await sl<SecureTokenStore>().readToken();
  //   if (state.matchedLocation == Routes.root && token != null) {
  //     return Routes.root;
  //   }
  //   return null;
  // },
  errorBuilder: (context, state) => ErrorPage(uri: state.uri),

  //=============== routes =================

  routes: [
    // ------------- ROOT & AUTH  -------------

    GoRoute(
        path: Routes.splash, builder: (context, state) => const SplashPage()),

    StatefulShellRoute.indexedStack(
      builder: (contex, state, statefulNavigationShell) {
        return RootShell(statefulNavigationShell: statefulNavigationShell);
      },
      branches: [
        // --------------- Home
        StatefulShellBranch(routes: [
          GoRoute(
              path: Routes.home,
              builder: (context, state) => const HomePage(),
              routes: [
                GoRoute(
                  path: Routes.bestForYou,
                  builder: (context, state) => const BestForYouPage(),
                ),
                GoRoute(
                  path: Routes.brands,
                  builder: (context, state) => const BrandsPage(),
                ),
                GoRoute(
                  path: Routes.favourites,
                  builder: (context, state) => const FavoritePage(),
                ),
                GoRoute(
                  path: Routes.productsPopular,
                  builder: (context, state) => const PopularProductPage(),
                ),
                GoRoute(
                  path: Routes.buyAgain,
                  builder: (context, state) => const BuyAgainPage(),
                ),
              ]),
        ]),
        // ------------------------------- Cart
        StatefulShellBranch(routes: [
          GoRoute(
              path: Routes.cart, builder: (context, state) => const CartPage()),
        ]),
        // ------------------------------- Favorite
        StatefulShellBranch(routes: [
          GoRoute(
              path: Routes.favorite,
              builder: (context, state) => const FavoritePage()),
        ]),
        // ------------------------------- Profile
        StatefulShellBranch(routes: [
          GoRoute(
              path: Routes.profile,
              builder: (context, state) => const ProfilePage()),
        ]),
      ],
    ),

    GoRoute(
      path: Routes.onBoarding,
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: Routes.signup,
      builder: (context, state) => const SignUpPage(),
    ),
  ],
);
