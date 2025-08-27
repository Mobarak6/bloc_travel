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
  return getIt;
}

class _$AppDependenciesModule extends _i947.AppDependenciesModule {}
