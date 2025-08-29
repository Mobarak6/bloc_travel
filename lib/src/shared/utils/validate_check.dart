import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_app/l10n/l10n.dart';

class ValidateCheck {
  static String? validateEmail(BuildContext context, String? value) {
    const pattern =
        r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final kEmailValid = RegExp(pattern);
    final isValid = kEmailValid.hasMatch(value.toString());
    if (value!.isEmpty) {
      return context.l10n.pleaseEnterYourEmail;
    } else if (!isValid) {
      return context.l10n.pleaseEnterAValidEmail;
    }
    return null;
  }

  static String? validateEmptyText(
    BuildContext context,
    String? value,
    String? message,
  ) {
    if (value == null || value.isEmpty) {
      // Pass a localized message from callers when possible
      return message ?? context.l10n.this_field_is_required;
    }
    return null;
  }

  static String? validatePhone(
    BuildContext context,
    String? value,
    String? message,
  ) {
    if (value == null || value.isEmpty) {
      return message ?? message ?? context.l10n.this_field_is_required;
    }
    return null;
  }

  static String? validatePassword(
    BuildContext context,
    String? value,
    String? message,
  ) {
    if (value == null || value.isEmpty) {
      return message ?? context.l10n.pleaseEnterAPassword;
    } else if (value.length < 8) {
      return context.l10n.passwordMustBeAtLeast8Characters;
    }
    return null;
  }

  static String? validateConfirmPassword(
    BuildContext context,
    String? value,
    String? password,
  ) {
    if (value == null || value.isEmpty) {
      return context.l10n.pleaseConfirmYourPassword;
    } else if (value != password) {
      return context.l10n.passwordsDoNotMatch;
    }
    return null;
  }

  static String getValidPhone(
    String number,
    String countryCode, {
    bool isRemoveZero = false,
  }) {
    // Normalize inputs
    final digitsOnly = number.replaceAll(RegExp(r'\D'), '');
    final ccDigits = countryCode.replaceAll(RegExp(r'\D'), '');

    // Remove country code from the beginning if present
    String local = digitsOnly.startsWith(ccDigits)
        ? digitsOnly.substring(ccDigits.length)
        : digitsOnly;

    // Trim leading zeros as needed
    if (isRemoveZero) {
      local = local.replaceFirst(RegExp(r'^0+'), '');
    } else {
      local = local.replaceFirst(RegExp(r'^0+'), '');
      local = local.isEmpty ? '' : '0$local';
    }

    if (kDebugMode) {
      print('Phone Number : $local');
    }
    return local;
  }
}
