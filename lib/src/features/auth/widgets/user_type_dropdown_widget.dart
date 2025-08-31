import 'package:flutter/material.dart';
import 'package:travel_app/l10n/l10n.dart';
import 'package:travel_app/src/data/models/profile_model.dart';

import 'package:travel_app/src/shared/utils/dimensions.dart';
import 'package:travel_app/src/shared/utils/styles.dart';

class UserTypeDropdownWidget extends StatelessWidget {
  const UserTypeDropdownWidget({
    required this.value,
    required this.onChanged,
    super.key,
    this.validator,
  });

  final UserRole? value;
  final ValueChanged<UserRole?> onChanged;
  final String? Function(UserRole?)? validator;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<UserRole>(
      value: value,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        labelText: context.l10n.userType,
        hintText: context.l10n.selectUserType,
        // prefixIcon: const Icon(Icons.person_outline),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
          borderSide: BorderSide(
            color: Theme.of(context).hintColor.withValues(alpha: 0.3),
          ),
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
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Dimensions.spacingMedium,
          vertical: Dimensions.spacingSmall,
        ),
      ),
      items: UserRole.values.map((UserRole userRole) {
        return DropdownMenuItem<UserRole>(
          value: userRole,
          child: Row(
            children: [
              Icon(
                userRole == UserRole.admin
                    ? Icons.admin_panel_settings
                    : Icons.person,
                color: Theme.of(context).primaryColor,
                size: Dimensions.spacingDefault,
              ),
              const SizedBox(width: Dimensions.spacingSmall),
              Text(
                userRole.name,
                style: robotoMedium.copyWith(
                  fontSize: Dimensions.fontSizeMedium,
                ),
              ),
            ],
          ),
        );
      }).toList(),
      selectedItemBuilder: (BuildContext context) {
        return UserRole.values.map<Widget>((UserRole userRole) {
          return Row(
            children: [
              Icon(
                userRole == UserRole.admin
                    ? Icons.admin_panel_settings
                    : Icons.person,
                color: Theme.of(context).primaryColor,
                size: Dimensions.spacingDefault,
              ),
              const SizedBox(width: Dimensions.spacingSmall),
              Text(
                userRole.name,
                style: robotoMedium.copyWith(
                  fontSize: Dimensions.fontSizeMedium,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          );
        }).toList();
      },
    );
  }
}
