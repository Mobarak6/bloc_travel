import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:travel_app/src/shared/utils/app_constants.dart';
import 'package:travel_app/src/shared/utils/user_type.dart';

@lazySingleton
class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
    required UserType userType,
  }) async {
    await _supabase.auth.signUp(
      email: email,
      password: password,
      data: {
        'username': name,
        'role': userType.name,
      },
      emailRedirectTo: AppConstants.authRedirectLink,
    );
  }

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    return _supabase.auth.signInWithPassword(email: email, password: password);
  }
}
