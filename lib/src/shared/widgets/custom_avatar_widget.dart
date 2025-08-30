import 'dart:io';
import 'package:flutter/material.dart';
import 'package:travel_app/l10n/l10n.dart';
import 'package:travel_app/src/shared/utils/dimensions.dart';
import 'package:travel_app/src/shared/utils/styles.dart';
import 'package:travel_app/src/shared/widgets/custom_image_widget.dart';

class CustomAvatarWidget extends StatelessWidget {
  const CustomAvatarWidget({
    required this.username,
    this.avatarUrl,
    this.localImagePath,
    required this.onImagePicked,
    super.key,
  });

  final String username;
  final String? avatarUrl;
  final String? localImagePath;
  final VoidCallback onImagePicked;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: _getBackgroundImage(),
              child: _getAvatarChild(),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: IconButton(
                  icon: const Icon(Icons.camera_alt, color: Colors.white),
                  onPressed: onImagePicked,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: Dimensions.spacingSmall),
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

  ImageProvider? _getBackgroundImage() {
    if (localImagePath != null) {
      return FileImage(File(localImagePath!));
    } else if (avatarUrl != null) {
      return NetworkImage(avatarUrl!);
    }
    return null;
  }

  Widget? _getAvatarChild() {
    if (localImagePath != null || avatarUrl != null) {
      return null;
    }
    return Text(
      (username.isNotEmpty ? username[0] : 'U').toUpperCase(),
      style: robotoBold.copyWith(
        fontSize: 40,
        color: Colors.white,
      ),
    );
  }
}
