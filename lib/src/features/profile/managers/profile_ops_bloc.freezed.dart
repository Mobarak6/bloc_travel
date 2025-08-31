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

 Profile get profile; String get imagePath;
/// Create a copy of ProfileOpsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileOpsEventCopyWith<ProfileOpsEvent> get copyWith => _$ProfileOpsEventCopyWithImpl<ProfileOpsEvent>(this as ProfileOpsEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileOpsEvent&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath));
}


@override
int get hashCode => Object.hash(runtimeType,profile,imagePath);

@override
String toString() {
  return 'ProfileOpsEvent(profile: $profile, imagePath: $imagePath)';
}


}

/// @nodoc
abstract mixin class $ProfileOpsEventCopyWith<$Res>  {
  factory $ProfileOpsEventCopyWith(ProfileOpsEvent value, $Res Function(ProfileOpsEvent) _then) = _$ProfileOpsEventCopyWithImpl;
@useResult
$Res call({
 Profile profile, String imagePath
});


$ProfileCopyWith<$Res> get profile;

}
/// @nodoc
class _$ProfileOpsEventCopyWithImpl<$Res>
    implements $ProfileOpsEventCopyWith<$Res> {
  _$ProfileOpsEventCopyWithImpl(this._self, this._then);

  final ProfileOpsEvent _self;
  final $Res Function(ProfileOpsEvent) _then;

/// Create a copy of ProfileOpsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profile = null,Object? imagePath = null,}) {
  return _then(_self.copyWith(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as Profile,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of ProfileOpsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileCopyWith<$Res> get profile {
  
  return $ProfileCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SelectImage value)?  selectImage,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SelectImage() when selectImage != null:
return selectImage(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SelectImage value)  selectImage,}){
final _that = this;
switch (_that) {
case _SelectImage():
return selectImage(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SelectImage value)?  selectImage,}){
final _that = this;
switch (_that) {
case _SelectImage() when selectImage != null:
return selectImage(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Profile profile,  String imagePath)?  selectImage,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SelectImage() when selectImage != null:
return selectImage(_that.profile,_that.imagePath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Profile profile,  String imagePath)  selectImage,}) {final _that = this;
switch (_that) {
case _SelectImage():
return selectImage(_that.profile,_that.imagePath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Profile profile,  String imagePath)?  selectImage,}) {final _that = this;
switch (_that) {
case _SelectImage() when selectImage != null:
return selectImage(_that.profile,_that.imagePath);case _:
  return null;

}
}

}

/// @nodoc


class _SelectImage implements ProfileOpsEvent {
  const _SelectImage({required this.profile, required this.imagePath});
  

@override final  Profile profile;
@override final  String imagePath;

/// Create a copy of ProfileOpsEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectImageCopyWith<_SelectImage> get copyWith => __$SelectImageCopyWithImpl<_SelectImage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectImage&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath));
}


@override
int get hashCode => Object.hash(runtimeType,profile,imagePath);

@override
String toString() {
  return 'ProfileOpsEvent.selectImage(profile: $profile, imagePath: $imagePath)';
}


}

/// @nodoc
abstract mixin class _$SelectImageCopyWith<$Res> implements $ProfileOpsEventCopyWith<$Res> {
  factory _$SelectImageCopyWith(_SelectImage value, $Res Function(_SelectImage) _then) = __$SelectImageCopyWithImpl;
@override @useResult
$Res call({
 Profile profile, String imagePath
});


@override $ProfileCopyWith<$Res> get profile;

}
/// @nodoc
class __$SelectImageCopyWithImpl<$Res>
    implements _$SelectImageCopyWith<$Res> {
  __$SelectImageCopyWithImpl(this._self, this._then);

  final _SelectImage _self;
  final $Res Function(_SelectImage) _then;

/// Create a copy of ProfileOpsEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profile = null,Object? imagePath = null,}) {
  return _then(_SelectImage(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as Profile,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of ProfileOpsEvent
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _ImageSelected value)?  imageSelected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _ImageSelected() when imageSelected != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _ImageSelected value)  imageSelected,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _ImageSelected():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _ImageSelected value)?  imageSelected,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _ImageSelected() when imageSelected != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( Profile profile,  String selectedImagePath)?  imageSelected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _ImageSelected() when imageSelected != null:
return imageSelected(_that.profile,_that.selectedImagePath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( Profile profile,  String selectedImagePath)  imageSelected,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _ImageSelected():
return imageSelected(_that.profile,_that.selectedImagePath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( Profile profile,  String selectedImagePath)?  imageSelected,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _ImageSelected() when imageSelected != null:
return imageSelected(_that.profile,_that.selectedImagePath);case _:
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


class _ImageSelected implements ProfileOpsState {
  const _ImageSelected({required this.profile, required this.selectedImagePath});
  

 final  Profile profile;
 final  String selectedImagePath;

/// Create a copy of ProfileOpsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageSelectedCopyWith<_ImageSelected> get copyWith => __$ImageSelectedCopyWithImpl<_ImageSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageSelected&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.selectedImagePath, selectedImagePath) || other.selectedImagePath == selectedImagePath));
}


@override
int get hashCode => Object.hash(runtimeType,profile,selectedImagePath);

@override
String toString() {
  return 'ProfileOpsState.imageSelected(profile: $profile, selectedImagePath: $selectedImagePath)';
}


}

/// @nodoc
abstract mixin class _$ImageSelectedCopyWith<$Res> implements $ProfileOpsStateCopyWith<$Res> {
  factory _$ImageSelectedCopyWith(_ImageSelected value, $Res Function(_ImageSelected) _then) = __$ImageSelectedCopyWithImpl;
@useResult
$Res call({
 Profile profile, String selectedImagePath
});


$ProfileCopyWith<$Res> get profile;

}
/// @nodoc
class __$ImageSelectedCopyWithImpl<$Res>
    implements _$ImageSelectedCopyWith<$Res> {
  __$ImageSelectedCopyWithImpl(this._self, this._then);

  final _ImageSelected _self;
  final $Res Function(_ImageSelected) _then;

/// Create a copy of ProfileOpsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profile = null,Object? selectedImagePath = null,}) {
  return _then(_ImageSelected(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as Profile,selectedImagePath: null == selectedImagePath ? _self.selectedImagePath : selectedImagePath // ignore: cast_nullable_to_non_nullable
as String,
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

// dart format on
