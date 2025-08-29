import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/app_di.dart';
import 'package:travel_app/l10n/l10n.dart';
import 'package:travel_app/src/features/auth/managers/auth_bloc.dart';
import 'package:travel_app/src/shared/utils/dimensions.dart';
import 'package:travel_app/src/shared/utils/styles.dart';
import 'package:travel_app/src/shared/widgets/custom_app_bar.dart';
import 'package:travel_app/src/travel_ap_router.gr.dart';

@RoutePage()
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();
  late AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = getIt<AuthBloc>();
  }

  @override
  void dispose() {
    _nameFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _authBloc,
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              context.router.replace(const HomeRoute());
            },
            error: (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(e?.toString() ?? 'Registration failed')),
              );
            },
          );
        },
        builder: (context, state) {
          final isLoading = state.whenOrNull(inProgress: () => true) ?? false;

          return Scaffold(
            appBar: CustomAppBar(title: context.l10n.registration),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.spacingMedium,
              ),
              child: Center(
                child: Form(
                  key: _signUpKey,
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
                          context.l10n.signUpToAccessYourAccount,
                          style: robotoRegular.copyWith(
                            fontSize: Dimensions.fontSizeLarge,
                            color: Theme.of(context).hintColor,
                          ),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                        ),

                        CustomTextField(
                          labelText: context.l10n.fullName,
                          hintText: context.l10n.enterFullName,
                          controller: _nameController,
                          focusNode: _nameFocus,
                          nextFocus: _emailFocus,
                          inputType: TextInputType.text,
                          prefixIcon: Icons.person,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return context.l10n.pleaseEnterYourFullName;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: Dimensions.spacingExtraLarge),

                        CustomTextField(
                          labelText: context.l10n.email,
                          hintText: context.l10n.enterEmailAddress,
                          controller: _emailController,
                          focusNode: _emailFocus,
                          nextFocus: _passwordFocus,
                          inputType: TextInputType.emailAddress,
                          prefixIcon: Icons.email,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return context.l10n.pleaseEnterYourEmail;
                            }
                            if (!RegExp(
                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                            ).hasMatch(value)) {
                              return context.l10n.pleaseEnterAValidEmail;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: Dimensions.spacingExtraLarge),

                        CustomTextField(
                          labelText: context.l10n.password,
                          hintText: context.l10n.enterPasswordMin8Characters,
                          controller: _passwordController,
                          focusNode: _passwordFocus,
                          nextFocus: _confirmPasswordFocus,
                          inputType: TextInputType.visiblePassword,
                          prefixIcon: Icons.lock,
                          isPassword: true,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return context.l10n.pleaseEnterAPassword;
                            }
                            if (value.length < 8) {
                              return context
                                  .l10n
                                  .passwordMustBeAtLeast8Characters;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: Dimensions.spacingExtraLarge),

                        CustomTextField(
                          labelText: context.l10n.confirmPassword,
                          hintText: context.l10n.confirmYourPassword,
                          controller: _confirmPasswordController,
                          focusNode: _confirmPasswordFocus,
                          inputType: TextInputType.visiblePassword,
                          prefixIcon: Icons.lock,
                          isPassword: true,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return context.l10n.pleaseConfirmYourPassword;
                            }
                            if (value != _passwordController.text.trim()) {
                              return context.l10n.passwordsDoNotMatch;
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: Dimensions.spacingExtraLarge),

                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: isLoading ? null : _signUp,
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
                                    context.l10n.signUp,
                                    style: robotoMedium.copyWith(
                                      fontSize: Dimensions.fontSizeMedium,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ),

                        const SizedBox(height: Dimensions.spacingSmall),

                        TextButton(
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          onPressed: () {
                            context.router.push(const LoginRoute());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                context.l10n.alreadyHaveAnAccount,
                                style: robotoRegular.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.color
                                      ?.withOpacity(0.7),
                                ),
                              ),
                              Text(
                                context.l10n.loginHere,
                                style: robotoRegular.copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _signUp() {
    if (_signUpKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      _authBloc.add(
        AuthEvent.signUpWithEmailAndPassword(
          email: email,
          password: password,
        ),
      );
    }
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.labelText,
    required this.hintText,
    required this.controller,
    required this.focusNode,
    required this.inputType,
    required this.prefixIcon,
    super.key,
    this.nextFocus,
    this.isPassword = false,
    this.validator,
  });

  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final IconData prefixIcon;
  final bool isPassword;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: inputType,
      obscureText: isPassword,
      textInputAction: nextFocus != null
          ? TextInputAction.next
          : TextInputAction.done,
      onFieldSubmitted: nextFocus != null
          ? (_) => nextFocus!.requestFocus()
          : null,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
          borderSide: BorderSide(color: Theme.of(context).dividerColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Dimensions.spacingMedium,
          vertical: Dimensions.spacingSmall,
        ),
      ),
    );
  }
}
