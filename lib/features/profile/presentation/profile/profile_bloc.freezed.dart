// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProfileState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileState()';
  }
}

/// @nodoc
class $ProfileStateCopyWith<$Res> {
  $ProfileStateCopyWith(ProfileState _, $Res Function(ProfileState) __);
}

/// Adds pattern-matching-related methods to [ProfileState].
extension ProfileStatePatterns on ProfileState {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_UpdateUI value)? updateUI,
    TResult Function(_SeccessUI value)? seccessUI,
    TResult Function(_Guest value)? guest,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Success() when success != null:
        return success(_that);
      case _Failure() when failure != null:
        return failure(_that);
      case _UpdateUI() when updateUI != null:
        return updateUI(_that);
      case _SeccessUI() when seccessUI != null:
        return seccessUI(_that);
      case _Guest() when guest != null:
        return guest(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_UpdateUI value) updateUI,
    required TResult Function(_SeccessUI value) seccessUI,
    required TResult Function(_Guest value) guest,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Loading():
        return loading(_that);
      case _Success():
        return success(_that);
      case _Failure():
        return failure(_that);
      case _UpdateUI():
        return updateUI(_that);
      case _SeccessUI():
        return seccessUI(_that);
      case _Guest():
        return guest(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_UpdateUI value)? updateUI,
    TResult? Function(_SeccessUI value)? seccessUI,
    TResult? Function(_Guest value)? guest,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Success() when success != null:
        return success(_that);
      case _Failure() when failure != null:
        return failure(_that);
      case _UpdateUI() when updateUI != null:
        return updateUI(_that);
      case _SeccessUI() when seccessUI != null:
        return seccessUI(_that);
      case _Guest() when guest != null:
        return guest(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message, ProfileModel? user)? success,
    TResult Function(String error)? failure,
    TResult Function()? updateUI,
    TResult Function()? seccessUI,
    TResult Function()? guest,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Success() when success != null:
        return success(_that.message, _that.user);
      case _Failure() when failure != null:
        return failure(_that.error);
      case _UpdateUI() when updateUI != null:
        return updateUI();
      case _SeccessUI() when seccessUI != null:
        return seccessUI();
      case _Guest() when guest != null:
        return guest();
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message, ProfileModel? user) success,
    required TResult Function(String error) failure,
    required TResult Function() updateUI,
    required TResult Function() seccessUI,
    required TResult Function() guest,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Loading():
        return loading();
      case _Success():
        return success(_that.message, _that.user);
      case _Failure():
        return failure(_that.error);
      case _UpdateUI():
        return updateUI();
      case _SeccessUI():
        return seccessUI();
      case _Guest():
        return guest();
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message, ProfileModel? user)? success,
    TResult? Function(String error)? failure,
    TResult? Function()? updateUI,
    TResult? Function()? seccessUI,
    TResult? Function()? guest,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Success() when success != null:
        return success(_that.message, _that.user);
      case _Failure() when failure != null:
        return failure(_that.error);
      case _UpdateUI() when updateUI != null:
        return updateUI();
      case _SeccessUI() when seccessUI != null:
        return seccessUI();
      case _Guest() when guest != null:
        return guest();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements ProfileState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileState.initial()';
  }
}

/// @nodoc

class _Loading implements ProfileState {
  const _Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileState.loading()';
  }
}

/// @nodoc

class _Success implements ProfileState {
  const _Success({this.message, required this.user});

  final String? message;
  final ProfileModel? user;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SuccessCopyWith<_Success> get copyWith =>
      __$SuccessCopyWithImpl<_Success>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Success &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, user);

  @override
  String toString() {
    return 'ProfileState.success(message: $message, user: $user)';
  }
}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) =
      __$SuccessCopyWithImpl;
  @useResult
  $Res call({String? message, ProfileModel? user});
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res> implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
    Object? user = freezed,
  }) {
    return _then(_Success(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as ProfileModel?,
    ));
  }
}

/// @nodoc

class _Failure implements ProfileState {
  const _Failure({required this.error});

  final String error;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FailureCopyWith<_Failure> get copyWith =>
      __$FailureCopyWithImpl<_Failure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Failure &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'ProfileState.failure(error: $error)';
  }
}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) =
      __$FailureCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$FailureCopyWithImpl<$Res> implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(_Failure(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _UpdateUI implements ProfileState {
  const _UpdateUI();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _UpdateUI);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileState.updateUI()';
  }
}

/// @nodoc

class _SeccessUI implements ProfileState {
  const _SeccessUI();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SeccessUI);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileState.seccessUI()';
  }
}

/// @nodoc

class _Guest implements ProfileState {
  const _Guest();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Guest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileState.guest()';
  }
}

/// @nodoc
mixin _$ProfileEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProfileEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileEvent()';
  }
}

/// @nodoc
class $ProfileEventCopyWith<$Res> {
  $ProfileEventCopyWith(ProfileEvent _, $Res Function(ProfileEvent) __);
}

/// Adds pattern-matching-related methods to [ProfileEvent].
extension ProfileEventPatterns on ProfileEvent {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveChanges value)? saveChanges,
    TResult Function(_GetUserData value)? getUserData,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_ChangePhone value)? changePhone,
    TResult Function(_ChangePassword value)? changePassword,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SaveChanges() when saveChanges != null:
        return saveChanges(_that);
      case _GetUserData() when getUserData != null:
        return getUserData(_that);
      case _PickImage() when pickImage != null:
        return pickImage(_that);
      case _ChangePhone() when changePhone != null:
        return changePhone(_that);
      case _ChangePassword() when changePassword != null:
        return changePassword(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveChanges value) saveChanges,
    required TResult Function(_GetUserData value) getUserData,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_ChangePhone value) changePhone,
    required TResult Function(_ChangePassword value) changePassword,
  }) {
    final _that = this;
    switch (_that) {
      case _SaveChanges():
        return saveChanges(_that);
      case _GetUserData():
        return getUserData(_that);
      case _PickImage():
        return pickImage(_that);
      case _ChangePhone():
        return changePhone(_that);
      case _ChangePassword():
        return changePassword(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveChanges value)? saveChanges,
    TResult? Function(_GetUserData value)? getUserData,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_ChangePhone value)? changePhone,
    TResult? Function(_ChangePassword value)? changePassword,
  }) {
    final _that = this;
    switch (_that) {
      case _SaveChanges() when saveChanges != null:
        return saveChanges(_that);
      case _GetUserData() when getUserData != null:
        return getUserData(_that);
      case _PickImage() when pickImage != null:
        return pickImage(_that);
      case _ChangePhone() when changePhone != null:
        return changePhone(_that);
      case _ChangePassword() when changePassword != null:
        return changePassword(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? saveChanges,
    TResult Function()? getUserData,
    TResult Function()? pickImage,
    TResult Function()? changePhone,
    TResult Function()? changePassword,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SaveChanges() when saveChanges != null:
        return saveChanges();
      case _GetUserData() when getUserData != null:
        return getUserData();
      case _PickImage() when pickImage != null:
        return pickImage();
      case _ChangePhone() when changePhone != null:
        return changePhone();
      case _ChangePassword() when changePassword != null:
        return changePassword();
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() saveChanges,
    required TResult Function() getUserData,
    required TResult Function() pickImage,
    required TResult Function() changePhone,
    required TResult Function() changePassword,
  }) {
    final _that = this;
    switch (_that) {
      case _SaveChanges():
        return saveChanges();
      case _GetUserData():
        return getUserData();
      case _PickImage():
        return pickImage();
      case _ChangePhone():
        return changePhone();
      case _ChangePassword():
        return changePassword();
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? saveChanges,
    TResult? Function()? getUserData,
    TResult? Function()? pickImage,
    TResult? Function()? changePhone,
    TResult? Function()? changePassword,
  }) {
    final _that = this;
    switch (_that) {
      case _SaveChanges() when saveChanges != null:
        return saveChanges();
      case _GetUserData() when getUserData != null:
        return getUserData();
      case _PickImage() when pickImage != null:
        return pickImage();
      case _ChangePhone() when changePhone != null:
        return changePhone();
      case _ChangePassword() when changePassword != null:
        return changePassword();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SaveChanges implements ProfileEvent {
  const _SaveChanges();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SaveChanges);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileEvent.saveChanges()';
  }
}

/// @nodoc

class _GetUserData implements ProfileEvent {
  const _GetUserData();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _GetUserData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileEvent.getUserData()';
  }
}

/// @nodoc

class _PickImage implements ProfileEvent {
  const _PickImage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _PickImage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileEvent.pickImage()';
  }
}

/// @nodoc

class _ChangePhone implements ProfileEvent {
  const _ChangePhone();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ChangePhone);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileEvent.changePhone()';
  }
}

/// @nodoc

class _ChangePassword implements ProfileEvent {
  const _ChangePassword();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ChangePassword);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileEvent.changePassword()';
  }
}

// dart format on
