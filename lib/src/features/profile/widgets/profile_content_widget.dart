import 'package:flutter/material.dart';
import 'package:travel_app/src/data/models/profile_model.dart';
import 'package:travel_app/src/shared/widgets/custom_avatar_widget.dart';
import 'package:travel_app/src/features/profile/widgets/profile_info_section_widget.dart';
import 'package:travel_app/src/features/profile/widgets/profile_update_button_widget.dart';
import 'package:travel_app/src/shared/utils/dimensions.dart';

class ProfileContentWidget extends StatelessWidget {
  const ProfileContentWidget({
    required this.profile,
    required this.usernameController,
    required this.usernameFocus,
    required this.onImagePicked,
    required this.onUpdateProfile,
    required this.isLoading,
    this.localImagePath,
    super.key,
  });

  final Profile profile;
  final TextEditingController usernameController;
  final FocusNode usernameFocus;
  final VoidCallback onImagePicked;
  final VoidCallback onUpdateProfile;
  final bool isLoading;
  final String? localImagePath;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Dimensions.spacingMedium),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar Section
            CustomAvatarWidget(
              username: profile.username ?? '',
              avatarUrl: profile.avatarUrl,
              localImagePath: localImagePath,
              onImagePicked: onImagePicked,
            ),
            const SizedBox(height: Dimensions.spacingExtraLarge),

            // Profile Info Section
            ProfileInfoSectionWidget(
              profile: profile,
              usernameController: usernameController,
              usernameFocus: usernameFocus,
            ),
            const SizedBox(height: Dimensions.spacingExtraLarge),

            // Update Button
            ProfileUpdateButtonWidget(
              onPressed: onUpdateProfile,
              isLoading: isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
