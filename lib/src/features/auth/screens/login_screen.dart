import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:travel_app/app_di.dart';
import 'package:travel_app/l10n/l10n.dart';
import 'package:travel_app/src/features/auth/managers/auth_bloc.dart';
import 'package:travel_app/src/shared/extensions/overlay_extensions.dart';
import 'package:travel_app/src/shared/utils/dimensions.dart';
import 'package:travel_app/src/shared/utils/styles.dart';
import 'package:travel_app/src/shared/utils/validate_check.dart';
import 'package:travel_app/src/shared/widgets/custom_app_bar.dart';
import 'package:travel_app/src/shared/widgets/custom_text_field_widget.dart';
import 'package:travel_app/src/travel_ap_router.gr.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
  late AuthBloc _authBloc;

  @override
  void dispose() {
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _authBloc = getIt<AuthBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _authBloc,
      child: Scaffold(
        appBar: CustomAppBar(title: context.l10n.login),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.spacingMedium,
          ),
          child: Center(child: Form(
            key: _loginKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.l10n.welcome,
                    style: robotoBold.copyWith(
                      fontSize: Dimensions.fontSizeDisplay,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: Dimensions.spacingExtraSmall),

                  Text(
                    context.l10n.loginToAccessYourAccount,
                    style: robotoRegular.copyWith(
                      fontSize: Dimensions.fontSizeLarge,
                      color: Theme.of(context).hintColor,
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.07),

                  CustomTextFieldWidget(
                    labelText: context.l10n.email,
                    hintText: context.l10n.enterEmailAddress,
                    controller: _emailController,
                    focusNode: _emailFocus,
                    nextFocus: _passwordFocus,
                    inputType: TextInputType.emailAddress,
                    prefixIcon: Icons.email,
                    validator: (value) => ValidateCheck.validateEmail(
                      context,
                      value?.trim(),
                    ),
                  ),
                  const SizedBox(height: Dimensions.spacingExtraLarge),

                  CustomTextFieldWidget(
                    labelText: context.l10n.password,
                    hintText: context.l10n.enterPasswordMin8Characters,
                    controller: _passwordController,
                    focusNode: _passwordFocus,
                    inputType: TextInputType.visiblePassword,
                    prefixIcon: Icons.lock,
                    isPassword: true,
                    validator: (value) => ValidateCheck.validatePassword(
                      context,
                      value?.trim(),
                      null,
                    ),
                  ),

                  const SizedBox(height: Dimensions.spacingExtraLarge),

                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        success: () =>
                            context.router.replace(const HomeRoute()),
                        error: (e) {
                          context.showSnackBar(e.toString());
                        },
                      );
                    },
                    builder: (context, state) {
                      final isLoading =
                          state.whenOrNull(inProgress:() => true) ?? false;

                      return SizedBox(
                        width: double.maxFinite,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: isLoading ? null : _submit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                Dimensions.radiusDefault,
                              ),
                            ),
                          ),
                          child: isLoading
                              ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                              : Text(
                            context.l10n.login,
                            style: robotoMedium.copyWith(
                              fontSize: Dimensions.fontSizeMedium,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: Dimensions.spacingSmall),

                  TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () {
                      context.router.push(const RegistrationRoute());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          context.l10n.dontHaveAnAccount,
                          style: robotoRegular.copyWith(
                            color: Theme.of(
                              context,
                            ).textTheme.bodySmall?.color?.withValues(alpha: 0.7),
                          ),
                        ),
                        Text(
                          context.l10n.signUpHere,
                          style: robotoRegular.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }

  void _submit() {
    if (_loginKey.currentState?.validate() ?? false) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      _authBloc.add(AuthEvent.signIn(
        email: email,
        password: password,
      ));
    }
  }
}
