import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_app/app_di.dart';
import 'package:travel_app/l10n/l10n.dart';
import 'package:travel_app/src/data/models/profile_model.dart';
import 'package:travel_app/src/features/profile/managers/profile_bloc.dart';

import 'package:travel_app/src/features/profile/widgets/profile_error_widget.dart';
import 'package:travel_app/src/features/profile/widgets/profile_loading_widget.dart';
import 'package:travel_app/src/shared/assets/assets.gen.dart';
import 'package:travel_app/src/shared/extensions/overlay_extensions.dart';
import 'package:travel_app/src/shared/utils/dimensions.dart';
import 'package:travel_app/src/shared/utils/styles.dart';
import 'package:travel_app/src/shared/utils/validate_check.dart';
import 'package:travel_app/src/shared/widgets/custom_app_bar.dart';
import 'package:travel_app/src/shared/widgets/custom_image_widget.dart';
import 'package:travel_app/src/shared/widgets/custom_text_field_widget.dart';
import 'dart:io';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FocusNode _usernameFocus = FocusNode();
  final TextEditingController _usernameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late ProfileBloc _profileBloc;

  @override
  void initState() {
    super.initState();
    _profileBloc = getIt<ProfileBloc>();
    _profileBloc.add(const ProfileEvent.loadProfile());
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _usernameFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _profileBloc,
      child: Scaffold(
        appBar: CustomAppBar(title: context.l10n.profile),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.spacingMedium,
          ),
          child: BlocConsumer<ProfileBloc, ProfileState>(
            listener: (context, state) {
              state.whenOrNull(
                loaded: (profile) {
                  _usernameController.text = profile.username ?? '';
                },
                updated: (profile) {
                  _usernameController.text = profile.username ?? '';
                  context.showSnackBar(context.l10n.profileUpdated);
                },
                error: (message) {
                  context.showSnackBar(message);
                },
              );
            },
            builder: (context, state) {
              return state.when(
                initial: () => const ProfileLoadingWidget(),
                loading: () => const ProfileLoadingWidget(),
                loaded: (profile) => ProfileContentWidget(
                  profile: profile,
                  usernameController: _usernameController,
                  usernameFocus: _usernameFocus,
                  formKey: _formKey,
                  onPickImage: _pickImage,
                  onUpdateProfile: _updateProfile,
                  isLoading: false,
                ),
                updating: () => ProfileContentWidget(
                  profile: Profile.mockProfile(),
                  usernameController: _usernameController,
                  usernameFocus: _usernameFocus,
                  formKey: _formKey,
                  onPickImage: _pickImage,
                  onUpdateProfile: _updateProfile,
                  isLoading: true,
                ),
                updated: (profile) => ProfileContentWidget(
                  profile: profile,
                  usernameController: _usernameController,
                  usernameFocus: _usernameFocus,
                  formKey: _formKey,
                  onPickImage: _pickImage,
                  onUpdateProfile: _updateProfile,
                  isLoading: false,
                ),
                imageSelected: (profile, selectedImagePath) =>
                    ProfileContentWidget(
                      profile: profile,
                      usernameController: _usernameController,
                      usernameFocus: _usernameFocus,
                      formKey: _formKey,
                      onPickImage: _pickImage,
                      onUpdateProfile: _updateProfile,
                      isLoading: false,
                      selectedImagePath: selectedImagePath,
                    ),
                error: (message) => ProfileErrorWidget(
                  message: message,
                  onRetry: () =>
                      _profileBloc.add(const ProfileEvent.loadProfile()),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    try {
      // Show loading indicator
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
                const SizedBox(width: 12),
                Text(context.l10n.loadingProfile),
              ],
            ),
            duration: const Duration(seconds: 1),
          ),
        );
      }

      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
        maxWidth: 800,
        maxHeight: 800,
      );

      if (image != null) {
        _profileBloc.add(ProfileEvent.selectImage(imagePath: image.path));

        if (mounted) {
          context.showSnackBar(context.l10n.imageSelected);
        }
      }
    } catch (e) {
      if (mounted) {
        context.showSnackBar('Failed to select image. Please try again.');
      }
    }
  }

  void _updateProfile(String? selectedImagePath) {
    if (_formKey.currentState?.validate() ?? false) {
      final username = _usernameController.text.trim();

      _profileBloc.add(
        ProfileEvent.updateProfile(
          username: username,
          avatarUrl: selectedImagePath,
        ),
      );
    }
  }
}

class ProfileContentWidget extends StatelessWidget {
  const ProfileContentWidget({
    required this.profile,
    required this.usernameController,
    required this.usernameFocus,
    required this.formKey,
    required this.onPickImage,
    required this.onUpdateProfile,
    required this.isLoading,
    this.selectedImagePath,
    super.key,
  });

  final Profile profile;
  final TextEditingController usernameController;
  final FocusNode usernameFocus;
  final GlobalKey<FormState> formKey;
  final VoidCallback onPickImage;
  final Function(String?) onUpdateProfile;
  final bool isLoading;
  final String? selectedImagePath;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: Dimensions.spacingLarge),

            // Profile Header
            Text(
              context.l10n.profileInformation,
              style: robotoBold.copyWith(
                fontSize: Dimensions.fontSizeDisplay,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: Dimensions.spacingExtraSmall),

            Text(
              context.l10n.profileInformation,
              style: robotoRegular.copyWith(
                fontSize: Dimensions.fontSizeLarge,
                color: Theme.of(context).hintColor,
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.05),

            // Avatar Section
            AvatarSectionWidget(
              profile: profile,
              selectedImagePath: selectedImagePath,
              onPickImage: onPickImage,
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
            UpdateButtonWidget(
              isLoading: isLoading,
              selectedImagePath: selectedImagePath,
              onUpdateProfile: onUpdateProfile,
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          ],
        ),
      ),
    );
  }
}

class AvatarSectionWidget extends StatelessWidget {
  const AvatarSectionWidget({
    required this.profile,
    this.selectedImagePath,
    required this.onPickImage,
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
      return const AssetImage('assets/images/profile_place_holder.png');
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
          hintText: _formatDate(profile.createdAt),
          controller: TextEditingController(
            text: _formatDate(profile.createdAt),
          ),
          focusNode: FocusNode()..unfocus(),
          inputType: TextInputType.text,
          prefixIcon: Icons.calendar_today,
          enabled: false,
        ),
      ],
    );
  }

  String _formatDate(String? dateString) {
    if (dateString == null) return '';
    try {
      final date = DateTime.parse(dateString);
      return '${date.day}/${date.month}/${date.year}';
    } catch (e) {
      return dateString;
    }
  }
}

class UpdateButtonWidget extends StatelessWidget {
  const UpdateButtonWidget({
    required this.isLoading,
    this.selectedImagePath,
    required this.onUpdateProfile,
    super.key,
  });

  final bool isLoading;
  final String? selectedImagePath;
  final Function(String?) onUpdateProfile;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 50,
      child: ElevatedButton(
        onPressed: isLoading ? null : () => onUpdateProfile(selectedImagePath),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
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
                context.l10n.updateProfile,
                style: robotoMedium.copyWith(
                  fontSize: Dimensions.fontSizeMedium,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
