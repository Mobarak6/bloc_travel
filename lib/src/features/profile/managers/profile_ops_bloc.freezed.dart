// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_ops_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileOpsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileOpsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileOpsEvent()';
}


}

/// @nodoc
class $ProfileOpsEventCopyWith<$Res>  {
$ProfileOpsEventCopyWith(ProfileOpsEvent _, $Res Function(ProfileOpsEvent) __);
}


/// Adds pattern-matching-related methods to [ProfileOpsEvent].
extension ProfileOpsEventPatterns on ProfileOpsEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SelectImage value)?  selectImage,TResult Function( _UpdateProfile value)?  updateProfile,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SelectImage() when selectImage != null:
return selectImage(_that);case _UpdateProfile() when updateProfile != null:
return updateProfile(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SelectImage value)  selectImage,required TResult Function( _UpdateProfile value)  updateProfile,}){
final _that = this;
switch (_that) {
case _SelectImage():
return selectImage(_that);case _UpdateProfile():
return updateProfile(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SelectImage value)?  selectImage,TResult? Function( _UpdateProfile value)?  updateProfile,}){
final _that = this;
switch (_that) {
case _SelectImage() when selectImage != null:
return selectImage(_that);case _UpdateProfile() when updateProfile != null:
return updateProfile(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String imagePath)?  selectImage,TResult Function( String username,  String? avatarUrl)?  updateProfile,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SelectImage() when selectImage != null:
return selectImage(_that.imagePath);case _UpdateProfile() when updateProfile != null:
return updateProfile(_that.username,_that.avatarUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String imagePath)  selectImage,required TResult Function( String username,  String? avatarUrl)  updateProfile,}) {final _that = this;
switch (_that) {
case _SelectImage():
return selectImage(_that.imagePath);case _UpdateProfile():
return updateProfile(_that.username,_that.avatarUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String imagePath)?  selectImage,TResult? Function( String username,  String? avatarUrl)?  updateProfile,}) {final _that = this;
switch (_that) {
case _SelectImage() when selectImage != null:
return selectImage(_that.imagePath);case _UpdateProfile() when updateProfile != null:
return updateProfile(_that.username,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc


class _SelectImage implements ProfileOpsEvent {
  const _SelectImage({required this.imagePath});
  

 final  String imagePath;

/// Create a copy of ProfileOpsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectImageCopyWith<_SelectImage> get copyWith => __$SelectImageCopyWithImpl<_SelectImage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectImage&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath));
}


@override
int get hashCode => Object.hash(runtimeType,imagePath);

@override
String toString() {
  return 'ProfileOpsEvent.selectImage(imagePath: $imagePath)';
}


}

/// @nodoc
abstract mixin class _$SelectImageCopyWith<$Res> implements $ProfileOpsEventCopyWith<$Res> {
  factory _$SelectImageCopyWith(_SelectImage value, $Res Function(_SelectImage) _then) = __$SelectImageCopyWithImpl;
@useResult
$Res call({
 String imagePath
});




}
/// @nodoc
class __$SelectImageCopyWithImpl<$Res>
    implements _$SelectImageCopyWith<$Res> {
  __$SelectImageCopyWithImpl(this._self, this._then);

  final _SelectImage _self;
  final $Res Function(_SelectImage) _then;

/// Create a copy of ProfileOpsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? imagePath = null,}) {
  return _then(_SelectImage(
imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _UpdateProfile implements ProfileOpsEvent {
  const _UpdateProfile({required this.username, this.avatarUrl});
  

 final  String username;
 final  String? avatarUrl;

/// Create a copy of ProfileOpsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateProfileCopyWith<_UpdateProfile> get copyWith => __$UpdateProfileCopyWithImpl<_UpdateProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProfile&&(identical(other.username, username) || other.username == username)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}


@override
int get hashCode => Object.hash(runtimeType,username,avatarUrl);

@override
String toString() {
  return 'ProfileOpsEvent.updateProfile(username: $username, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$UpdateProfileCopyWith<$Res> implements $ProfileOpsEventCopyWith<$Res> {
  factory _$UpdateProfileCopyWith(_UpdateProfile value, $Res Function(_UpdateProfile) _then) = __$UpdateProfileCopyWithImpl;
@useResult
$Res call({
 String username, String? avatarUrl
});




}
/// @nodoc
class __$UpdateProfileCopyWithImpl<$Res>
    implements _$UpdateProfileCopyWith<$Res> {
  __$UpdateProfileCopyWithImpl(this._self, this._then);

  final _UpdateProfile _self;
  final $Res Function(_UpdateProfile) _then;

/// Create a copy of ProfileOpsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? username = null,Object? avatarUrl = freezed,}) {
  return _then(_UpdateProfile(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ProfileOpsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileOpsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileOpsState()';
}


}

/// @nodoc
class $ProfileOpsStateCopyWith<$Res>  {
$ProfileOpsStateCopyWith(ProfileOpsState _, $Res Function(ProfileOpsState) __);
}


/// Adds pattern-matching-related methods to [ProfileOpsState].
extension ProfileOpsStatePatterns on ProfileOpsState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Updating value)?  updating,TResult Function( _Updated value)?  updated,TResult Function( _Error value)?  error,TResult Function( _ImageSelected value)?  imageSelected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Updating() when updating != null:
return updating(_that);case _Updated() when updated != null:
return updated(_that);case _Error() when error != null:
return error(_that);case _ImageSelected() when imageSelected != null:
return imageSelected(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Updating value)  updating,required TResult Function( _Updated value)  updated,required TResult Function( _Error value)  error,required TResult Function( _ImageSelected value)  imageSelected,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Updating():
return updating(_that);case _Updated():
return updated(_that);case _Error():
return error(_that);case _ImageSelected():
return imageSelected(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Updating value)?  updating,TResult? Function( _Updated value)?  updated,TResult? Function( _Error value)?  error,TResult? Function( _ImageSelected value)?  imageSelected,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Updating() when updating != null:
return updating(_that);case _Updated() when updated != null:
return updated(_that);case _Error() when error != null:
return error(_that);case _ImageSelected() when imageSelected != null:
return imageSelected(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  updating,TResult Function( Profile profile)?  updated,TResult Function( String message)?  error,TResult Function( String selectedImagePath)?  imageSelected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Updating() when updating != null:
return updating();case _Updated() when updated != null:
return updated(_that.profile);case _Error() when error != null:
return error(_that.message);case _ImageSelected() when imageSelected != null:
return imageSelected(_that.selectedImagePath);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  updating,required TResult Function( Profile profile)  updated,required TResult Function( String message)  error,required TResult Function( String selectedImagePath)  imageSelected,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Updating():
return updating();case _Updated():
return updated(_that.profile);case _Error():
return error(_that.message);case _ImageSelected():
return imageSelected(_that.selectedImagePath);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  updating,TResult? Function( Profile profile)?  updated,TResult? Function( String message)?  error,TResult? Function( String selectedImagePath)?  imageSelected,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Updating() when updating != null:
return updating();case _Updated() when updated != null:
return updated(_that.profile);case _Error() when error != null:
return error(_that.message);case _ImageSelected() when imageSelected != null:
return imageSelected(_that.selectedImagePath);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ProfileOpsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileOpsState.initial()';
}


}




/// @nodoc


class _Updating implements ProfileOpsState {
  const _Updating();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Updating);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileOpsState.updating()';
}


}




/// @nodoc


class _Updated implements ProfileOpsState {
  const _Updated(this.profile);
  

 final  Profile profile;

/// Create a copy of ProfileOpsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatedCopyWith<_Updated> get copyWith => __$UpdatedCopyWithImpl<_Updated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Updated&&(identical(other.profile, profile) || other.profile == profile));
}


@override
int get hashCode => Object.hash(runtimeType,profile);

@override
String toString() {
  return 'ProfileOpsState.updated(profile: $profile)';
}


}

/// @nodoc
abstract mixin class _$UpdatedCopyWith<$Res> implements $ProfileOpsStateCopyWith<$Res> {
  factory _$UpdatedCopyWith(_Updated value, $Res Function(_Updated) _then) = __$UpdatedCopyWithImpl;
@useResult
$Res call({
 Profile profile
});


$ProfileCopyWith<$Res> get profile;

}
/// @nodoc
class __$UpdatedCopyWithImpl<$Res>
    implements _$UpdatedCopyWith<$Res> {
  __$UpdatedCopyWithImpl(this._self, this._then);

  final _Updated _self;
  final $Res Function(_Updated) _then;

/// Create a copy of ProfileOpsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profile = null,}) {
  return _then(_Updated(
null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as Profile,
  ));
}

/// Create a copy of ProfileOpsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileCopyWith<$Res> get profile {
  
  return $ProfileCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}

/// @nodoc


class _Error implements ProfileOpsState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of ProfileOpsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProfileOpsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $ProfileOpsStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of ProfileOpsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ImageSelected implements ProfileOpsState {
  const _ImageSelected({required this.selectedImagePath});
  

 final  String selectedImagePath;

/// Create a copy of ProfileOpsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageSelectedCopyWith<_ImageSelected> get copyWith => __$ImageSelectedCopyWithImpl<_ImageSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageSelected&&(identical(other.selectedImagePath, selectedImagePath) || other.selectedImagePath == selectedImagePath));
}


@override
int get hashCode => Object.hash(runtimeType,selectedImagePath);

@override
String toString() {
  return 'ProfileOpsState.imageSelected(selectedImagePath: $selectedImagePath)';
}


}

/// @nodoc
abstract mixin class _$ImageSelectedCopyWith<$Res> implements $ProfileOpsStateCopyWith<$Res> {
  factory _$ImageSelectedCopyWith(_ImageSelected value, $Res Function(_ImageSelected) _then) = __$ImageSelectedCopyWithImpl;
@useResult
$Res call({
 String selectedImagePath
});




}
/// @nodoc
class __$ImageSelectedCopyWithImpl<$Res>
    implements _$ImageSelectedCopyWith<$Res> {
  __$ImageSelectedCopyWithImpl(this._self, this._then);

  final _ImageSelected _self;
  final $Res Function(_ImageSelected) _then;

/// Create a copy of ProfileOpsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selectedImagePath = null,}) {
  return _then(_ImageSelected(
selectedImagePath: null == selectedImagePath ? _self.selectedImagePath : selectedImagePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
