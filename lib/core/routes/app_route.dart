import 'package:ecommerse/core/services/secure_token_store.dart';
import 'package:ecommerse/features/home/presentation/pages/home_page.dart';
import 'package:ecommerse/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:ecommerse/features/auth/presentation/pages/signup_page.dart';
import 'package:ecommerse/root.dart';
import 'package:ecommerse/splash_page.dart';
import 'package:go_router/go_router.dart';
import 'package:ecommerse/features/auth/presentation/pages/login_page.dart';
import 'package:ecommerse/core/routes/route_names.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

final InternetConnection _internet = InternetConnection();

final GoRouter appRouter = GoRouter(
  initialLocation: RouteNames.splash,

  redirect: (context, state) async {
    final hasInternet = await _internet.hasInternetAccess;
    if (!hasInternet) {
      print("No Internet");
    }
    // there is internet
    final token = await SecureTokenStore.read();
    if (token != null && state.matchedLocation == RouteNames.splash) {
      return RouteNames.root;
    }
    return null;
  },
  routes: [
    GoRoute(path: RouteNames.splash, builder: (context, state) => SplashPage()),
    GoRoute(
      path: RouteNames.onBoarding,
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: RouteNames.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: RouteNames.signup,
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(path: RouteNames.root, builder: (context, state) => const Root()),
  ],
);
