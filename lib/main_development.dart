import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:travel_app/app_di.dart';
import 'package:travel_app/bootstrap.dart';
import 'package:travel_app/src/shared/utils/app_constants.dart';
import 'package:travel_app/src/travel_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();


  Bloc.observer = const AppBlocObserver();

  await Supabase.initialize(
    url: AppConstants.baseUrl,
    anonKey: AppConstants.supabaseKey,
  );

  await bootstrap(() => const TravelApp());
}
