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
import 'package:travel_app/src/shared/widgets/custom_app_bar.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final FocusNode _usernameFocus = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late ProfileBloc _profileBloc;
  String? _selectedImagePath;

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
        body: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            state.whenOrNull(
              loaded: (profile) {
                _usernameController.text = profile.username ?? '';
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
                onImagePicked: _pickImage,
                onUpdateProfile: _updateProfile,
                isLoading: false,
                localImagePath: _selectedImagePath,
              ),
              updating: () => ProfileContentWidget(
                profile: _getCurrentProfile(),
                usernameController: _usernameController,
                usernameFocus: _usernameFocus,
                onImagePicked: _pickImage,
                onUpdateProfile: _updateProfile,
                isLoading: true,
                localImagePath: _selectedImagePath,
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
    );
  }

  Profile _getCurrentProfile() {
    // Return mock profile from the model
    return Profile.mockProfile();
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImagePath = image.path;
      });

      // Show success message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.l10n.imageSelected),
            backgroundColor: Colors.blue,
          ),
        );
      }
    }
  }

  void _updateProfile() {
    if (_formKey.currentState?.validate() ?? false) {
      _profileBloc.add(
        ProfileEvent.updateProfile(
          username: _usernameController.text.trim(),
          avatarUrl: _selectedImagePath, // Pass the selected image path
        ),
      );

      // Show success message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.l10n.profileUpdated),
            backgroundColor: Colors.green,
          ),
        );
      }
    }
  }
}
