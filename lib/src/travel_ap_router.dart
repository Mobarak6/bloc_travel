import 'package:auto_route/auto_route.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:travel_app/src/travel_ap_router.gr.dart';


@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class TravelAppRouter extends RootStackRouter {
  TravelAppRouter({
    required this.supabaseClient,
    // required this.authRepository,
    // required this.profileRepository,
  });

  final SupabaseClient supabaseClient;
  // final AuthRepository authRepository;
  // final ProfileRepository profileRepository;

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      path: '/',
      page: SplashRoute.page,
      guards: [
        AuthGuard(supabaseClient),
      ]
    ),
    AutoRoute(
      path: '/home',
      page: HomeRoute.page,
    ),

    AutoRoute(
      path: '/login',
      page: LoginRoute.page,
    ),

    AutoRoute(
      path: '/registration',
      page: RegistrationRoute.page,
    ),
  ];

  @override
  RouteType get defaultRouteType =>  RouteType.custom(
    transitionsBuilder: TransitionsBuilders.fadeIn,
    duration: const Duration(milliseconds: 200),
  );
}


class AuthGuard extends AutoRouteGuard {

  AuthGuard(this.supabase);
  final SupabaseClient supabase;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final user = supabase.auth.currentUser;

    if (user != null) {
      /// User is logged in → continue to home
      router.replace(const HomeRoute());
    } else {
      /// User not logged in → redirect to login
      router.replace(const LoginRoute());
    }
  }
}
