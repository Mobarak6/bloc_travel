import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_app/app_di.dart';
import 'package:travel_app/l10n/l10n.dart';
import 'package:travel_app/src/data/models/profile_model.dart';
import 'package:travel_app/src/features/profile/managers/profile_bloc.dart';
import 'package:travel_app/src/features/profile/managers/profile_ops_bloc.dart';
import 'package:travel_app/src/features/profile/widgets/profile_avatar_widget.dart';
import 'package:travel_app/src/features/profile/widgets/profile_error_widget.dart';
import 'package:travel_app/src/features/profile/widgets/profile_info_section_widget.dart';
import 'package:travel_app/src/shared/extensions/overlay_extensions.dart';
import 'package:travel_app/src/shared/utils/dimensions.dart';
import 'package:travel_app/src/shared/utils/styles.dart';
import 'package:travel_app/src/shared/widgets/custom_app_bar.dart';

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
  late ProfileOpsBloc _profileOpsBloc;

  @override
  void initState() {
    super.initState();
    _profileBloc = context.read();
    _profileOpsBloc = getIt<ProfileOpsBloc>();
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
    return Scaffold(
        appBar: CustomAppBar(title: context.l10n.profile),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.spacingMedium,
          ),
          child: BlocConsumer<ProfileBloc, ProfileState>(
            bloc: _profileBloc,
            listener: (context, state){
              state.whenOrNull(
               loaded: (profile){
                 _usernameController.text = profile.username ?? '';
               }
              );
            },
            builder: (context, state) {

              //use this to show skeleton
              // return Skeletonizer(
              //   enabled: state.maybeWhen(
              //     orElse: ()=> false, loading: ()=> true, initial: ()=> true,
              //   ),
              //   child: state.maybeWhen(orElse: () {
              //     return Text('');
              //   }),
              // );

              return state.when(
                initial: () => const Center(child: CircularProgressIndicator()),
                loading: () => const Center(child: CircularProgressIndicator()),
                loaded: (profile) =>
                    BlocConsumer<ProfileOpsBloc, ProfileOpsState>(
                      bloc: _profileOpsBloc,
                      listener: (context, opsState) {
                        opsState.whenOrNull(
                          updated: (profile) {
                            context.showSnackBar(context.l10n.profileUpdated, isError: false);
                            _profileBloc.add(const ProfileEvent.loadProfile());
                          },
                          error: (message){
                            context.showSnackBar(message);
                          }

                        );
                      },
                      builder: (context, opsState) {
                        final isLoading = opsState
                            .whenOrNull(updating: ()=> true) ?? false;

                        return _ProfileContentWidget(
                          profile: profile,
                          usernameController: _usernameController,
                          usernameFocus: _usernameFocus,
                          formKey: _formKey,
                          onPickImage: _pickImage,
                          onUpdateProfile: _updateProfile,
                          isLoading: isLoading,
                          selectedImagePath: opsState.whenOrNull(
                            imageSelected: (selectedImagePath) =>
                            selectedImagePath,
                          ),
                        );
                      },
                    ),
                error: (message) => ProfileErrorWidget(
                  message: message,
                  onRetry: () => _profileBloc.add(const ProfileEvent.loadProfile()),
                ),
              );
            },
          ),
        ),
      );
  }

  Future<void> _pickImage() async {
    try {

      final picker = ImagePicker();
      final image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
        maxWidth: 800,
        maxHeight: 800,
      );

      if (image != null) {
        // Get current profile from ProfileBloc state

        _profileBloc.state.whenOrNull(
          loaded: (profile) {
            _profileOpsBloc.add(
              ProfileOpsEvent.selectImage(
                imagePath: image.path,
              ),
            );
          },
        );

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

      _profileOpsBloc.add(
        ProfileOpsEvent.updateProfile(
          username: username,
          avatarUrl: selectedImagePath,
        ),
      );
    }
  }
}

class _ProfileContentWidget extends StatelessWidget {
  const _ProfileContentWidget({
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),

            // Avatar Section
            ProfileAvatarWidget(
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
            SizedBox(
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
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          ],
        ),
      ),
    );
  }
}


