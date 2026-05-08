// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CartState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CartState()';
  }
}

/// @nodoc
class $CartStateCopyWith<$Res> {
  $CartStateCopyWith(CartState _, $Res Function(CartState) __);
}

/// Adds pattern-matching-related methods to [CartState].
extension CartStatePatterns on CartState {
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
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Success() when success != null:
        return success(_that);
      case _Error() when error != null:
        return error(_that);
      case _Loading() when loading != null:
        return loading(_that);
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
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Success():
        return success(_that);
      case _Error():
        return error(_that);
      case _Loading():
        return loading(_that);
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
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Success() when success != null:
        return success(_that);
      case _Error() when error != null:
        return error(_that);
      case _Loading() when loading != null:
        return loading(_that);
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
    TResult Function(List<ProductModel> cartProducts)? success,
    TResult Function(String error)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Success() when success != null:
        return success(_that.cartProducts);
      case _Error() when error != null:
        return error(_that.error);
      case _Loading() when loading != null:
        return loading();
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
    required TResult Function(List<ProductModel> cartProducts) success,
    required TResult Function(String error) error,
    required TResult Function() loading,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Success():
        return success(_that.cartProducts);
      case _Error():
        return error(_that.error);
      case _Loading():
        return loading();
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
    TResult? Function(List<ProductModel> cartProducts)? success,
    TResult? Function(String error)? error,
    TResult? Function()? loading,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Success() when success != null:
        return success(_that.cartProducts);
      case _Error() when error != null:
        return error(_that.error);
      case _Loading() when loading != null:
        return loading();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements CartState {
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
    return 'CartState.initial()';
  }
}

/// @nodoc

class _Success implements CartState {
  const _Success(final List<ProductModel> cartProducts)
      : _cartProducts = cartProducts;

  final List<ProductModel> _cartProducts;
  List<ProductModel> get cartProducts {
    if (_cartProducts is EqualUnmodifiableListView) return _cartProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartProducts);
  }

  /// Create a copy of CartState
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
            const DeepCollectionEquality()
                .equals(other._cartProducts, _cartProducts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_cartProducts));

  @override
  String toString() {
    return 'CartState.success(cartProducts: $cartProducts)';
  }
}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res>
    implements $CartStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) =
      __$SuccessCopyWithImpl;
  @useResult
  $Res call({List<ProductModel> cartProducts});
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res> implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cartProducts = null,
  }) {
    return _then(_Success(
      null == cartProducts
          ? _self._cartProducts
          : cartProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ));
  }
}

/// @nodoc

class _Error implements CartState {
  const _Error(this.error);

  final String error;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'CartState.error(error: $error)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(_Error(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _Loading implements CartState {
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
    return 'CartState.loading()';
  }
}

/// @nodoc
mixin _$CartEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CartEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CartEvent()';
  }
}

/// @nodoc
class $CartEventCopyWith<$Res> {
  $CartEventCopyWith(CartEvent _, $Res Function(CartEvent) __);
}

/// Adds pattern-matching-related methods to [CartEvent].
extension CartEventPatterns on CartEvent {
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
    TResult Function(_GetCart value)? getCart,
    TResult Function(_AddCart value)? addCart,
    TResult Function(_DeleteCart value)? deleteCart,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GetCart() when getCart != null:
        return getCart(_that);
      case _AddCart() when addCart != null:
        return addCart(_that);
      case _DeleteCart() when deleteCart != null:
        return deleteCart(_that);
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
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_AddCart value) addCart,
    required TResult Function(_DeleteCart value) deleteCart,
  }) {
    final _that = this;
    switch (_that) {
      case _GetCart():
        return getCart(_that);
      case _AddCart():
        return addCart(_that);
      case _DeleteCart():
        return deleteCart(_that);
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
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_AddCart value)? addCart,
    TResult? Function(_DeleteCart value)? deleteCart,
  }) {
    final _that = this;
    switch (_that) {
      case _GetCart() when getCart != null:
        return getCart(_that);
      case _AddCart() when addCart != null:
        return addCart(_that);
      case _DeleteCart() when deleteCart != null:
        return deleteCart(_that);
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
    TResult Function()? getCart,
    TResult Function(String produictId)? addCart,
    TResult Function(String produictId)? deleteCart,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GetCart() when getCart != null:
        return getCart();
      case _AddCart() when addCart != null:
        return addCart(_that.produictId);
      case _DeleteCart() when deleteCart != null:
        return deleteCart(_that.produictId);
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
    required TResult Function() getCart,
    required TResult Function(String produictId) addCart,
    required TResult Function(String produictId) deleteCart,
  }) {
    final _that = this;
    switch (_that) {
      case _GetCart():
        return getCart();
      case _AddCart():
        return addCart(_that.produictId);
      case _DeleteCart():
        return deleteCart(_that.produictId);
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
    TResult? Function()? getCart,
    TResult? Function(String produictId)? addCart,
    TResult? Function(String produictId)? deleteCart,
  }) {
    final _that = this;
    switch (_that) {
      case _GetCart() when getCart != null:
        return getCart();
      case _AddCart() when addCart != null:
        return addCart(_that.produictId);
      case _DeleteCart() when deleteCart != null:
        return deleteCart(_that.produictId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _GetCart implements CartEvent {
  const _GetCart();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _GetCart);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CartEvent.getCart()';
  }
}

/// @nodoc

class _AddCart implements CartEvent {
  const _AddCart(this.produictId);

  final String produictId;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddCartCopyWith<_AddCart> get copyWith =>
      __$AddCartCopyWithImpl<_AddCart>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddCart &&
            (identical(other.produictId, produictId) ||
                other.produictId == produictId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, produictId);

  @override
  String toString() {
    return 'CartEvent.addCart(produictId: $produictId)';
  }
}

/// @nodoc
abstract mixin class _$AddCartCopyWith<$Res>
    implements $CartEventCopyWith<$Res> {
  factory _$AddCartCopyWith(_AddCart value, $Res Function(_AddCart) _then) =
      __$AddCartCopyWithImpl;
  @useResult
  $Res call({String produictId});
}

/// @nodoc
class __$AddCartCopyWithImpl<$Res> implements _$AddCartCopyWith<$Res> {
  __$AddCartCopyWithImpl(this._self, this._then);

  final _AddCart _self;
  final $Res Function(_AddCart) _then;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? produictId = null,
  }) {
    return _then(_AddCart(
      null == produictId
          ? _self.produictId
          : produictId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _DeleteCart implements CartEvent {
  const _DeleteCart(this.produictId);

  final String produictId;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeleteCartCopyWith<_DeleteCart> get copyWith =>
      __$DeleteCartCopyWithImpl<_DeleteCart>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeleteCart &&
            (identical(other.produictId, produictId) ||
                other.produictId == produictId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, produictId);

  @override
  String toString() {
    return 'CartEvent.deleteCart(produictId: $produictId)';
  }
}

/// @nodoc
abstract mixin class _$DeleteCartCopyWith<$Res>
    implements $CartEventCopyWith<$Res> {
  factory _$DeleteCartCopyWith(
          _DeleteCart value, $Res Function(_DeleteCart) _then) =
      __$DeleteCartCopyWithImpl;
  @useResult
  $Res call({String produictId});
}

/// @nodoc
class __$DeleteCartCopyWithImpl<$Res> implements _$DeleteCartCopyWith<$Res> {
  __$DeleteCartCopyWithImpl(this._self, this._then);

  final _DeleteCart _self;
  final $Res Function(_DeleteCart) _then;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? produictId = null,
  }) {
    return _then(_DeleteCart(
      null == produictId
          ? _self.produictId
          : produictId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
