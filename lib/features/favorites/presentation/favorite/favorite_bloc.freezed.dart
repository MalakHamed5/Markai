// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FavoriteState {
  List<ProductModel> get favProducts;
  bool get loading;
  String? get error;

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FavoriteStateCopyWith<FavoriteState> get copyWith =>
      _$FavoriteStateCopyWithImpl<FavoriteState>(
          this as FavoriteState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FavoriteState &&
            const DeepCollectionEquality()
                .equals(other.favProducts, favProducts) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(favProducts), loading, error);

  @override
  String toString() {
    return 'FavoriteState(favProducts: $favProducts, loading: $loading, error: $error)';
  }
}

/// @nodoc
abstract mixin class $FavoriteStateCopyWith<$Res> {
  factory $FavoriteStateCopyWith(
          FavoriteState value, $Res Function(FavoriteState) _then) =
      _$FavoriteStateCopyWithImpl;
  @useResult
  $Res call({List<ProductModel> favProducts, bool loading, String? error});
}

/// @nodoc
class _$FavoriteStateCopyWithImpl<$Res>
    implements $FavoriteStateCopyWith<$Res> {
  _$FavoriteStateCopyWithImpl(this._self, this._then);

  final FavoriteState _self;
  final $Res Function(FavoriteState) _then;

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favProducts = null,
    Object? loading = null,
    Object? error = freezed,
  }) {
    return _then(_self.copyWith(
      favProducts: null == favProducts
          ? _self.favProducts
          : favProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [FavoriteState].
extension FavoriteStatePatterns on FavoriteState {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_FavoriteState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FavoriteState() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_FavoriteState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FavoriteState():
        return $default(_that);
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_FavoriteState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FavoriteState() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<ProductModel> favProducts, bool loading, String? error)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FavoriteState() when $default != null:
        return $default(_that.favProducts, _that.loading, _that.error);
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
  TResult when<TResult extends Object?>(
    TResult Function(
            List<ProductModel> favProducts, bool loading, String? error)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FavoriteState():
        return $default(_that.favProducts, _that.loading, _that.error);
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<ProductModel> favProducts, bool loading, String? error)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FavoriteState() when $default != null:
        return $default(_that.favProducts, _that.loading, _that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FavoriteState implements FavoriteState {
  const _FavoriteState(
      {final List<ProductModel> favProducts = const <ProductModel>[],
      this.loading = false,
      this.error})
      : _favProducts = favProducts;

  final List<ProductModel> _favProducts;
  @override
  @JsonKey()
  List<ProductModel> get favProducts {
    if (_favProducts is EqualUnmodifiableListView) return _favProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favProducts);
  }

  @override
  @JsonKey()
  final bool loading;
  @override
  final String? error;

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FavoriteStateCopyWith<_FavoriteState> get copyWith =>
      __$FavoriteStateCopyWithImpl<_FavoriteState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FavoriteState &&
            const DeepCollectionEquality()
                .equals(other._favProducts, _favProducts) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_favProducts), loading, error);

  @override
  String toString() {
    return 'FavoriteState(favProducts: $favProducts, loading: $loading, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$FavoriteStateCopyWith<$Res>
    implements $FavoriteStateCopyWith<$Res> {
  factory _$FavoriteStateCopyWith(
          _FavoriteState value, $Res Function(_FavoriteState) _then) =
      __$FavoriteStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<ProductModel> favProducts, bool loading, String? error});
}

/// @nodoc
class __$FavoriteStateCopyWithImpl<$Res>
    implements _$FavoriteStateCopyWith<$Res> {
  __$FavoriteStateCopyWithImpl(this._self, this._then);

  final _FavoriteState _self;
  final $Res Function(_FavoriteState) _then;

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? favProducts = null,
    Object? loading = null,
    Object? error = freezed,
  }) {
    return _then(_FavoriteState(
      favProducts: null == favProducts
          ? _self._favProducts
          : favProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$FavoriteEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FavoriteEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FavoriteEvent()';
  }
}

/// @nodoc
class $FavoriteEventCopyWith<$Res> {
  $FavoriteEventCopyWith(FavoriteEvent _, $Res Function(FavoriteEvent) __);
}

/// Adds pattern-matching-related methods to [FavoriteEvent].
extension FavoriteEventPatterns on FavoriteEvent {
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
    TResult Function(_GetFavorites value)? getFavorites,
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GetFavorites() when getFavorites != null:
        return getFavorites(_that);
      case _ToggleFavorite() when toggleFavorite != null:
        return toggleFavorite(_that);
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
    required TResult Function(_GetFavorites value) getFavorites,
    required TResult Function(_ToggleFavorite value) toggleFavorite,
  }) {
    final _that = this;
    switch (_that) {
      case _GetFavorites():
        return getFavorites(_that);
      case _ToggleFavorite():
        return toggleFavorite(_that);
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
    TResult? Function(_GetFavorites value)? getFavorites,
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
  }) {
    final _that = this;
    switch (_that) {
      case _GetFavorites() when getFavorites != null:
        return getFavorites(_that);
      case _ToggleFavorite() when toggleFavorite != null:
        return toggleFavorite(_that);
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
    TResult Function()? getFavorites,
    TResult Function(ProductModel product)? toggleFavorite,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GetFavorites() when getFavorites != null:
        return getFavorites();
      case _ToggleFavorite() when toggleFavorite != null:
        return toggleFavorite(_that.product);
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
    required TResult Function() getFavorites,
    required TResult Function(ProductModel product) toggleFavorite,
  }) {
    final _that = this;
    switch (_that) {
      case _GetFavorites():
        return getFavorites();
      case _ToggleFavorite():
        return toggleFavorite(_that.product);
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
    TResult? Function()? getFavorites,
    TResult? Function(ProductModel product)? toggleFavorite,
  }) {
    final _that = this;
    switch (_that) {
      case _GetFavorites() when getFavorites != null:
        return getFavorites();
      case _ToggleFavorite() when toggleFavorite != null:
        return toggleFavorite(_that.product);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _GetFavorites implements FavoriteEvent {
  const _GetFavorites();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _GetFavorites);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FavoriteEvent.getFavorites()';
  }
}

/// @nodoc

class _ToggleFavorite implements FavoriteEvent {
  const _ToggleFavorite({required this.product});

  final ProductModel product;

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ToggleFavoriteCopyWith<_ToggleFavorite> get copyWith =>
      __$ToggleFavoriteCopyWithImpl<_ToggleFavorite>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ToggleFavorite &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @override
  String toString() {
    return 'FavoriteEvent.toggleFavorite(product: $product)';
  }
}

/// @nodoc
abstract mixin class _$ToggleFavoriteCopyWith<$Res>
    implements $FavoriteEventCopyWith<$Res> {
  factory _$ToggleFavoriteCopyWith(
          _ToggleFavorite value, $Res Function(_ToggleFavorite) _then) =
      __$ToggleFavoriteCopyWithImpl;
  @useResult
  $Res call({ProductModel product});
}

/// @nodoc
class __$ToggleFavoriteCopyWithImpl<$Res>
    implements _$ToggleFavoriteCopyWith<$Res> {
  __$ToggleFavoriteCopyWithImpl(this._self, this._then);

  final _ToggleFavorite _self;
  final $Res Function(_ToggleFavorite) _then;

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = null,
  }) {
    return _then(_ToggleFavorite(
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
    ));
  }
}

// dart format on
