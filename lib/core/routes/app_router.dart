import 'package:ecommerse/features/auth/presentation/pages/verify_otp_page.dart';
import 'package:ecommerse/features/home/presentation/pages/brands_page.dart' show BrandsPage;
import 'package:ecommerse/features/home/presentation/pages/product_detiles_page.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
// import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';
import '../../features/cart/presentation/pages/cart_page.dart';
import '../../features/favorites/presentation/pages/favorite_page.dart';
import '../../features/home/presentation/pages/catagories_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/pages/product_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../root_shell.dart';
import '../../splash_page.dart';
// import '../error/error_page.dart';
// import '../services/secure_token_store.dart';
// import '../services/service_locator.dart';

// final InternetConnection _internet = InternetConnection.createInstance();

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
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
  // errorBuilder: (context, state) => ErrorPage(uri: state.uri),

  //=============== routes =================
  routes: [
    GoRoute(
      name: 'splash',
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    // ------------- AUTH  -------------

    /**
     * * nested go route
     *   GoRoute (path : "/home", build , routes: [
     *    GoRoute (path : "/products", build )
     * ])
     * 
     * /home/products 
     *  */

    GoRoute(
      name: 'onBoarding',
      path: '/onBoarding',
      builder: (context, state) => const OnboardingPage(),
    ),

    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) => const LoginPage(),
      routes: [
        GoRoute(
          //* /login/verifyOtp
          name: 'verifyOtp',
          path: 'verifyOtp',
          builder: (context, state) => const VerifyOtpPage(),
        ),
        GoRoute(
          //* /login/signup
          name: 'signup',
          path: 'signup',
          builder: (context, state) => const SignUpPage(),
        ),
      ],
    ),

    // ------------- HOME  -------------

    StatefulShellRoute.indexedStack(
      builder: (context, state, statefull) {
        return RootShell(statefulNavigationShell: statefull);
      },
      branches: [
        // --- Home
        StatefulShellBranch(routes: [
          GoRoute(
              name: 'home',
              path: '/home',
              builder: (context, state) => const HomePage(),
              routes: [
                GoRoute(
                  name: 'popularProduct',
                  path: 'popularProduct',
                  builder: (context, state) => const ProductPage(),
                ),
                GoRoute(
                  name: 'catagories', //   /home/catagories
                  path: 'catagories',
                  builder: (context, state) => const CatagoriesPage(),
                ),
                GoRoute(
                  name: 'brands',
                  path: 'brands',
                  builder: (context, state) => const BrandsPage(),
                )
              ]),
        ]),
        // --- Cart
        StatefulShellBranch(routes: [
          GoRoute(
              name: 'cart',
              path: '/cart',
              builder: (context, state) => const CartPage()),
        ]),
        // --- Favorite
        StatefulShellBranch(routes: [
          GoRoute(
              name: 'favorite',
              path: '/favorite',
              builder: (context, state) => const FavoritePage()),
        ]),
        // --- Profile
        StatefulShellBranch(routes: [
          GoRoute(
              name: 'profile',
              path: '/profile', //   /profile
              builder: (context, state) => const ProfilePage()),
        ]),
      ],
    ),

    GoRoute(
      name: 'productDetails',
      path: '/product/:id', //     */product/1
      builder: (context, state) {
        final int id = int.parse(state.pathParameters['id']!);
        return ProductDetailsPage(id: id);
      },
    ),
  ],
);
