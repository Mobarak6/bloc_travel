// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

import 'app_di_module.dart' as _i947;
import 'src/data/repositories/auth/auth_repository.dart' as _i313;
import 'src/data/repositories/auth/auth_repository_impl.dart' as _i472;
import 'src/data/repositories/profile/profile_repository.dart' as _i341;
import 'src/data/repositories/profile/profile_repository_impl.dart' as _i828;
import 'src/data/services/auth_service.dart' as _i123;
import 'src/features/auth/managers/auth_bloc.dart' as _i548;
import 'src/features/profile/managers/profile_bloc.dart' as _i500;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final appDependenciesModule = _$AppDependenciesModule();
  await gh.factoryAsync<_i460.SharedPreferences>(
    () => appDependenciesModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i454.SupabaseClient>(
    () => appDependenciesModule.supabaseClient,
  );
  gh.lazySingleton<_i361.Dio>(() => appDependenciesModule.dio);
  gh.lazySingleton<_i123.AuthService>(() => _i123.AuthService());
  gh.lazySingleton<_i341.ProfileRepository>(
    () => _i828.ProfileRepositoryImpl(),
  );
  gh.lazySingleton<_i313.AuthRepository>(
    () => _i472.AuthRepositoryImpl(gh<_i123.AuthService>()),
  );
  gh.factory<_i500.ProfileBloc>(
    () => _i500.ProfileBloc(gh<_i341.ProfileRepository>()),
  );
  gh.factory<_i548.AuthBloc>(() => _i548.AuthBloc(gh<_i313.AuthRepository>()));
  return getIt;
}

class _$AppDependenciesModule extends _i947.AppDependenciesModule {}
