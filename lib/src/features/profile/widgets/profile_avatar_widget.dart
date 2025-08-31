import 'dart:io';
import 'package:flutter/material.dart';
import 'package:travel_app/l10n/l10n.dart';
import 'package:travel_app/src/data/models/profile_model.dart';
import 'package:travel_app/src/shared/assets/assets.gen.dart';
import 'package:travel_app/src/shared/utils/dimensions.dart';
import 'package:travel_app/src/shared/utils/styles.dart';
import 'package:travel_app/src/shared/widgets/custom_image_widget.dart';


class ProfileAvatarWidget extends StatelessWidget {
  const ProfileAvatarWidget({
    required this.profile,
    required this.onPickImage,
    this.selectedImagePath,
    super.key,
  });

  final Profile profile;
  final String? selectedImagePath;
  final VoidCallback onPickImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPickImage,
          child: Stack(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: _getAvatarImage(profile, selectedImagePath),
                child: _getAvatarChild(profile, selectedImagePath),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: Dimensions.spacingMedium),
        Text(
          context.l10n.tapToChangeAvatar,
          style: robotoRegular.copyWith(
            fontSize: Dimensions.fontSizeSmall,
            color: Theme.of(context).hintColor,
          ),
        ),
      ],
    );
  }

  ImageProvider? _getAvatarImage(Profile profile, String? selectedImagePath) {
    if (selectedImagePath != null) {
      // Selected image from gallery - use FileImage for file paths
      return FileImage(File(selectedImagePath));
    } else if (profile.avatarUrl != null) {
      // Network image - return null to use child widget
      return null;
    } else {
      // Default placeholder
      return AssetImage(Assets.images.profilePlaceHolder.path);
    }
  }

  Widget? _getAvatarChild(Profile profile, String? selectedImagePath) {
    if (selectedImagePath != null) {
      // Selected image is handled by backgroundImage
      return null;
    } else if (profile.avatarUrl != null) {
      // Network image - use CustomImageWidget
      return ClipOval(
        child: CustomImageWidget(
          image: profile.avatarUrl!,
          height: 120,
          width: 120,
          placeholder: Assets.images.profilePlaceHolder.path,
        ),
      );
    } else {
      // No image - no child needed
      return null;
    }
  }
}
