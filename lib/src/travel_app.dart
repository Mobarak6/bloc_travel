import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:travel_app/app_di.dart';
import 'package:travel_app/l10n/gen/app_localizations.dart';
import 'package:travel_app/src/travel_ap_router.dart';
import 'package:travel_app/theme/dark_theme.dart';
import 'package:travel_app/theme/light_theme.dart';

class TravelApp extends StatefulWidget {
  const TravelApp({super.key});

  @override
  State<TravelApp> createState() => _TravelAppState();
}

class _TravelAppState extends State<TravelApp> {
  late TravelAppRouter _appRouter;
  late final SupabaseClient _supabaseClient;

  @override
  void initState() {
    _supabaseClient = getIt<SupabaseClient>();

    _appRouter = TravelAppRouter(
      supabaseClient: _supabaseClient,
      // authRepository: authRepository,
      // profileRepository: profileRepository,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      themeMode: ThemeMode.light,
      theme: light,
      darkTheme: dark,
      routerConfig: _appRouter.config(),
      builder: (context, child) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        behavior: HitTestBehavior.opaque,
        child: child,
      ),
    );
  }
}
