// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:travel_app/src/features/auth/screens/login_screen.dart' as _i3;
import 'package:travel_app/src/features/auth/screens/registration_screen.dart'
    as _i5;
import 'package:travel_app/src/features/home/screens/home_screen.dart' as _i2;
import 'package:travel_app/src/features/profile/screens/profile_screen.dart'
    as _i4;
import 'package:travel_app/src/features/splash/screens/splash_screen.dart'
    as _i6;
import 'package:travel_app/src/features/trip/screens/create_trip_screen.dart'
    as _i1;
import 'package:travel_app/src/features/trip/screens/trip_list_screen.dart'
    as _i7;

/// generated route for
/// [_i1.CreateTripScreen]
class CreateTripRoute extends _i8.PageRouteInfo<CreateTripRouteArgs> {
  CreateTripRoute({
    required String userId,
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
         CreateTripRoute.name,
         args: CreateTripRouteArgs(userId: userId, key: key),
         initialChildren: children,
       );

  static const String name = 'CreateTripRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateTripRouteArgs>();
      return _i1.CreateTripScreen(userId: args.userId, key: args.key);
    },
  );
}

class CreateTripRouteArgs {
  const CreateTripRouteArgs({required this.userId, this.key});

  final String userId;

  final _i9.Key? key;

  @override
  String toString() {
    return 'CreateTripRouteArgs{userId: $userId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CreateTripRouteArgs) return false;
    return userId == other.userId && key == other.key;
  }

  @override
  int get hashCode => userId.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute({List<_i8.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginScreen();
    },
  );
}

/// generated route for
/// [_i4.ProfileScreen]
class ProfileRoute extends _i8.PageRouteInfo<void> {
  const ProfileRoute({List<_i8.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i4.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i5.RegistrationScreen]
class RegistrationRoute extends _i8.PageRouteInfo<void> {
  const RegistrationRoute({List<_i8.PageRouteInfo>? children})
    : super(RegistrationRoute.name, initialChildren: children);

  static const String name = 'RegistrationRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.RegistrationScreen();
    },
  );
}

/// generated route for
/// [_i6.SplashScreen]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute({List<_i8.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.SplashScreen();
    },
  );
}

/// generated route for
/// [_i7.TripListScreen]
class TripListRoute extends _i8.PageRouteInfo<TripListRouteArgs> {
  TripListRoute({
    required String userId,
    _i9.Key? key,
    bool isAdmin = false,
    List<_i8.PageRouteInfo>? children,
  }) : super(
         TripListRoute.name,
         args: TripListRouteArgs(userId: userId, key: key, isAdmin: isAdmin),
         initialChildren: children,
       );

  static const String name = 'TripListRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TripListRouteArgs>();
      return _i7.TripListScreen(
        userId: args.userId,
        key: args.key,
        isAdmin: args.isAdmin,
      );
    },
  );
}

class TripListRouteArgs {
  const TripListRouteArgs({
    required this.userId,
    this.key,
    this.isAdmin = false,
  });

  final String userId;

  final _i9.Key? key;

  final bool isAdmin;

  @override
  String toString() {
    return 'TripListRouteArgs{userId: $userId, key: $key, isAdmin: $isAdmin}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TripListRouteArgs) return false;
    return userId == other.userId &&
        key == other.key &&
        isAdmin == other.isAdmin;
  }

  @override
  int get hashCode => userId.hashCode ^ key.hashCode ^ isAdmin.hashCode;
}
