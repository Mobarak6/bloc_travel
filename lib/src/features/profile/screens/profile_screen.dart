import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_app/app_di.dart';
import 'package:travel_app/l10n/l10n.dart';
import 'package:travel_app/src/data/models/profile_model.dart';
import 'package:travel_app/src/features/profile/managers/profile_bloc.dart';
import 'package:travel_app/src/features/profile/widgets/profile_content_widget.dart';
import 'package:travel_app/src/features/profile/widgets/profile_error_widget.dart';
import 'package:travel_app/src/features/profile/widgets/profile_loading_widget.dart';
import 'package:travel_app/src/shared/extensions/overlay_extensions.dart';
import 'package:travel_app/src/shared/utils/dimensions.dart';
import 'package:travel_app/src/shared/utils/styles.dart';
import 'package:travel_app/src/shared/utils/validate_check.dart';
import 'package:travel_app/src/shared/widgets/custom_app_bar.dart';
import 'package:travel_app/src/shared/widgets/custom_text_field_widget.dart';

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
                loaded: (profile) => _buildProfileContent(profile, false, null),
                updating: () =>
                    _buildProfileContent(_getCurrentProfile(), true, null),
                updated: (profile) =>
                    _buildProfileContent(profile, false, null),
                imageSelected: (profile, selectedImagePath) =>
                    _buildProfileContent(profile, false, selectedImagePath),
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

  Widget _buildProfileContent(
    Profile profile,
    bool isLoading,
    String? selectedImagePath,
  ) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            _buildAvatarSection(profile, selectedImagePath),
            const SizedBox(height: Dimensions.spacingExtraLarge),

            // Profile Info Section
            _buildProfileInfoSection(profile),
            const SizedBox(height: Dimensions.spacingExtraLarge),

            // Update Button
            _buildUpdateButton(isLoading, selectedImagePath),

            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarSection(Profile profile, String? selectedImagePath) {
    return Column(
      children: [
        GestureDetector(
          onTap: _pickImage,
          child: Stack(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: selectedImagePath != null
                    ? AssetImage(selectedImagePath)
                    : (profile.avatarUrl != null
                          ? NetworkImage(profile.avatarUrl!) as ImageProvider
                          : const AssetImage(
                              'assets/images/profile_place_holder.png',
                            )),
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

  Widget _buildProfileInfoSection(Profile profile) {
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
          controller: _usernameController,
          focusNode: _usernameFocus,
          inputType: TextInputType.text,
          prefixIcon: Icons.person,
          validator: (value) => ValidateCheck.validateEmptyText(
            context,
            value?.trim(),
            context.l10n.pleaseEnterUsername,
          ),
        ),
        const SizedBox(height: Dimensions.spacingLarge),

        // Email Field (Read-only)
        CustomTextFieldWidget(
          labelText: context.l10n.email,
          hintText: profile.email ?? '',
          controller: TextEditingController(text: profile.email ?? ''),
          focusNode: FocusNode()..unfocus(),
          inputType: TextInputType.emailAddress,
          prefixIcon: Icons.email,
        ),
        const SizedBox(height: Dimensions.spacingLarge),

        // Role Field (Read-only)
        CustomTextFieldWidget(
          labelText: context.l10n.role,
          hintText: profile.role?.name.toUpperCase() ?? '',
          controller: TextEditingController(
            text: profile.role?.name.toUpperCase() ?? '',
          ),
          focusNode: FocusNode()..unfocus(),
          inputType: TextInputType.text,
          prefixIcon: Icons.admin_panel_settings,
        ),
        const SizedBox(height: Dimensions.spacingLarge),

        // Created At Field (Read-only)
        CustomTextFieldWidget(
          labelText: context.l10n.createdAt,
          hintText: _formatDate(profile.createdAt),
          controller: TextEditingController(
            text: _formatDate(profile.createdAt),
          ),
          focusNode: FocusNode()..unfocus(),
          inputType: TextInputType.text,
          prefixIcon: Icons.calendar_today,
        ),
      ],
    );
  }

  Widget _buildUpdateButton(bool isLoading, String? selectedImagePath) {
    return SizedBox(
      width: double.maxFinite,
      height: 50,
      child: ElevatedButton(
        onPressed: isLoading ? null : () => _updateProfile(selectedImagePath),
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

  Profile _getCurrentProfile() {
    return Profile.mockProfile();
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

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      // Use BLoC instead of setState
      _profileBloc.add(ProfileEvent.selectImage(imagePath: image.path));

      if (mounted) {
        context.showSnackBar(context.l10n.imageSelected);
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
