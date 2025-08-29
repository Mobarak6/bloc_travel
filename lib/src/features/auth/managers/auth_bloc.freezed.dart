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





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SignIn value)?  signIn,TResult Function( _SignUp value)?  signUp,TResult Function( _SelectUserRole value)?  selectUserRole,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignIn() when signIn != null:
return signIn(_that);case _SignUp() when signUp != null:
return signUp(_that);case _SelectUserRole() when selectUserRole != null:
return selectUserRole(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SignIn value)  signIn,required TResult Function( _SignUp value)  signUp,required TResult Function( _SelectUserRole value)  selectUserRole,}){
final _that = this;
switch (_that) {
case _SignIn():
return signIn(_that);case _SignUp():
return signUp(_that);case _SelectUserRole():
return selectUserRole(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SignIn value)?  signIn,TResult? Function( _SignUp value)?  signUp,TResult? Function( _SelectUserRole value)?  selectUserRole,}){
final _that = this;
switch (_that) {
case _SignIn() when signIn != null:
return signIn(_that);case _SignUp() when signUp != null:
return signUp(_that);case _SelectUserRole() when selectUserRole != null:
return selectUserRole(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email,  String password)?  signIn,TResult Function( String email,  String password,  String name,  UserRole userRole)?  signUp,TResult Function( UserRole userRole)?  selectUserRole,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignIn() when signIn != null:
return signIn(_that.email,_that.password);case _SignUp() when signUp != null:
return signUp(_that.email,_that.password,_that.name,_that.userRole);case _SelectUserRole() when selectUserRole != null:
return selectUserRole(_that.userRole);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email,  String password)  signIn,required TResult Function( String email,  String password,  String name,  UserRole userRole)  signUp,required TResult Function( UserRole userRole)  selectUserRole,}) {final _that = this;
switch (_that) {
case _SignIn():
return signIn(_that.email,_that.password);case _SignUp():
return signUp(_that.email,_that.password,_that.name,_that.userRole);case _SelectUserRole():
return selectUserRole(_that.userRole);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email,  String password)?  signIn,TResult? Function( String email,  String password,  String name,  UserRole userRole)?  signUp,TResult? Function( UserRole userRole)?  selectUserRole,}) {final _that = this;
switch (_that) {
case _SignIn() when signIn != null:
return signIn(_that.email,_that.password);case _SignUp() when signUp != null:
return signUp(_that.email,_that.password,_that.name,_that.userRole);case _SelectUserRole() when selectUserRole != null:
return selectUserRole(_that.userRole);case _:
  return null;

}
}

}

/// @nodoc


class _SignIn implements AuthEvent {
  const _SignIn({required this.email, required this.password});
  

 final  String email;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignInCopyWith<_SignIn> get copyWith => __$SignInCopyWithImpl<_SignIn>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignIn&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'AuthEvent.signIn(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$SignInCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$SignInCopyWith(_SignIn value, $Res Function(_SignIn) _then) = __$SignInCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class __$SignInCopyWithImpl<$Res>
    implements _$SignInCopyWith<$Res> {
  __$SignInCopyWithImpl(this._self, this._then);

  final _SignIn _self;
  final $Res Function(_SignIn) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(_SignIn(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SignUp implements AuthEvent {
  const _SignUp({required this.email, required this.password, required this.name, required this.userRole});
  

 final  String email;
 final  String password;
 final  String name;
 final  UserRole userRole;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignUpCopyWith<_SignUp> get copyWith => __$SignUpCopyWithImpl<_SignUp>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignUp&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.name, name) || other.name == name)&&(identical(other.userRole, userRole) || other.userRole == userRole));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,name,userRole);

@override
String toString() {
  return 'AuthEvent.signUp(email: $email, password: $password, name: $name, userRole: $userRole)';
}


}

/// @nodoc
abstract mixin class _$SignUpCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$SignUpCopyWith(_SignUp value, $Res Function(_SignUp) _then) = __$SignUpCopyWithImpl;
@useResult
$Res call({
 String email, String password, String name, UserRole userRole
});




}
/// @nodoc
class __$SignUpCopyWithImpl<$Res>
    implements _$SignUpCopyWith<$Res> {
  __$SignUpCopyWithImpl(this._self, this._then);

  final _SignUp _self;
  final $Res Function(_SignUp) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? name = null,Object? userRole = null,}) {
  return _then(_SignUp(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,userRole: null == userRole ? _self.userRole : userRole // ignore: cast_nullable_to_non_nullable
as UserRole,
  ));
}


}

/// @nodoc


class _SelectUserRole implements AuthEvent {
  const _SelectUserRole({required this.userRole});
  

 final  UserRole userRole;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectUserRoleCopyWith<_SelectUserRole> get copyWith => __$SelectUserRoleCopyWithImpl<_SelectUserRole>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectUserRole&&(identical(other.userRole, userRole) || other.userRole == userRole));
}


@override
int get hashCode => Object.hash(runtimeType,userRole);

@override
String toString() {
  return 'AuthEvent.selectUserRole(userRole: $userRole)';
}


}

/// @nodoc
abstract mixin class _$SelectUserRoleCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$SelectUserRoleCopyWith(_SelectUserRole value, $Res Function(_SelectUserRole) _then) = __$SelectUserRoleCopyWithImpl;
@useResult
$Res call({
 UserRole userRole
});




}
/// @nodoc
class __$SelectUserRoleCopyWithImpl<$Res>
    implements _$SelectUserRoleCopyWith<$Res> {
  __$SelectUserRoleCopyWithImpl(this._self, this._then);

  final _SelectUserRole _self;
  final $Res Function(_SelectUserRole) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userRole = null,}) {
  return _then(_SelectUserRole(
userRole: null == userRole ? _self.userRole : userRole // ignore: cast_nullable_to_non_nullable
as UserRole,
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _InProgress value)?  inProgress,TResult Function( _Success value)?  success,TResult Function( _Error value)?  error,TResult Function( _SelectedUserRole value)?  selectedUserRole,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _InProgress() when inProgress != null:
return inProgress(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _SelectedUserRole() when selectedUserRole != null:
return selectedUserRole(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _InProgress value)  inProgress,required TResult Function( _Success value)  success,required TResult Function( _Error value)  error,required TResult Function( _SelectedUserRole value)  selectedUserRole,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _InProgress():
return inProgress(_that);case _Success():
return success(_that);case _Error():
return error(_that);case _SelectedUserRole():
return selectedUserRole(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _InProgress value)?  inProgress,TResult? Function( _Success value)?  success,TResult? Function( _Error value)?  error,TResult? Function( _SelectedUserRole value)?  selectedUserRole,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _InProgress() when inProgress != null:
return inProgress(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _SelectedUserRole() when selectedUserRole != null:
return selectedUserRole(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  inProgress,TResult Function()?  success,TResult Function( Exception? e)?  error,TResult Function( UserRole userRole)?  selectedUserRole,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _InProgress() when inProgress != null:
return inProgress();case _Success() when success != null:
return success();case _Error() when error != null:
return error(_that.e);case _SelectedUserRole() when selectedUserRole != null:
return selectedUserRole(_that.userRole);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  inProgress,required TResult Function()  success,required TResult Function( Exception? e)  error,required TResult Function( UserRole userRole)  selectedUserRole,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _InProgress():
return inProgress();case _Success():
return success();case _Error():
return error(_that.e);case _SelectedUserRole():
return selectedUserRole(_that.userRole);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  inProgress,TResult? Function()?  success,TResult? Function( Exception? e)?  error,TResult? Function( UserRole userRole)?  selectedUserRole,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _InProgress() when inProgress != null:
return inProgress();case _Success() when success != null:
return success();case _Error() when error != null:
return error(_that.e);case _SelectedUserRole() when selectedUserRole != null:
return selectedUserRole(_that.userRole);case _:
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

/// @nodoc


class _SelectedUserRole implements AuthState {
  const _SelectedUserRole(this.userRole);
  

 final  UserRole userRole;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectedUserRoleCopyWith<_SelectedUserRole> get copyWith => __$SelectedUserRoleCopyWithImpl<_SelectedUserRole>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectedUserRole&&(identical(other.userRole, userRole) || other.userRole == userRole));
}


@override
int get hashCode => Object.hash(runtimeType,userRole);

@override
String toString() {
  return 'AuthState.selectedUserRole(userRole: $userRole)';
}


}

/// @nodoc
abstract mixin class _$SelectedUserRoleCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$SelectedUserRoleCopyWith(_SelectedUserRole value, $Res Function(_SelectedUserRole) _then) = __$SelectedUserRoleCopyWithImpl;
@useResult
$Res call({
 UserRole userRole
});




}
/// @nodoc
class __$SelectedUserRoleCopyWithImpl<$Res>
    implements _$SelectedUserRoleCopyWith<$Res> {
  __$SelectedUserRoleCopyWithImpl(this._self, this._then);

  final _SelectedUserRole _self;
  final $Res Function(_SelectedUserRole) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userRole = null,}) {
  return _then(_SelectedUserRole(
null == userRole ? _self.userRole : userRole // ignore: cast_nullable_to_non_nullable
as UserRole,
  ));
}


}

// dart format on
