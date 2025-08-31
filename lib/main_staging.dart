import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:travel_app/app_di.dart';
import 'package:travel_app/bootstrap.dart';
import 'package:travel_app/src/shared/utils/app_constants.dart';
import 'package:travel_app/src/travel_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase first
  await Supabase.initialize(
    url: AppConstants.baseUrl,
    anonKey: AppConstants.supabaseKey,
  );

  // Then configure dependencies (which depend on Supabase being initialized)
  await configureDependencies();

  Bloc.observer = const AppBlocObserver();

  await bootstrap(() => const TravelApp());
}
