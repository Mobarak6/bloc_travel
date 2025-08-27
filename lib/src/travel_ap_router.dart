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
