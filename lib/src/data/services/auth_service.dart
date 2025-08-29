import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:travel_app/src/shared/utils/app_constants.dart';

@lazySingleton
class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required String name,
  }) async {
    await _supabase.auth.signUp(
      email: email,
      password: password,
      data: {
        'username': name,
        'role': 'user',
      },
      emailRedirectTo: AppConstants.authRedirectLink,
    );
  }

  Future<AuthResponse> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return _supabase.auth.signInWithPassword(password: password);
  }
}
