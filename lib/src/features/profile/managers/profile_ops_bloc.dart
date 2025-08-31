import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:travel_app/src/data/models/profile_model.dart';

part 'profile_ops_event.dart';
part 'profile_ops_state.dart';
part 'profile_ops_bloc.freezed.dart';

@injectable
class ProfileOpsBloc extends Bloc<ProfileOpsEvent, ProfileOpsState> {
  ProfileOpsBloc() : super(const ProfileOpsState.initial()) {
    on<_SelectImage>(_onSelectImage);
  }

  void _onSelectImage(
    _SelectImage event,
    Emitter<ProfileOpsState> emit,
  ) {
    emit(
      ProfileOpsState.imageSelected(
        profile: event.profile,
        selectedImagePath: event.imagePath,
      ),
    );
  }

}
