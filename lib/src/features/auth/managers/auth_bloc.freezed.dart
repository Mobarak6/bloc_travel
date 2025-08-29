// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {

 String get email;
/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthEventCopyWith<AuthEvent> get copyWith => _$AuthEventCopyWithImpl<AuthEvent>(this as AuthEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'AuthEvent(email: $email)';
}


}

/// @nodoc
abstract mixin class $AuthEventCopyWith<$Res>  {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) _then) = _$AuthEventCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$AuthEventCopyWithImpl<$Res>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._self, this._then);

  final AuthEvent _self;
  final $Res Function(AuthEvent) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _CheckAuthUserExist value)?  checkAuthUserExist,TResult Function( _SignInWithEmailAndPassword value)?  signInWithEmailAndPassword,TResult Function( _SignUpWithEmailAndPassword value)?  signUpWithEmailAndPassword,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckAuthUserExist() when checkAuthUserExist != null:
return checkAuthUserExist(_that);case _SignInWithEmailAndPassword() when signInWithEmailAndPassword != null:
return signInWithEmailAndPassword(_that);case _SignUpWithEmailAndPassword() when signUpWithEmailAndPassword != null:
return signUpWithEmailAndPassword(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _CheckAuthUserExist value)  checkAuthUserExist,required TResult Function( _SignInWithEmailAndPassword value)  signInWithEmailAndPassword,required TResult Function( _SignUpWithEmailAndPassword value)  signUpWithEmailAndPassword,}){
final _that = this;
switch (_that) {
case _CheckAuthUserExist():
return checkAuthUserExist(_that);case _SignInWithEmailAndPassword():
return signInWithEmailAndPassword(_that);case _SignUpWithEmailAndPassword():
return signUpWithEmailAndPassword(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _CheckAuthUserExist value)?  checkAuthUserExist,TResult? Function( _SignInWithEmailAndPassword value)?  signInWithEmailAndPassword,TResult? Function( _SignUpWithEmailAndPassword value)?  signUpWithEmailAndPassword,}){
final _that = this;
switch (_that) {
case _CheckAuthUserExist() when checkAuthUserExist != null:
return checkAuthUserExist(_that);case _SignInWithEmailAndPassword() when signInWithEmailAndPassword != null:
return signInWithEmailAndPassword(_that);case _SignUpWithEmailAndPassword() when signUpWithEmailAndPassword != null:
return signUpWithEmailAndPassword(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email)?  checkAuthUserExist,TResult Function( String email,  String password)?  signInWithEmailAndPassword,TResult Function( String email,  String password,  String name)?  signUpWithEmailAndPassword,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckAuthUserExist() when checkAuthUserExist != null:
return checkAuthUserExist(_that.email);case _SignInWithEmailAndPassword() when signInWithEmailAndPassword != null:
return signInWithEmailAndPassword(_that.email,_that.password);case _SignUpWithEmailAndPassword() when signUpWithEmailAndPassword != null:
return signUpWithEmailAndPassword(_that.email,_that.password,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email)  checkAuthUserExist,required TResult Function( String email,  String password)  signInWithEmailAndPassword,required TResult Function( String email,  String password,  String name)  signUpWithEmailAndPassword,}) {final _that = this;
switch (_that) {
case _CheckAuthUserExist():
return checkAuthUserExist(_that.email);case _SignInWithEmailAndPassword():
return signInWithEmailAndPassword(_that.email,_that.password);case _SignUpWithEmailAndPassword():
return signUpWithEmailAndPassword(_that.email,_that.password,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email)?  checkAuthUserExist,TResult? Function( String email,  String password)?  signInWithEmailAndPassword,TResult? Function( String email,  String password,  String name)?  signUpWithEmailAndPassword,}) {final _that = this;
switch (_that) {
case _CheckAuthUserExist() when checkAuthUserExist != null:
return checkAuthUserExist(_that.email);case _SignInWithEmailAndPassword() when signInWithEmailAndPassword != null:
return signInWithEmailAndPassword(_that.email,_that.password);case _SignUpWithEmailAndPassword() when signUpWithEmailAndPassword != null:
return signUpWithEmailAndPassword(_that.email,_that.password,_that.name);case _:
  return null;

}
}

}

/// @nodoc


class _CheckAuthUserExist implements AuthEvent {
  const _CheckAuthUserExist(this.email);
  

@override final  String email;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckAuthUserExistCopyWith<_CheckAuthUserExist> get copyWith => __$CheckAuthUserExistCopyWithImpl<_CheckAuthUserExist>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckAuthUserExist&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'AuthEvent.checkAuthUserExist(email: $email)';
}


}

/// @nodoc
abstract mixin class _$CheckAuthUserExistCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$CheckAuthUserExistCopyWith(_CheckAuthUserExist value, $Res Function(_CheckAuthUserExist) _then) = __$CheckAuthUserExistCopyWithImpl;
@override @useResult
$Res call({
 String email
});




}
/// @nodoc
class __$CheckAuthUserExistCopyWithImpl<$Res>
    implements _$CheckAuthUserExistCopyWith<$Res> {
  __$CheckAuthUserExistCopyWithImpl(this._self, this._then);

  final _CheckAuthUserExist _self;
  final $Res Function(_CheckAuthUserExist) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_CheckAuthUserExist(
null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SignInWithEmailAndPassword implements AuthEvent {
  const _SignInWithEmailAndPassword({required this.email, required this.password});
  

@override final  String email;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignInWithEmailAndPasswordCopyWith<_SignInWithEmailAndPassword> get copyWith => __$SignInWithEmailAndPasswordCopyWithImpl<_SignInWithEmailAndPassword>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignInWithEmailAndPassword&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'AuthEvent.signInWithEmailAndPassword(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$SignInWithEmailAndPasswordCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$SignInWithEmailAndPasswordCopyWith(_SignInWithEmailAndPassword value, $Res Function(_SignInWithEmailAndPassword) _then) = __$SignInWithEmailAndPasswordCopyWithImpl;
@override @useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class __$SignInWithEmailAndPasswordCopyWithImpl<$Res>
    implements _$SignInWithEmailAndPasswordCopyWith<$Res> {
  __$SignInWithEmailAndPasswordCopyWithImpl(this._self, this._then);

  final _SignInWithEmailAndPassword _self;
  final $Res Function(_SignInWithEmailAndPassword) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(_SignInWithEmailAndPassword(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SignUpWithEmailAndPassword implements AuthEvent {
  const _SignUpWithEmailAndPassword({required this.email, required this.password, required this.name});
  

@override final  String email;
 final  String password;
 final  String name;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignUpWithEmailAndPasswordCopyWith<_SignUpWithEmailAndPassword> get copyWith => __$SignUpWithEmailAndPasswordCopyWithImpl<_SignUpWithEmailAndPassword>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignUpWithEmailAndPassword&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,name);

@override
String toString() {
  return 'AuthEvent.signUpWithEmailAndPassword(email: $email, password: $password, name: $name)';
}


}

/// @nodoc
abstract mixin class _$SignUpWithEmailAndPasswordCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$SignUpWithEmailAndPasswordCopyWith(_SignUpWithEmailAndPassword value, $Res Function(_SignUpWithEmailAndPassword) _then) = __$SignUpWithEmailAndPasswordCopyWithImpl;
@override @useResult
$Res call({
 String email, String password, String name
});




}
/// @nodoc
class __$SignUpWithEmailAndPasswordCopyWithImpl<$Res>
    implements _$SignUpWithEmailAndPasswordCopyWith<$Res> {
  __$SignUpWithEmailAndPasswordCopyWithImpl(this._self, this._then);

  final _SignUpWithEmailAndPassword _self;
  final $Res Function(_SignUpWithEmailAndPassword) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? name = null,}) {
  return _then(_SignUpWithEmailAndPassword(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _InProgress value)?  inProgress,TResult Function( _Success value)?  success,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _InProgress() when inProgress != null:
return inProgress(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _InProgress value)  inProgress,required TResult Function( _Success value)  success,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _InProgress():
return inProgress(_that);case _Success():
return success(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _InProgress value)?  inProgress,TResult? Function( _Success value)?  success,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _InProgress() when inProgress != null:
return inProgress(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  inProgress,TResult Function()?  success,TResult Function( Exception? e)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _InProgress() when inProgress != null:
return inProgress();case _Success() when success != null:
return success();case _Error() when error != null:
return error(_that.e);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  inProgress,required TResult Function()  success,required TResult Function( Exception? e)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _InProgress():
return inProgress();case _Success():
return success();case _Error():
return error(_that.e);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  inProgress,TResult? Function()?  success,TResult? Function( Exception? e)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _InProgress() when inProgress != null:
return inProgress();case _Success() when success != null:
return success();case _Error() when error != null:
return error(_that.e);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AuthState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.initial()';
}


}




/// @nodoc


class _InProgress implements AuthState {
  const _InProgress();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InProgress);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.inProgress()';
}


}




/// @nodoc


class _Success implements AuthState {
  const _Success();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.success()';
}


}




/// @nodoc


class _Error implements AuthState {
  const _Error(this.e);
  

 final  Exception? e;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.e, e) || other.e == e));
}


@override
int get hashCode => Object.hash(runtimeType,e);

@override
String toString() {
  return 'AuthState.error(e: $e)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 Exception? e
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? e = freezed,}) {
  return _then(_Error(
freezed == e ? _self.e : e // ignore: cast_nullable_to_non_nullable
as Exception?,
  ));
}


}

// dart format on
