import 'package:ecommerse/core/routes/routes.dart';
import 'package:ecommerse/features/auth/presentation/pages/verify_otp_page.dart';
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
  initialLocation: AppPath.splash,
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
    // ------------- AUTH  -------------

    GoRoute(
        path: AppPath.splash, builder: (context, state) => const SplashPage()),

    GoRoute(
      path: AppPath.onBoarding,
      builder: (context, state) => const OnboardingPage(),
    ),

    GoRoute(
      path: AppPath.login,
      builder: (context, state) => const LoginPage(),
      routes: [
        GoRoute(
          path: PathName.verifyOtp,
          builder: (context, state) => const VerifyOtpPage(),
        ),
        GoRoute(
          path: PathName.signup,
          builder: (context, state) => const SignUpPage(),
        ),
      ],
    ),

    // ------------- HOME  -------------

    StatefulShellRoute.indexedStack(
      builder: (contex, state, statefulNavigationShell) {
        return RootShell(statefulNavigationShell: statefulNavigationShell);
      },
      branches: [
        // --- Home
        StatefulShellBranch(routes: [
          GoRoute(
              path: AppPath.home,
              builder: (context, state) => const HomePage(),
              routes: [
                GoRoute(
                  path: PathName.bestForYou,
                  builder: (context, state) => const BestForYouPage(),
                ),
                GoRoute(
                  path: PathName.brands,
                  builder: (context, state) => const BrandsPage(),
                ),
                GoRoute(
                  path: PathName.productsPopular,
                  builder: (context, state) => const PopularProductPage(),
                ),
                GoRoute(
                  path: PathName.buyAgain,
                  builder: (context, state) => const BuyAgainPage(),
                ),
              ]),
        ]),
        // --- Cart
        StatefulShellBranch(routes: [
          GoRoute(
              path: AppPath.cart,
              builder: (context, state) => const CartPage()),
        ]),
        // --- Favorite
        StatefulShellBranch(routes: [
          GoRoute(
              path: AppPath.favorite,
              builder: (context, state) => const FavoritePage()),
        ]),
        // --- Profile
        StatefulShellBranch(routes: [
          GoRoute(
              path: AppPath.profile,
              builder: (context, state) => const ProfilePage()),
        ]),
      ],
    ),
  ],
);
