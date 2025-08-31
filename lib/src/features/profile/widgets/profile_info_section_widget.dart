import 'package:flutter/material.dart';
import 'package:travel_app/l10n/l10n.dart';
import 'package:travel_app/src/data/models/profile_model.dart';
import 'package:travel_app/src/shared/utils/date_converter.dart';
import 'package:travel_app/src/shared/utils/dimensions.dart';
import 'package:travel_app/src/shared/utils/styles.dart';
import 'package:travel_app/src/shared/utils/validate_check.dart';
import 'package:travel_app/src/shared/widgets/custom_text_field_widget.dart';

class ProfileInfoSectionWidget extends StatelessWidget {
  const ProfileInfoSectionWidget({
    required this.profile,
    required this.usernameController,
    required this.usernameFocus,
    super.key,
  });

  final Profile profile;
  final TextEditingController usernameController;
  final FocusNode usernameFocus;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.profileInformation,
          style: robotoBold.copyWith(
            fontSize: Dimensions.fontSizeLarge,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: Dimensions.spacingMedium),

        // Username Field (Editable)
        CustomTextFieldWidget(
          labelText: context.l10n.username,
          hintText: context.l10n.enterUsername,
          controller: usernameController,
          focusNode: usernameFocus,
          inputType: TextInputType.text,
          prefixIcon: Icons.person,
          validator: (value) => ValidateCheck.validateEmptyText(
            context,
            value?.trim(),
            context.l10n.pleaseEnterUsername,
          ),
        ),
        const SizedBox(height: Dimensions.spacingLarge),

        // Email Field (Read-only - Disabled)
        CustomTextFieldWidget(
          labelText: context.l10n.email,
          hintText: profile.email ?? '',
          controller: TextEditingController(text: profile.email ?? ''),
          focusNode: FocusNode()..unfocus(),
          inputType: TextInputType.emailAddress,
          prefixIcon: Icons.email,
          enabled: false,
        ),
        const SizedBox(height: Dimensions.spacingLarge),

        // Role Field (Read-only - Disabled)
        CustomTextFieldWidget(
          labelText: context.l10n.role,
          hintText: profile.role?.name.toUpperCase() ?? '',
          controller: TextEditingController(
            text: profile.role?.name.toUpperCase() ?? '',
          ),
          focusNode: FocusNode()..unfocus(),
          inputType: TextInputType.text,
          prefixIcon: Icons.admin_panel_settings,
          enabled: false,
        ),
        const SizedBox(height: Dimensions.spacingLarge),

        // Created At Field (Read-only - Disabled)
        CustomTextFieldWidget(
          labelText: context.l10n.createdAt,
          hintText: DateConverter.isoToFormattedString(profile.createdAt ?? ''),
          controller: TextEditingController(
            text: DateConverter.isoToFormattedString(profile.createdAt ?? ''),
          ),
          focusNode: FocusNode()..unfocus(),
          inputType: TextInputType.text,
          prefixIcon: Icons.calendar_today,
          enabled: false,
        ),
      ],
    );
  }

}
