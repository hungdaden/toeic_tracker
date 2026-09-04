// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phx_screen_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PHXScreenResponseEntity {
  PHXScreenDataEntity? get data;

  /// Create a copy of PHXScreenResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXScreenResponseEntityCopyWith<PHXScreenResponseEntity> get copyWith =>
      _$PHXScreenResponseEntityCopyWithImpl<PHXScreenResponseEntity>(
          this as PHXScreenResponseEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXScreenResponseEntity &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @override
  String toString() {
    return 'PHXScreenResponseEntity(data: $data)';
  }
}

/// @nodoc
abstract mixin class $PHXScreenResponseEntityCopyWith<$Res> {
  factory $PHXScreenResponseEntityCopyWith(PHXScreenResponseEntity value,
          $Res Function(PHXScreenResponseEntity) _then) =
      _$PHXScreenResponseEntityCopyWithImpl;
  @useResult
  $Res call({PHXScreenDataEntity? data});

  $PHXScreenDataEntityCopyWith<$Res>? get data;
}

/// @nodoc
class _$PHXScreenResponseEntityCopyWithImpl<$Res>
    implements $PHXScreenResponseEntityCopyWith<$Res> {
  _$PHXScreenResponseEntityCopyWithImpl(this._self, this._then);

  final PHXScreenResponseEntity _self;
  final $Res Function(PHXScreenResponseEntity) _then;

  /// Create a copy of PHXScreenResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_self.copyWith(
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as PHXScreenDataEntity?,
    ));
  }

  /// Create a copy of PHXScreenResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXScreenDataEntityCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $PHXScreenDataEntityCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PHXScreenResponseEntity].
extension PHXScreenResponseEntityPatterns on PHXScreenResponseEntity {
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
    TResult Function(_PHXScreenResponseEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXScreenResponseEntity() when $default != null:
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
    TResult Function(_PHXScreenResponseEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXScreenResponseEntity():
        return $default(_that);
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
    TResult? Function(_PHXScreenResponseEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXScreenResponseEntity() when $default != null:
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
    TResult Function(PHXScreenDataEntity? data)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXScreenResponseEntity() when $default != null:
        return $default(_that.data);
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
    TResult Function(PHXScreenDataEntity? data) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXScreenResponseEntity():
        return $default(_that.data);
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
    TResult? Function(PHXScreenDataEntity? data)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXScreenResponseEntity() when $default != null:
        return $default(_that.data);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PHXScreenResponseEntity extends PHXScreenResponseEntity {
  const _PHXScreenResponseEntity({this.data}) : super._();

  @override
  final PHXScreenDataEntity? data;

  /// Create a copy of PHXScreenResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXScreenResponseEntityCopyWith<_PHXScreenResponseEntity> get copyWith =>
      __$PHXScreenResponseEntityCopyWithImpl<_PHXScreenResponseEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXScreenResponseEntity &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @override
  String toString() {
    return 'PHXScreenResponseEntity(data: $data)';
  }
}

/// @nodoc
abstract mixin class _$PHXScreenResponseEntityCopyWith<$Res>
    implements $PHXScreenResponseEntityCopyWith<$Res> {
  factory _$PHXScreenResponseEntityCopyWith(_PHXScreenResponseEntity value,
          $Res Function(_PHXScreenResponseEntity) _then) =
      __$PHXScreenResponseEntityCopyWithImpl;
  @override
  @useResult
  $Res call({PHXScreenDataEntity? data});

  @override
  $PHXScreenDataEntityCopyWith<$Res>? get data;
}

/// @nodoc
class __$PHXScreenResponseEntityCopyWithImpl<$Res>
    implements _$PHXScreenResponseEntityCopyWith<$Res> {
  __$PHXScreenResponseEntityCopyWithImpl(this._self, this._then);

  final _PHXScreenResponseEntity _self;
  final $Res Function(_PHXScreenResponseEntity) _then;

  /// Create a copy of PHXScreenResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_PHXScreenResponseEntity(
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as PHXScreenDataEntity?,
    ));
  }

  /// Create a copy of PHXScreenResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXScreenDataEntityCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $PHXScreenDataEntityCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc
mixin _$PHXScreenDataEntity {
  PHXAppBarEntity? get appBar;
  PHXHeaderInfoEntity? get headerInfo;
  List<PHXTabEntity>? get tabs;
  List<PHXSectionEntity>? get sections;
  List<PHXSectionEntity>? get sectionsBottomSheet;
  List<PHXListOptionEntity>? get listOptions;
  List<PHXBottomActionEntity>? get bottomActions;
  PHXTableEntity? get table;
  PHXEmptyStateEntity? get emptyState;

  /// Create a copy of PHXScreenDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXScreenDataEntityCopyWith<PHXScreenDataEntity> get copyWith =>
      _$PHXScreenDataEntityCopyWithImpl<PHXScreenDataEntity>(
          this as PHXScreenDataEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXScreenDataEntity &&
            (identical(other.appBar, appBar) || other.appBar == appBar) &&
            (identical(other.headerInfo, headerInfo) ||
                other.headerInfo == headerInfo) &&
            const DeepCollectionEquality().equals(other.tabs, tabs) &&
            const DeepCollectionEquality().equals(other.sections, sections) &&
            const DeepCollectionEquality()
                .equals(other.sectionsBottomSheet, sectionsBottomSheet) &&
            const DeepCollectionEquality()
                .equals(other.listOptions, listOptions) &&
            const DeepCollectionEquality()
                .equals(other.bottomActions, bottomActions) &&
            (identical(other.table, table) || other.table == table) &&
            (identical(other.emptyState, emptyState) ||
                other.emptyState == emptyState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      appBar,
      headerInfo,
      const DeepCollectionEquality().hash(tabs),
      const DeepCollectionEquality().hash(sections),
      const DeepCollectionEquality().hash(sectionsBottomSheet),
      const DeepCollectionEquality().hash(listOptions),
      const DeepCollectionEquality().hash(bottomActions),
      table,
      emptyState);

  @override
  String toString() {
    return 'PHXScreenDataEntity(appBar: $appBar, headerInfo: $headerInfo, tabs: $tabs, sections: $sections, sectionsBottomSheet: $sectionsBottomSheet, listOptions: $listOptions, bottomActions: $bottomActions, table: $table, emptyState: $emptyState)';
  }
}

/// @nodoc
abstract mixin class $PHXScreenDataEntityCopyWith<$Res> {
  factory $PHXScreenDataEntityCopyWith(
          PHXScreenDataEntity value, $Res Function(PHXScreenDataEntity) _then) =
      _$PHXScreenDataEntityCopyWithImpl;
  @useResult
  $Res call(
      {PHXAppBarEntity? appBar,
      PHXHeaderInfoEntity? headerInfo,
      List<PHXTabEntity>? tabs,
      List<PHXSectionEntity>? sections,
      List<PHXSectionEntity>? sectionsBottomSheet,
      List<PHXListOptionEntity>? listOptions,
      List<PHXBottomActionEntity>? bottomActions,
      PHXTableEntity? table,
      PHXEmptyStateEntity? emptyState});

  $PHXAppBarEntityCopyWith<$Res>? get appBar;
  $PHXHeaderInfoEntityCopyWith<$Res>? get headerInfo;
  $PHXTableEntityCopyWith<$Res>? get table;
  $PHXEmptyStateEntityCopyWith<$Res>? get emptyState;
}

/// @nodoc
class _$PHXScreenDataEntityCopyWithImpl<$Res>
    implements $PHXScreenDataEntityCopyWith<$Res> {
  _$PHXScreenDataEntityCopyWithImpl(this._self, this._then);

  final PHXScreenDataEntity _self;
  final $Res Function(PHXScreenDataEntity) _then;

  /// Create a copy of PHXScreenDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appBar = freezed,
    Object? headerInfo = freezed,
    Object? tabs = freezed,
    Object? sections = freezed,
    Object? sectionsBottomSheet = freezed,
    Object? listOptions = freezed,
    Object? bottomActions = freezed,
    Object? table = freezed,
    Object? emptyState = freezed,
  }) {
    return _then(_self.copyWith(
      appBar: freezed == appBar
          ? _self.appBar
          : appBar // ignore: cast_nullable_to_non_nullable
              as PHXAppBarEntity?,
      headerInfo: freezed == headerInfo
          ? _self.headerInfo
          : headerInfo // ignore: cast_nullable_to_non_nullable
              as PHXHeaderInfoEntity?,
      tabs: freezed == tabs
          ? _self.tabs
          : tabs // ignore: cast_nullable_to_non_nullable
              as List<PHXTabEntity>?,
      sections: freezed == sections
          ? _self.sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<PHXSectionEntity>?,
      sectionsBottomSheet: freezed == sectionsBottomSheet
          ? _self.sectionsBottomSheet
          : sectionsBottomSheet // ignore: cast_nullable_to_non_nullable
              as List<PHXSectionEntity>?,
      listOptions: freezed == listOptions
          ? _self.listOptions
          : listOptions // ignore: cast_nullable_to_non_nullable
              as List<PHXListOptionEntity>?,
      bottomActions: freezed == bottomActions
          ? _self.bottomActions
          : bottomActions // ignore: cast_nullable_to_non_nullable
              as List<PHXBottomActionEntity>?,
      table: freezed == table
          ? _self.table
          : table // ignore: cast_nullable_to_non_nullable
              as PHXTableEntity?,
      emptyState: freezed == emptyState
          ? _self.emptyState
          : emptyState // ignore: cast_nullable_to_non_nullable
              as PHXEmptyStateEntity?,
    ));
  }

  /// Create a copy of PHXScreenDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXAppBarEntityCopyWith<$Res>? get appBar {
    if (_self.appBar == null) {
      return null;
    }

    return $PHXAppBarEntityCopyWith<$Res>(_self.appBar!, (value) {
      return _then(_self.copyWith(appBar: value));
    });
  }

  /// Create a copy of PHXScreenDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXHeaderInfoEntityCopyWith<$Res>? get headerInfo {
    if (_self.headerInfo == null) {
      return null;
    }

    return $PHXHeaderInfoEntityCopyWith<$Res>(_self.headerInfo!, (value) {
      return _then(_self.copyWith(headerInfo: value));
    });
  }

  /// Create a copy of PHXScreenDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXTableEntityCopyWith<$Res>? get table {
    if (_self.table == null) {
      return null;
    }

    return $PHXTableEntityCopyWith<$Res>(_self.table!, (value) {
      return _then(_self.copyWith(table: value));
    });
  }

  /// Create a copy of PHXScreenDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXEmptyStateEntityCopyWith<$Res>? get emptyState {
    if (_self.emptyState == null) {
      return null;
    }

    return $PHXEmptyStateEntityCopyWith<$Res>(_self.emptyState!, (value) {
      return _then(_self.copyWith(emptyState: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PHXScreenDataEntity].
extension PHXScreenDataEntityPatterns on PHXScreenDataEntity {
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
    TResult Function(_PHXScreenDataEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXScreenDataEntity() when $default != null:
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
    TResult Function(_PHXScreenDataEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXScreenDataEntity():
        return $default(_that);
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
    TResult? Function(_PHXScreenDataEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXScreenDataEntity() when $default != null:
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
            PHXAppBarEntity? appBar,
            PHXHeaderInfoEntity? headerInfo,
            List<PHXTabEntity>? tabs,
            List<PHXSectionEntity>? sections,
            List<PHXSectionEntity>? sectionsBottomSheet,
            List<PHXListOptionEntity>? listOptions,
            List<PHXBottomActionEntity>? bottomActions,
            PHXTableEntity? table,
            PHXEmptyStateEntity? emptyState)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXScreenDataEntity() when $default != null:
        return $default(
            _that.appBar,
            _that.headerInfo,
            _that.tabs,
            _that.sections,
            _that.sectionsBottomSheet,
            _that.listOptions,
            _that.bottomActions,
            _that.table,
            _that.emptyState);
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
            PHXAppBarEntity? appBar,
            PHXHeaderInfoEntity? headerInfo,
            List<PHXTabEntity>? tabs,
            List<PHXSectionEntity>? sections,
            List<PHXSectionEntity>? sectionsBottomSheet,
            List<PHXListOptionEntity>? listOptions,
            List<PHXBottomActionEntity>? bottomActions,
            PHXTableEntity? table,
            PHXEmptyStateEntity? emptyState)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXScreenDataEntity():
        return $default(
            _that.appBar,
            _that.headerInfo,
            _that.tabs,
            _that.sections,
            _that.sectionsBottomSheet,
            _that.listOptions,
            _that.bottomActions,
            _that.table,
            _that.emptyState);
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
            PHXAppBarEntity? appBar,
            PHXHeaderInfoEntity? headerInfo,
            List<PHXTabEntity>? tabs,
            List<PHXSectionEntity>? sections,
            List<PHXSectionEntity>? sectionsBottomSheet,
            List<PHXListOptionEntity>? listOptions,
            List<PHXBottomActionEntity>? bottomActions,
            PHXTableEntity? table,
            PHXEmptyStateEntity? emptyState)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXScreenDataEntity() when $default != null:
        return $default(
            _that.appBar,
            _that.headerInfo,
            _that.tabs,
            _that.sections,
            _that.sectionsBottomSheet,
            _that.listOptions,
            _that.bottomActions,
            _that.table,
            _that.emptyState);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PHXScreenDataEntity extends PHXScreenDataEntity {
  const _PHXScreenDataEntity(
      {this.appBar,
      this.headerInfo,
      final List<PHXTabEntity>? tabs = const [],
      final List<PHXSectionEntity>? sections = const [],
      final List<PHXSectionEntity>? sectionsBottomSheet = const [],
      final List<PHXListOptionEntity>? listOptions = const [],
      final List<PHXBottomActionEntity>? bottomActions = const [],
      this.table = const PHXTableEntity(),
      this.emptyState})
      : _tabs = tabs,
        _sections = sections,
        _sectionsBottomSheet = sectionsBottomSheet,
        _listOptions = listOptions,
        _bottomActions = bottomActions,
        super._();

  @override
  final PHXAppBarEntity? appBar;
  @override
  final PHXHeaderInfoEntity? headerInfo;
  final List<PHXTabEntity>? _tabs;
  @override
  @JsonKey()
  List<PHXTabEntity>? get tabs {
    final value = _tabs;
    if (value == null) return null;
    if (_tabs is EqualUnmodifiableListView) return _tabs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<PHXSectionEntity>? _sections;
  @override
  @JsonKey()
  List<PHXSectionEntity>? get sections {
    final value = _sections;
    if (value == null) return null;
    if (_sections is EqualUnmodifiableListView) return _sections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<PHXSectionEntity>? _sectionsBottomSheet;
  @override
  @JsonKey()
  List<PHXSectionEntity>? get sectionsBottomSheet {
    final value = _sectionsBottomSheet;
    if (value == null) return null;
    if (_sectionsBottomSheet is EqualUnmodifiableListView)
      return _sectionsBottomSheet;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<PHXListOptionEntity>? _listOptions;
  @override
  @JsonKey()
  List<PHXListOptionEntity>? get listOptions {
    final value = _listOptions;
    if (value == null) return null;
    if (_listOptions is EqualUnmodifiableListView) return _listOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<PHXBottomActionEntity>? _bottomActions;
  @override
  @JsonKey()
  List<PHXBottomActionEntity>? get bottomActions {
    final value = _bottomActions;
    if (value == null) return null;
    if (_bottomActions is EqualUnmodifiableListView) return _bottomActions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final PHXTableEntity? table;
  @override
  final PHXEmptyStateEntity? emptyState;

  /// Create a copy of PHXScreenDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXScreenDataEntityCopyWith<_PHXScreenDataEntity> get copyWith =>
      __$PHXScreenDataEntityCopyWithImpl<_PHXScreenDataEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXScreenDataEntity &&
            (identical(other.appBar, appBar) || other.appBar == appBar) &&
            (identical(other.headerInfo, headerInfo) ||
                other.headerInfo == headerInfo) &&
            const DeepCollectionEquality().equals(other._tabs, _tabs) &&
            const DeepCollectionEquality().equals(other._sections, _sections) &&
            const DeepCollectionEquality()
                .equals(other._sectionsBottomSheet, _sectionsBottomSheet) &&
            const DeepCollectionEquality()
                .equals(other._listOptions, _listOptions) &&
            const DeepCollectionEquality()
                .equals(other._bottomActions, _bottomActions) &&
            (identical(other.table, table) || other.table == table) &&
            (identical(other.emptyState, emptyState) ||
                other.emptyState == emptyState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      appBar,
      headerInfo,
      const DeepCollectionEquality().hash(_tabs),
      const DeepCollectionEquality().hash(_sections),
      const DeepCollectionEquality().hash(_sectionsBottomSheet),
      const DeepCollectionEquality().hash(_listOptions),
      const DeepCollectionEquality().hash(_bottomActions),
      table,
      emptyState);

  @override
  String toString() {
    return 'PHXScreenDataEntity(appBar: $appBar, headerInfo: $headerInfo, tabs: $tabs, sections: $sections, sectionsBottomSheet: $sectionsBottomSheet, listOptions: $listOptions, bottomActions: $bottomActions, table: $table, emptyState: $emptyState)';
  }
}

/// @nodoc
abstract mixin class _$PHXScreenDataEntityCopyWith<$Res>
    implements $PHXScreenDataEntityCopyWith<$Res> {
  factory _$PHXScreenDataEntityCopyWith(_PHXScreenDataEntity value,
          $Res Function(_PHXScreenDataEntity) _then) =
      __$PHXScreenDataEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {PHXAppBarEntity? appBar,
      PHXHeaderInfoEntity? headerInfo,
      List<PHXTabEntity>? tabs,
      List<PHXSectionEntity>? sections,
      List<PHXSectionEntity>? sectionsBottomSheet,
      List<PHXListOptionEntity>? listOptions,
      List<PHXBottomActionEntity>? bottomActions,
      PHXTableEntity? table,
      PHXEmptyStateEntity? emptyState});

  @override
  $PHXAppBarEntityCopyWith<$Res>? get appBar;
  @override
  $PHXHeaderInfoEntityCopyWith<$Res>? get headerInfo;
  @override
  $PHXTableEntityCopyWith<$Res>? get table;
  @override
  $PHXEmptyStateEntityCopyWith<$Res>? get emptyState;
}

/// @nodoc
class __$PHXScreenDataEntityCopyWithImpl<$Res>
    implements _$PHXScreenDataEntityCopyWith<$Res> {
  __$PHXScreenDataEntityCopyWithImpl(this._self, this._then);

  final _PHXScreenDataEntity _self;
  final $Res Function(_PHXScreenDataEntity) _then;

  /// Create a copy of PHXScreenDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? appBar = freezed,
    Object? headerInfo = freezed,
    Object? tabs = freezed,
    Object? sections = freezed,
    Object? sectionsBottomSheet = freezed,
    Object? listOptions = freezed,
    Object? bottomActions = freezed,
    Object? table = freezed,
    Object? emptyState = freezed,
  }) {
    return _then(_PHXScreenDataEntity(
      appBar: freezed == appBar
          ? _self.appBar
          : appBar // ignore: cast_nullable_to_non_nullable
              as PHXAppBarEntity?,
      headerInfo: freezed == headerInfo
          ? _self.headerInfo
          : headerInfo // ignore: cast_nullable_to_non_nullable
              as PHXHeaderInfoEntity?,
      tabs: freezed == tabs
          ? _self._tabs
          : tabs // ignore: cast_nullable_to_non_nullable
              as List<PHXTabEntity>?,
      sections: freezed == sections
          ? _self._sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<PHXSectionEntity>?,
      sectionsBottomSheet: freezed == sectionsBottomSheet
          ? _self._sectionsBottomSheet
          : sectionsBottomSheet // ignore: cast_nullable_to_non_nullable
              as List<PHXSectionEntity>?,
      listOptions: freezed == listOptions
          ? _self._listOptions
          : listOptions // ignore: cast_nullable_to_non_nullable
              as List<PHXListOptionEntity>?,
      bottomActions: freezed == bottomActions
          ? _self._bottomActions
          : bottomActions // ignore: cast_nullable_to_non_nullable
              as List<PHXBottomActionEntity>?,
      table: freezed == table
          ? _self.table
          : table // ignore: cast_nullable_to_non_nullable
              as PHXTableEntity?,
      emptyState: freezed == emptyState
          ? _self.emptyState
          : emptyState // ignore: cast_nullable_to_non_nullable
              as PHXEmptyStateEntity?,
    ));
  }

  /// Create a copy of PHXScreenDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXAppBarEntityCopyWith<$Res>? get appBar {
    if (_self.appBar == null) {
      return null;
    }

    return $PHXAppBarEntityCopyWith<$Res>(_self.appBar!, (value) {
      return _then(_self.copyWith(appBar: value));
    });
  }

  /// Create a copy of PHXScreenDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXHeaderInfoEntityCopyWith<$Res>? get headerInfo {
    if (_self.headerInfo == null) {
      return null;
    }

    return $PHXHeaderInfoEntityCopyWith<$Res>(_self.headerInfo!, (value) {
      return _then(_self.copyWith(headerInfo: value));
    });
  }

  /// Create a copy of PHXScreenDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXTableEntityCopyWith<$Res>? get table {
    if (_self.table == null) {
      return null;
    }

    return $PHXTableEntityCopyWith<$Res>(_self.table!, (value) {
      return _then(_self.copyWith(table: value));
    });
  }

  /// Create a copy of PHXScreenDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXEmptyStateEntityCopyWith<$Res>? get emptyState {
    if (_self.emptyState == null) {
      return null;
    }

    return $PHXEmptyStateEntityCopyWith<$Res>(_self.emptyState!, (value) {
      return _then(_self.copyWith(emptyState: value));
    });
  }
}

/// @nodoc
mixin _$PHXHeaderInfoEntity {
  String? get title;
  String? get content;
  String? get avatar;

  /// Create a copy of PHXHeaderInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXHeaderInfoEntityCopyWith<PHXHeaderInfoEntity> get copyWith =>
      _$PHXHeaderInfoEntityCopyWithImpl<PHXHeaderInfoEntity>(
          this as PHXHeaderInfoEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXHeaderInfoEntity &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, content, avatar);

  @override
  String toString() {
    return 'PHXHeaderInfoEntity(title: $title, content: $content, avatar: $avatar)';
  }
}

/// @nodoc
abstract mixin class $PHXHeaderInfoEntityCopyWith<$Res> {
  factory $PHXHeaderInfoEntityCopyWith(
          PHXHeaderInfoEntity value, $Res Function(PHXHeaderInfoEntity) _then) =
      _$PHXHeaderInfoEntityCopyWithImpl;
  @useResult
  $Res call({String? title, String? content, String? avatar});
}

/// @nodoc
class _$PHXHeaderInfoEntityCopyWithImpl<$Res>
    implements $PHXHeaderInfoEntityCopyWith<$Res> {
  _$PHXHeaderInfoEntityCopyWithImpl(this._self, this._then);

  final PHXHeaderInfoEntity _self;
  final $Res Function(PHXHeaderInfoEntity) _then;

  /// Create a copy of PHXHeaderInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_self.copyWith(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PHXHeaderInfoEntity].
extension PHXHeaderInfoEntityPatterns on PHXHeaderInfoEntity {
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
    TResult Function(_PHXHeaderInfoEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXHeaderInfoEntity() when $default != null:
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
    TResult Function(_PHXHeaderInfoEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXHeaderInfoEntity():
        return $default(_that);
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
    TResult? Function(_PHXHeaderInfoEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXHeaderInfoEntity() when $default != null:
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
    TResult Function(String? title, String? content, String? avatar)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXHeaderInfoEntity() when $default != null:
        return $default(_that.title, _that.content, _that.avatar);
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
    TResult Function(String? title, String? content, String? avatar) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXHeaderInfoEntity():
        return $default(_that.title, _that.content, _that.avatar);
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
    TResult? Function(String? title, String? content, String? avatar)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXHeaderInfoEntity() when $default != null:
        return $default(_that.title, _that.content, _that.avatar);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PHXHeaderInfoEntity extends PHXHeaderInfoEntity {
  const _PHXHeaderInfoEntity(
      {this.title = '', this.content = '', this.avatar = ''})
      : super._();

  @override
  @JsonKey()
  final String? title;
  @override
  @JsonKey()
  final String? content;
  @override
  @JsonKey()
  final String? avatar;

  /// Create a copy of PHXHeaderInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXHeaderInfoEntityCopyWith<_PHXHeaderInfoEntity> get copyWith =>
      __$PHXHeaderInfoEntityCopyWithImpl<_PHXHeaderInfoEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXHeaderInfoEntity &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, content, avatar);

  @override
  String toString() {
    return 'PHXHeaderInfoEntity(title: $title, content: $content, avatar: $avatar)';
  }
}

/// @nodoc
abstract mixin class _$PHXHeaderInfoEntityCopyWith<$Res>
    implements $PHXHeaderInfoEntityCopyWith<$Res> {
  factory _$PHXHeaderInfoEntityCopyWith(_PHXHeaderInfoEntity value,
          $Res Function(_PHXHeaderInfoEntity) _then) =
      __$PHXHeaderInfoEntityCopyWithImpl;
  @override
  @useResult
  $Res call({String? title, String? content, String? avatar});
}

/// @nodoc
class __$PHXHeaderInfoEntityCopyWithImpl<$Res>
    implements _$PHXHeaderInfoEntityCopyWith<$Res> {
  __$PHXHeaderInfoEntityCopyWithImpl(this._self, this._then);

  final _PHXHeaderInfoEntity _self;
  final $Res Function(_PHXHeaderInfoEntity) _then;

  /// Create a copy of PHXHeaderInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_PHXHeaderInfoEntity(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$PHXAppBarEntity {
  String? get title;
  String? get subTitle;

  /// Create a copy of PHXAppBarEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXAppBarEntityCopyWith<PHXAppBarEntity> get copyWith =>
      _$PHXAppBarEntityCopyWithImpl<PHXAppBarEntity>(
          this as PHXAppBarEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXAppBarEntity &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, subTitle);

  @override
  String toString() {
    return 'PHXAppBarEntity(title: $title, subTitle: $subTitle)';
  }
}

/// @nodoc
abstract mixin class $PHXAppBarEntityCopyWith<$Res> {
  factory $PHXAppBarEntityCopyWith(
          PHXAppBarEntity value, $Res Function(PHXAppBarEntity) _then) =
      _$PHXAppBarEntityCopyWithImpl;
  @useResult
  $Res call({String? title, String? subTitle});
}

/// @nodoc
class _$PHXAppBarEntityCopyWithImpl<$Res>
    implements $PHXAppBarEntityCopyWith<$Res> {
  _$PHXAppBarEntityCopyWithImpl(this._self, this._then);

  final PHXAppBarEntity _self;
  final $Res Function(PHXAppBarEntity) _then;

  /// Create a copy of PHXAppBarEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? subTitle = freezed,
  }) {
    return _then(_self.copyWith(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subTitle: freezed == subTitle
          ? _self.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PHXAppBarEntity].
extension PHXAppBarEntityPatterns on PHXAppBarEntity {
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
    TResult Function(_PHXAppBarEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXAppBarEntity() when $default != null:
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
    TResult Function(_PHXAppBarEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXAppBarEntity():
        return $default(_that);
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
    TResult? Function(_PHXAppBarEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXAppBarEntity() when $default != null:
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
    TResult Function(String? title, String? subTitle)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXAppBarEntity() when $default != null:
        return $default(_that.title, _that.subTitle);
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
    TResult Function(String? title, String? subTitle) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXAppBarEntity():
        return $default(_that.title, _that.subTitle);
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
    TResult? Function(String? title, String? subTitle)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXAppBarEntity() when $default != null:
        return $default(_that.title, _that.subTitle);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PHXAppBarEntity extends PHXAppBarEntity {
  const _PHXAppBarEntity({this.title = '', this.subTitle = ''}) : super._();

  @override
  @JsonKey()
  final String? title;
  @override
  @JsonKey()
  final String? subTitle;

  /// Create a copy of PHXAppBarEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXAppBarEntityCopyWith<_PHXAppBarEntity> get copyWith =>
      __$PHXAppBarEntityCopyWithImpl<_PHXAppBarEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXAppBarEntity &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, subTitle);

  @override
  String toString() {
    return 'PHXAppBarEntity(title: $title, subTitle: $subTitle)';
  }
}

/// @nodoc
abstract mixin class _$PHXAppBarEntityCopyWith<$Res>
    implements $PHXAppBarEntityCopyWith<$Res> {
  factory _$PHXAppBarEntityCopyWith(
          _PHXAppBarEntity value, $Res Function(_PHXAppBarEntity) _then) =
      __$PHXAppBarEntityCopyWithImpl;
  @override
  @useResult
  $Res call({String? title, String? subTitle});
}

/// @nodoc
class __$PHXAppBarEntityCopyWithImpl<$Res>
    implements _$PHXAppBarEntityCopyWith<$Res> {
  __$PHXAppBarEntityCopyWithImpl(this._self, this._then);

  final _PHXAppBarEntity _self;
  final $Res Function(_PHXAppBarEntity) _then;

  /// Create a copy of PHXAppBarEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? subTitle = freezed,
  }) {
    return _then(_PHXAppBarEntity(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subTitle: freezed == subTitle
          ? _self.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$PHXTabEntity {
  String? get title;
  int? get id;
  String? get code;
  String? get content;
  bool? get isTarget;
  bool? get isActive;
  int? get count;
  PHXExtraEntity? get extra;

  /// Create a copy of PHXTabEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXTabEntityCopyWith<PHXTabEntity> get copyWith =>
      _$PHXTabEntityCopyWithImpl<PHXTabEntity>(
          this as PHXTabEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXTabEntity &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.isTarget, isTarget) ||
                other.isTarget == isTarget) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.extra, extra) || other.extra == extra));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, title, id, code, content, isTarget, isActive, count, extra);

  @override
  String toString() {
    return 'PHXTabEntity(title: $title, id: $id, code: $code, content: $content, isTarget: $isTarget, isActive: $isActive, count: $count, extra: $extra)';
  }
}

/// @nodoc
abstract mixin class $PHXTabEntityCopyWith<$Res> {
  factory $PHXTabEntityCopyWith(
          PHXTabEntity value, $Res Function(PHXTabEntity) _then) =
      _$PHXTabEntityCopyWithImpl;
  @useResult
  $Res call(
      {String? title,
      int? id,
      String? code,
      String? content,
      bool? isTarget,
      bool? isActive,
      int? count,
      PHXExtraEntity? extra});

  $PHXExtraEntityCopyWith<$Res>? get extra;
}

/// @nodoc
class _$PHXTabEntityCopyWithImpl<$Res> implements $PHXTabEntityCopyWith<$Res> {
  _$PHXTabEntityCopyWithImpl(this._self, this._then);

  final PHXTabEntity _self;
  final $Res Function(PHXTabEntity) _then;

  /// Create a copy of PHXTabEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? id = freezed,
    Object? code = freezed,
    Object? content = freezed,
    Object? isTarget = freezed,
    Object? isActive = freezed,
    Object? count = freezed,
    Object? extra = freezed,
  }) {
    return _then(_self.copyWith(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      isTarget: freezed == isTarget
          ? _self.isTarget
          : isTarget // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      count: freezed == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      extra: freezed == extra
          ? _self.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as PHXExtraEntity?,
    ));
  }

  /// Create a copy of PHXTabEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXExtraEntityCopyWith<$Res>? get extra {
    if (_self.extra == null) {
      return null;
    }

    return $PHXExtraEntityCopyWith<$Res>(_self.extra!, (value) {
      return _then(_self.copyWith(extra: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PHXTabEntity].
extension PHXTabEntityPatterns on PHXTabEntity {
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
    TResult Function(_PHXTabEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXTabEntity() when $default != null:
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
    TResult Function(_PHXTabEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXTabEntity():
        return $default(_that);
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
    TResult? Function(_PHXTabEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXTabEntity() when $default != null:
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
    TResult Function(String? title, int? id, String? code, String? content,
            bool? isTarget, bool? isActive, int? count, PHXExtraEntity? extra)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXTabEntity() when $default != null:
        return $default(_that.title, _that.id, _that.code, _that.content,
            _that.isTarget, _that.isActive, _that.count, _that.extra);
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
    TResult Function(String? title, int? id, String? code, String? content,
            bool? isTarget, bool? isActive, int? count, PHXExtraEntity? extra)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXTabEntity():
        return $default(_that.title, _that.id, _that.code, _that.content,
            _that.isTarget, _that.isActive, _that.count, _that.extra);
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
    TResult? Function(String? title, int? id, String? code, String? content,
            bool? isTarget, bool? isActive, int? count, PHXExtraEntity? extra)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXTabEntity() when $default != null:
        return $default(_that.title, _that.id, _that.code, _that.content,
            _that.isTarget, _that.isActive, _that.count, _that.extra);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PHXTabEntity extends PHXTabEntity {
  const _PHXTabEntity(
      {this.title = '',
      this.id = 0,
      this.code = '',
      this.content = '',
      this.isTarget = false,
      this.isActive = false,
      this.count = null,
      this.extra = null})
      : super._();

  @override
  @JsonKey()
  final String? title;
  @override
  @JsonKey()
  final int? id;
  @override
  @JsonKey()
  final String? code;
  @override
  @JsonKey()
  final String? content;
  @override
  @JsonKey()
  final bool? isTarget;
  @override
  @JsonKey()
  final bool? isActive;
  @override
  @JsonKey()
  final int? count;
  @override
  @JsonKey()
  final PHXExtraEntity? extra;

  /// Create a copy of PHXTabEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXTabEntityCopyWith<_PHXTabEntity> get copyWith =>
      __$PHXTabEntityCopyWithImpl<_PHXTabEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXTabEntity &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.isTarget, isTarget) ||
                other.isTarget == isTarget) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.extra, extra) || other.extra == extra));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, title, id, code, content, isTarget, isActive, count, extra);

  @override
  String toString() {
    return 'PHXTabEntity(title: $title, id: $id, code: $code, content: $content, isTarget: $isTarget, isActive: $isActive, count: $count, extra: $extra)';
  }
}

/// @nodoc
abstract mixin class _$PHXTabEntityCopyWith<$Res>
    implements $PHXTabEntityCopyWith<$Res> {
  factory _$PHXTabEntityCopyWith(
          _PHXTabEntity value, $Res Function(_PHXTabEntity) _then) =
      __$PHXTabEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? title,
      int? id,
      String? code,
      String? content,
      bool? isTarget,
      bool? isActive,
      int? count,
      PHXExtraEntity? extra});

  @override
  $PHXExtraEntityCopyWith<$Res>? get extra;
}

/// @nodoc
class __$PHXTabEntityCopyWithImpl<$Res>
    implements _$PHXTabEntityCopyWith<$Res> {
  __$PHXTabEntityCopyWithImpl(this._self, this._then);

  final _PHXTabEntity _self;
  final $Res Function(_PHXTabEntity) _then;

  /// Create a copy of PHXTabEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? id = freezed,
    Object? code = freezed,
    Object? content = freezed,
    Object? isTarget = freezed,
    Object? isActive = freezed,
    Object? count = freezed,
    Object? extra = freezed,
  }) {
    return _then(_PHXTabEntity(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      isTarget: freezed == isTarget
          ? _self.isTarget
          : isTarget // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      count: freezed == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      extra: freezed == extra
          ? _self.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as PHXExtraEntity?,
    ));
  }

  /// Create a copy of PHXTabEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXExtraEntityCopyWith<$Res>? get extra {
    if (_self.extra == null) {
      return null;
    }

    return $PHXExtraEntityCopyWith<$Res>(_self.extra!, (value) {
      return _then(_self.copyWith(extra: value));
    });
  }
}

/// @nodoc
mixin _$PHXSectionEntity {
  String? get title;
  String? get heading;
  String? get iconUrl;
  List<PHXSectionEntity>? get bottomSheet;
  List<PHXSectionItemEntity>? get items;
  PHXExtraEntity? get extra;

  /// Create a copy of PHXSectionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXSectionEntityCopyWith<PHXSectionEntity> get copyWith =>
      _$PHXSectionEntityCopyWithImpl<PHXSectionEntity>(
          this as PHXSectionEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXSectionEntity &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.heading, heading) || other.heading == heading) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            const DeepCollectionEquality()
                .equals(other.bottomSheet, bottomSheet) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.extra, extra) || other.extra == extra));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      heading,
      iconUrl,
      const DeepCollectionEquality().hash(bottomSheet),
      const DeepCollectionEquality().hash(items),
      extra);

  @override
  String toString() {
    return 'PHXSectionEntity(title: $title, heading: $heading, iconUrl: $iconUrl, bottomSheet: $bottomSheet, items: $items, extra: $extra)';
  }
}

/// @nodoc
abstract mixin class $PHXSectionEntityCopyWith<$Res> {
  factory $PHXSectionEntityCopyWith(
          PHXSectionEntity value, $Res Function(PHXSectionEntity) _then) =
      _$PHXSectionEntityCopyWithImpl;
  @useResult
  $Res call(
      {String? title,
      String? heading,
      String? iconUrl,
      List<PHXSectionEntity>? bottomSheet,
      List<PHXSectionItemEntity>? items,
      PHXExtraEntity? extra});

  $PHXExtraEntityCopyWith<$Res>? get extra;
}

/// @nodoc
class _$PHXSectionEntityCopyWithImpl<$Res>
    implements $PHXSectionEntityCopyWith<$Res> {
  _$PHXSectionEntityCopyWithImpl(this._self, this._then);

  final PHXSectionEntity _self;
  final $Res Function(PHXSectionEntity) _then;

  /// Create a copy of PHXSectionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? heading = freezed,
    Object? iconUrl = freezed,
    Object? bottomSheet = freezed,
    Object? items = freezed,
    Object? extra = freezed,
  }) {
    return _then(_self.copyWith(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      heading: freezed == heading
          ? _self.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as String?,
      iconUrl: freezed == iconUrl
          ? _self.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bottomSheet: freezed == bottomSheet
          ? _self.bottomSheet
          : bottomSheet // ignore: cast_nullable_to_non_nullable
              as List<PHXSectionEntity>?,
      items: freezed == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PHXSectionItemEntity>?,
      extra: freezed == extra
          ? _self.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as PHXExtraEntity?,
    ));
  }

  /// Create a copy of PHXSectionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXExtraEntityCopyWith<$Res>? get extra {
    if (_self.extra == null) {
      return null;
    }

    return $PHXExtraEntityCopyWith<$Res>(_self.extra!, (value) {
      return _then(_self.copyWith(extra: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PHXSectionEntity].
extension PHXSectionEntityPatterns on PHXSectionEntity {
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
    TResult Function(_PHXSectionEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXSectionEntity() when $default != null:
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
    TResult Function(_PHXSectionEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionEntity():
        return $default(_that);
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
    TResult? Function(_PHXSectionEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionEntity() when $default != null:
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
            String? title,
            String? heading,
            String? iconUrl,
            List<PHXSectionEntity>? bottomSheet,
            List<PHXSectionItemEntity>? items,
            PHXExtraEntity? extra)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXSectionEntity() when $default != null:
        return $default(_that.title, _that.heading, _that.iconUrl,
            _that.bottomSheet, _that.items, _that.extra);
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
            String? title,
            String? heading,
            String? iconUrl,
            List<PHXSectionEntity>? bottomSheet,
            List<PHXSectionItemEntity>? items,
            PHXExtraEntity? extra)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionEntity():
        return $default(_that.title, _that.heading, _that.iconUrl,
            _that.bottomSheet, _that.items, _that.extra);
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
            String? title,
            String? heading,
            String? iconUrl,
            List<PHXSectionEntity>? bottomSheet,
            List<PHXSectionItemEntity>? items,
            PHXExtraEntity? extra)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionEntity() when $default != null:
        return $default(_that.title, _that.heading, _that.iconUrl,
            _that.bottomSheet, _that.items, _that.extra);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PHXSectionEntity extends PHXSectionEntity {
  const _PHXSectionEntity(
      {this.title = '',
      this.heading = '',
      this.iconUrl = '',
      final List<PHXSectionEntity>? bottomSheet = const [],
      final List<PHXSectionItemEntity>? items = const [],
      this.extra = null})
      : _bottomSheet = bottomSheet,
        _items = items,
        super._();

  @override
  @JsonKey()
  final String? title;
  @override
  @JsonKey()
  final String? heading;
  @override
  @JsonKey()
  final String? iconUrl;
  final List<PHXSectionEntity>? _bottomSheet;
  @override
  @JsonKey()
  List<PHXSectionEntity>? get bottomSheet {
    final value = _bottomSheet;
    if (value == null) return null;
    if (_bottomSheet is EqualUnmodifiableListView) return _bottomSheet;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<PHXSectionItemEntity>? _items;
  @override
  @JsonKey()
  List<PHXSectionItemEntity>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final PHXExtraEntity? extra;

  /// Create a copy of PHXSectionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXSectionEntityCopyWith<_PHXSectionEntity> get copyWith =>
      __$PHXSectionEntityCopyWithImpl<_PHXSectionEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXSectionEntity &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.heading, heading) || other.heading == heading) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            const DeepCollectionEquality()
                .equals(other._bottomSheet, _bottomSheet) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.extra, extra) || other.extra == extra));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      heading,
      iconUrl,
      const DeepCollectionEquality().hash(_bottomSheet),
      const DeepCollectionEquality().hash(_items),
      extra);

  @override
  String toString() {
    return 'PHXSectionEntity(title: $title, heading: $heading, iconUrl: $iconUrl, bottomSheet: $bottomSheet, items: $items, extra: $extra)';
  }
}

/// @nodoc
abstract mixin class _$PHXSectionEntityCopyWith<$Res>
    implements $PHXSectionEntityCopyWith<$Res> {
  factory _$PHXSectionEntityCopyWith(
          _PHXSectionEntity value, $Res Function(_PHXSectionEntity) _then) =
      __$PHXSectionEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? title,
      String? heading,
      String? iconUrl,
      List<PHXSectionEntity>? bottomSheet,
      List<PHXSectionItemEntity>? items,
      PHXExtraEntity? extra});

  @override
  $PHXExtraEntityCopyWith<$Res>? get extra;
}

/// @nodoc
class __$PHXSectionEntityCopyWithImpl<$Res>
    implements _$PHXSectionEntityCopyWith<$Res> {
  __$PHXSectionEntityCopyWithImpl(this._self, this._then);

  final _PHXSectionEntity _self;
  final $Res Function(_PHXSectionEntity) _then;

  /// Create a copy of PHXSectionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? heading = freezed,
    Object? iconUrl = freezed,
    Object? bottomSheet = freezed,
    Object? items = freezed,
    Object? extra = freezed,
  }) {
    return _then(_PHXSectionEntity(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      heading: freezed == heading
          ? _self.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as String?,
      iconUrl: freezed == iconUrl
          ? _self.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bottomSheet: freezed == bottomSheet
          ? _self._bottomSheet
          : bottomSheet // ignore: cast_nullable_to_non_nullable
              as List<PHXSectionEntity>?,
      items: freezed == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PHXSectionItemEntity>?,
      extra: freezed == extra
          ? _self.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as PHXExtraEntity?,
    ));
  }

  /// Create a copy of PHXSectionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXExtraEntityCopyWith<$Res>? get extra {
    if (_self.extra == null) {
      return null;
    }

    return $PHXExtraEntityCopyWith<$Res>(_self.extra!, (value) {
      return _then(_self.copyWith(extra: value));
    });
  }
}

/// @nodoc
mixin _$PHXSectionItemEntity {
  int? get id;
  String? get title;
  String? get content;
  String? get subTitle;
  List<String>? get description;
  String? get imageUrl;
  bool? get isNext;
  bool? get showDivider;
  bool? get hasAvatar;
  List<PHXSectionItemDetailEntity>? get details;
  PHXSectionItemBadgeEntity? get badge;
  PHXSectionItemBottomInfoEntity? get bottomInfo;
  PHXExtraEntity? get extra;
  String? get avatarName;
  String? get avatarSubtitle;
  String? get avatarUrl;
  List<PHXStudentEntity>? get students;
  int? get studentId;
  bool? get redDot;
  String? get uuid;
  List<PHXMultiBadgeEntity>? get multiBadge;
  PHXPayloadEntity? get payload;

  /// Create a copy of PHXSectionItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXSectionItemEntityCopyWith<PHXSectionItemEntity> get copyWith =>
      _$PHXSectionItemEntityCopyWithImpl<PHXSectionItemEntity>(
          this as PHXSectionItemEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXSectionItemEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isNext, isNext) || other.isNext == isNext) &&
            (identical(other.showDivider, showDivider) ||
                other.showDivider == showDivider) &&
            (identical(other.hasAvatar, hasAvatar) ||
                other.hasAvatar == hasAvatar) &&
            const DeepCollectionEquality().equals(other.details, details) &&
            (identical(other.badge, badge) || other.badge == badge) &&
            (identical(other.bottomInfo, bottomInfo) ||
                other.bottomInfo == bottomInfo) &&
            (identical(other.extra, extra) || other.extra == extra) &&
            (identical(other.avatarName, avatarName) ||
                other.avatarName == avatarName) &&
            (identical(other.avatarSubtitle, avatarSubtitle) ||
                other.avatarSubtitle == avatarSubtitle) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            const DeepCollectionEquality().equals(other.students, students) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.redDot, redDot) || other.redDot == redDot) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            const DeepCollectionEquality()
                .equals(other.multiBadge, multiBadge) &&
            (identical(other.payload, payload) || other.payload == payload));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        content,
        subTitle,
        const DeepCollectionEquality().hash(description),
        imageUrl,
        isNext,
        showDivider,
        hasAvatar,
        const DeepCollectionEquality().hash(details),
        badge,
        bottomInfo,
        extra,
        avatarName,
        avatarSubtitle,
        avatarUrl,
        const DeepCollectionEquality().hash(students),
        studentId,
        redDot,
        uuid,
        const DeepCollectionEquality().hash(multiBadge),
        payload
      ]);

  @override
  String toString() {
    return 'PHXSectionItemEntity(id: $id, title: $title, content: $content, subTitle: $subTitle, description: $description, imageUrl: $imageUrl, isNext: $isNext, showDivider: $showDivider, hasAvatar: $hasAvatar, details: $details, badge: $badge, bottomInfo: $bottomInfo, extra: $extra, avatarName: $avatarName, avatarSubtitle: $avatarSubtitle, avatarUrl: $avatarUrl, students: $students, studentId: $studentId, redDot: $redDot, uuid: $uuid, multiBadge: $multiBadge, payload: $payload)';
  }
}

/// @nodoc
abstract mixin class $PHXSectionItemEntityCopyWith<$Res> {
  factory $PHXSectionItemEntityCopyWith(PHXSectionItemEntity value,
          $Res Function(PHXSectionItemEntity) _then) =
      _$PHXSectionItemEntityCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? content,
      String? subTitle,
      List<String>? description,
      String? imageUrl,
      bool? isNext,
      bool? showDivider,
      bool? hasAvatar,
      List<PHXSectionItemDetailEntity>? details,
      PHXSectionItemBadgeEntity? badge,
      PHXSectionItemBottomInfoEntity? bottomInfo,
      PHXExtraEntity? extra,
      String? avatarName,
      String? avatarSubtitle,
      String? avatarUrl,
      List<PHXStudentEntity>? students,
      int? studentId,
      bool? redDot,
      String? uuid,
      List<PHXMultiBadgeEntity>? multiBadge,
      PHXPayloadEntity? payload});

  $PHXSectionItemBadgeEntityCopyWith<$Res>? get badge;
  $PHXSectionItemBottomInfoEntityCopyWith<$Res>? get bottomInfo;
  $PHXExtraEntityCopyWith<$Res>? get extra;
  $PHXPayloadEntityCopyWith<$Res>? get payload;
}

/// @nodoc
class _$PHXSectionItemEntityCopyWithImpl<$Res>
    implements $PHXSectionItemEntityCopyWith<$Res> {
  _$PHXSectionItemEntityCopyWithImpl(this._self, this._then);

  final PHXSectionItemEntity _self;
  final $Res Function(PHXSectionItemEntity) _then;

  /// Create a copy of PHXSectionItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? subTitle = freezed,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? isNext = freezed,
    Object? showDivider = freezed,
    Object? hasAvatar = freezed,
    Object? details = freezed,
    Object? badge = freezed,
    Object? bottomInfo = freezed,
    Object? extra = freezed,
    Object? avatarName = freezed,
    Object? avatarSubtitle = freezed,
    Object? avatarUrl = freezed,
    Object? students = freezed,
    Object? studentId = freezed,
    Object? redDot = freezed,
    Object? uuid = freezed,
    Object? multiBadge = freezed,
    Object? payload = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      subTitle: freezed == subTitle
          ? _self.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isNext: freezed == isNext
          ? _self.isNext
          : isNext // ignore: cast_nullable_to_non_nullable
              as bool?,
      showDivider: freezed == showDivider
          ? _self.showDivider
          : showDivider // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasAvatar: freezed == hasAvatar
          ? _self.hasAvatar
          : hasAvatar // ignore: cast_nullable_to_non_nullable
              as bool?,
      details: freezed == details
          ? _self.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<PHXSectionItemDetailEntity>?,
      badge: freezed == badge
          ? _self.badge
          : badge // ignore: cast_nullable_to_non_nullable
              as PHXSectionItemBadgeEntity?,
      bottomInfo: freezed == bottomInfo
          ? _self.bottomInfo
          : bottomInfo // ignore: cast_nullable_to_non_nullable
              as PHXSectionItemBottomInfoEntity?,
      extra: freezed == extra
          ? _self.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as PHXExtraEntity?,
      avatarName: freezed == avatarName
          ? _self.avatarName
          : avatarName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarSubtitle: freezed == avatarSubtitle
          ? _self.avatarSubtitle
          : avatarSubtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      students: freezed == students
          ? _self.students
          : students // ignore: cast_nullable_to_non_nullable
              as List<PHXStudentEntity>?,
      studentId: freezed == studentId
          ? _self.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int?,
      redDot: freezed == redDot
          ? _self.redDot
          : redDot // ignore: cast_nullable_to_non_nullable
              as bool?,
      uuid: freezed == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      multiBadge: freezed == multiBadge
          ? _self.multiBadge
          : multiBadge // ignore: cast_nullable_to_non_nullable
              as List<PHXMultiBadgeEntity>?,
      payload: freezed == payload
          ? _self.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as PHXPayloadEntity?,
    ));
  }

  /// Create a copy of PHXSectionItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXSectionItemBadgeEntityCopyWith<$Res>? get badge {
    if (_self.badge == null) {
      return null;
    }

    return $PHXSectionItemBadgeEntityCopyWith<$Res>(_self.badge!, (value) {
      return _then(_self.copyWith(badge: value));
    });
  }

  /// Create a copy of PHXSectionItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXSectionItemBottomInfoEntityCopyWith<$Res>? get bottomInfo {
    if (_self.bottomInfo == null) {
      return null;
    }

    return $PHXSectionItemBottomInfoEntityCopyWith<$Res>(_self.bottomInfo!,
        (value) {
      return _then(_self.copyWith(bottomInfo: value));
    });
  }

  /// Create a copy of PHXSectionItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXExtraEntityCopyWith<$Res>? get extra {
    if (_self.extra == null) {
      return null;
    }

    return $PHXExtraEntityCopyWith<$Res>(_self.extra!, (value) {
      return _then(_self.copyWith(extra: value));
    });
  }

  /// Create a copy of PHXSectionItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXPayloadEntityCopyWith<$Res>? get payload {
    if (_self.payload == null) {
      return null;
    }

    return $PHXPayloadEntityCopyWith<$Res>(_self.payload!, (value) {
      return _then(_self.copyWith(payload: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PHXSectionItemEntity].
extension PHXSectionItemEntityPatterns on PHXSectionItemEntity {
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
    TResult Function(_PHXSectionItemEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemEntity() when $default != null:
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
    TResult Function(_PHXSectionItemEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemEntity():
        return $default(_that);
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
    TResult? Function(_PHXSectionItemEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemEntity() when $default != null:
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
            int? id,
            String? title,
            String? content,
            String? subTitle,
            List<String>? description,
            String? imageUrl,
            bool? isNext,
            bool? showDivider,
            bool? hasAvatar,
            List<PHXSectionItemDetailEntity>? details,
            PHXSectionItemBadgeEntity? badge,
            PHXSectionItemBottomInfoEntity? bottomInfo,
            PHXExtraEntity? extra,
            String? avatarName,
            String? avatarSubtitle,
            String? avatarUrl,
            List<PHXStudentEntity>? students,
            int? studentId,
            bool? redDot,
            String? uuid,
            List<PHXMultiBadgeEntity>? multiBadge,
            PHXPayloadEntity? payload)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemEntity() when $default != null:
        return $default(
            _that.id,
            _that.title,
            _that.content,
            _that.subTitle,
            _that.description,
            _that.imageUrl,
            _that.isNext,
            _that.showDivider,
            _that.hasAvatar,
            _that.details,
            _that.badge,
            _that.bottomInfo,
            _that.extra,
            _that.avatarName,
            _that.avatarSubtitle,
            _that.avatarUrl,
            _that.students,
            _that.studentId,
            _that.redDot,
            _that.uuid,
            _that.multiBadge,
            _that.payload);
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
            int? id,
            String? title,
            String? content,
            String? subTitle,
            List<String>? description,
            String? imageUrl,
            bool? isNext,
            bool? showDivider,
            bool? hasAvatar,
            List<PHXSectionItemDetailEntity>? details,
            PHXSectionItemBadgeEntity? badge,
            PHXSectionItemBottomInfoEntity? bottomInfo,
            PHXExtraEntity? extra,
            String? avatarName,
            String? avatarSubtitle,
            String? avatarUrl,
            List<PHXStudentEntity>? students,
            int? studentId,
            bool? redDot,
            String? uuid,
            List<PHXMultiBadgeEntity>? multiBadge,
            PHXPayloadEntity? payload)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemEntity():
        return $default(
            _that.id,
            _that.title,
            _that.content,
            _that.subTitle,
            _that.description,
            _that.imageUrl,
            _that.isNext,
            _that.showDivider,
            _that.hasAvatar,
            _that.details,
            _that.badge,
            _that.bottomInfo,
            _that.extra,
            _that.avatarName,
            _that.avatarSubtitle,
            _that.avatarUrl,
            _that.students,
            _that.studentId,
            _that.redDot,
            _that.uuid,
            _that.multiBadge,
            _that.payload);
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
            int? id,
            String? title,
            String? content,
            String? subTitle,
            List<String>? description,
            String? imageUrl,
            bool? isNext,
            bool? showDivider,
            bool? hasAvatar,
            List<PHXSectionItemDetailEntity>? details,
            PHXSectionItemBadgeEntity? badge,
            PHXSectionItemBottomInfoEntity? bottomInfo,
            PHXExtraEntity? extra,
            String? avatarName,
            String? avatarSubtitle,
            String? avatarUrl,
            List<PHXStudentEntity>? students,
            int? studentId,
            bool? redDot,
            String? uuid,
            List<PHXMultiBadgeEntity>? multiBadge,
            PHXPayloadEntity? payload)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemEntity() when $default != null:
        return $default(
            _that.id,
            _that.title,
            _that.content,
            _that.subTitle,
            _that.description,
            _that.imageUrl,
            _that.isNext,
            _that.showDivider,
            _that.hasAvatar,
            _that.details,
            _that.badge,
            _that.bottomInfo,
            _that.extra,
            _that.avatarName,
            _that.avatarSubtitle,
            _that.avatarUrl,
            _that.students,
            _that.studentId,
            _that.redDot,
            _that.uuid,
            _that.multiBadge,
            _that.payload);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PHXSectionItemEntity extends PHXSectionItemEntity {
  const _PHXSectionItemEntity(
      {this.id = 0,
      this.title = '',
      this.content = '',
      this.subTitle = '',
      final List<String>? description = const [],
      this.imageUrl = '',
      this.isNext = false,
      this.showDivider = false,
      this.hasAvatar = false,
      final List<PHXSectionItemDetailEntity>? details = null,
      this.badge = null,
      this.bottomInfo = null,
      this.extra = null,
      this.avatarName = '',
      this.avatarSubtitle = '',
      this.avatarUrl = '',
      final List<PHXStudentEntity>? students = const [],
      this.studentId = 0,
      this.redDot = false,
      this.uuid = '',
      final List<PHXMultiBadgeEntity>? multiBadge = null,
      this.payload = null})
      : _description = description,
        _details = details,
        _students = students,
        _multiBadge = multiBadge,
        super._();

  @override
  @JsonKey()
  final int? id;
  @override
  @JsonKey()
  final String? title;
  @override
  @JsonKey()
  final String? content;
  @override
  @JsonKey()
  final String? subTitle;
  final List<String>? _description;
  @override
  @JsonKey()
  List<String>? get description {
    final value = _description;
    if (value == null) return null;
    if (_description is EqualUnmodifiableListView) return _description;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final String? imageUrl;
  @override
  @JsonKey()
  final bool? isNext;
  @override
  @JsonKey()
  final bool? showDivider;
  @override
  @JsonKey()
  final bool? hasAvatar;
  final List<PHXSectionItemDetailEntity>? _details;
  @override
  @JsonKey()
  List<PHXSectionItemDetailEntity>? get details {
    final value = _details;
    if (value == null) return null;
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final PHXSectionItemBadgeEntity? badge;
  @override
  @JsonKey()
  final PHXSectionItemBottomInfoEntity? bottomInfo;
  @override
  @JsonKey()
  final PHXExtraEntity? extra;
  @override
  @JsonKey()
  final String? avatarName;
  @override
  @JsonKey()
  final String? avatarSubtitle;
  @override
  @JsonKey()
  final String? avatarUrl;
  final List<PHXStudentEntity>? _students;
  @override
  @JsonKey()
  List<PHXStudentEntity>? get students {
    final value = _students;
    if (value == null) return null;
    if (_students is EqualUnmodifiableListView) return _students;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final int? studentId;
  @override
  @JsonKey()
  final bool? redDot;
  @override
  @JsonKey()
  final String? uuid;
  final List<PHXMultiBadgeEntity>? _multiBadge;
  @override
  @JsonKey()
  List<PHXMultiBadgeEntity>? get multiBadge {
    final value = _multiBadge;
    if (value == null) return null;
    if (_multiBadge is EqualUnmodifiableListView) return _multiBadge;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final PHXPayloadEntity? payload;

  /// Create a copy of PHXSectionItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXSectionItemEntityCopyWith<_PHXSectionItemEntity> get copyWith =>
      __$PHXSectionItemEntityCopyWithImpl<_PHXSectionItemEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXSectionItemEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            const DeepCollectionEquality()
                .equals(other._description, _description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isNext, isNext) || other.isNext == isNext) &&
            (identical(other.showDivider, showDivider) ||
                other.showDivider == showDivider) &&
            (identical(other.hasAvatar, hasAvatar) ||
                other.hasAvatar == hasAvatar) &&
            const DeepCollectionEquality().equals(other._details, _details) &&
            (identical(other.badge, badge) || other.badge == badge) &&
            (identical(other.bottomInfo, bottomInfo) ||
                other.bottomInfo == bottomInfo) &&
            (identical(other.extra, extra) || other.extra == extra) &&
            (identical(other.avatarName, avatarName) ||
                other.avatarName == avatarName) &&
            (identical(other.avatarSubtitle, avatarSubtitle) ||
                other.avatarSubtitle == avatarSubtitle) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            const DeepCollectionEquality().equals(other._students, _students) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.redDot, redDot) || other.redDot == redDot) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            const DeepCollectionEquality()
                .equals(other._multiBadge, _multiBadge) &&
            (identical(other.payload, payload) || other.payload == payload));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        content,
        subTitle,
        const DeepCollectionEquality().hash(_description),
        imageUrl,
        isNext,
        showDivider,
        hasAvatar,
        const DeepCollectionEquality().hash(_details),
        badge,
        bottomInfo,
        extra,
        avatarName,
        avatarSubtitle,
        avatarUrl,
        const DeepCollectionEquality().hash(_students),
        studentId,
        redDot,
        uuid,
        const DeepCollectionEquality().hash(_multiBadge),
        payload
      ]);

  @override
  String toString() {
    return 'PHXSectionItemEntity(id: $id, title: $title, content: $content, subTitle: $subTitle, description: $description, imageUrl: $imageUrl, isNext: $isNext, showDivider: $showDivider, hasAvatar: $hasAvatar, details: $details, badge: $badge, bottomInfo: $bottomInfo, extra: $extra, avatarName: $avatarName, avatarSubtitle: $avatarSubtitle, avatarUrl: $avatarUrl, students: $students, studentId: $studentId, redDot: $redDot, uuid: $uuid, multiBadge: $multiBadge, payload: $payload)';
  }
}

/// @nodoc
abstract mixin class _$PHXSectionItemEntityCopyWith<$Res>
    implements $PHXSectionItemEntityCopyWith<$Res> {
  factory _$PHXSectionItemEntityCopyWith(_PHXSectionItemEntity value,
          $Res Function(_PHXSectionItemEntity) _then) =
      __$PHXSectionItemEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? content,
      String? subTitle,
      List<String>? description,
      String? imageUrl,
      bool? isNext,
      bool? showDivider,
      bool? hasAvatar,
      List<PHXSectionItemDetailEntity>? details,
      PHXSectionItemBadgeEntity? badge,
      PHXSectionItemBottomInfoEntity? bottomInfo,
      PHXExtraEntity? extra,
      String? avatarName,
      String? avatarSubtitle,
      String? avatarUrl,
      List<PHXStudentEntity>? students,
      int? studentId,
      bool? redDot,
      String? uuid,
      List<PHXMultiBadgeEntity>? multiBadge,
      PHXPayloadEntity? payload});

  @override
  $PHXSectionItemBadgeEntityCopyWith<$Res>? get badge;
  @override
  $PHXSectionItemBottomInfoEntityCopyWith<$Res>? get bottomInfo;
  @override
  $PHXExtraEntityCopyWith<$Res>? get extra;
  @override
  $PHXPayloadEntityCopyWith<$Res>? get payload;
}

/// @nodoc
class __$PHXSectionItemEntityCopyWithImpl<$Res>
    implements _$PHXSectionItemEntityCopyWith<$Res> {
  __$PHXSectionItemEntityCopyWithImpl(this._self, this._then);

  final _PHXSectionItemEntity _self;
  final $Res Function(_PHXSectionItemEntity) _then;

  /// Create a copy of PHXSectionItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? subTitle = freezed,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? isNext = freezed,
    Object? showDivider = freezed,
    Object? hasAvatar = freezed,
    Object? details = freezed,
    Object? badge = freezed,
    Object? bottomInfo = freezed,
    Object? extra = freezed,
    Object? avatarName = freezed,
    Object? avatarSubtitle = freezed,
    Object? avatarUrl = freezed,
    Object? students = freezed,
    Object? studentId = freezed,
    Object? redDot = freezed,
    Object? uuid = freezed,
    Object? multiBadge = freezed,
    Object? payload = freezed,
  }) {
    return _then(_PHXSectionItemEntity(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      subTitle: freezed == subTitle
          ? _self.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self._description
          : description // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isNext: freezed == isNext
          ? _self.isNext
          : isNext // ignore: cast_nullable_to_non_nullable
              as bool?,
      showDivider: freezed == showDivider
          ? _self.showDivider
          : showDivider // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasAvatar: freezed == hasAvatar
          ? _self.hasAvatar
          : hasAvatar // ignore: cast_nullable_to_non_nullable
              as bool?,
      details: freezed == details
          ? _self._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<PHXSectionItemDetailEntity>?,
      badge: freezed == badge
          ? _self.badge
          : badge // ignore: cast_nullable_to_non_nullable
              as PHXSectionItemBadgeEntity?,
      bottomInfo: freezed == bottomInfo
          ? _self.bottomInfo
          : bottomInfo // ignore: cast_nullable_to_non_nullable
              as PHXSectionItemBottomInfoEntity?,
      extra: freezed == extra
          ? _self.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as PHXExtraEntity?,
      avatarName: freezed == avatarName
          ? _self.avatarName
          : avatarName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarSubtitle: freezed == avatarSubtitle
          ? _self.avatarSubtitle
          : avatarSubtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      students: freezed == students
          ? _self._students
          : students // ignore: cast_nullable_to_non_nullable
              as List<PHXStudentEntity>?,
      studentId: freezed == studentId
          ? _self.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int?,
      redDot: freezed == redDot
          ? _self.redDot
          : redDot // ignore: cast_nullable_to_non_nullable
              as bool?,
      uuid: freezed == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      multiBadge: freezed == multiBadge
          ? _self._multiBadge
          : multiBadge // ignore: cast_nullable_to_non_nullable
              as List<PHXMultiBadgeEntity>?,
      payload: freezed == payload
          ? _self.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as PHXPayloadEntity?,
    ));
  }

  /// Create a copy of PHXSectionItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXSectionItemBadgeEntityCopyWith<$Res>? get badge {
    if (_self.badge == null) {
      return null;
    }

    return $PHXSectionItemBadgeEntityCopyWith<$Res>(_self.badge!, (value) {
      return _then(_self.copyWith(badge: value));
    });
  }

  /// Create a copy of PHXSectionItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXSectionItemBottomInfoEntityCopyWith<$Res>? get bottomInfo {
    if (_self.bottomInfo == null) {
      return null;
    }

    return $PHXSectionItemBottomInfoEntityCopyWith<$Res>(_self.bottomInfo!,
        (value) {
      return _then(_self.copyWith(bottomInfo: value));
    });
  }

  /// Create a copy of PHXSectionItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXExtraEntityCopyWith<$Res>? get extra {
    if (_self.extra == null) {
      return null;
    }

    return $PHXExtraEntityCopyWith<$Res>(_self.extra!, (value) {
      return _then(_self.copyWith(extra: value));
    });
  }

  /// Create a copy of PHXSectionItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXPayloadEntityCopyWith<$Res>? get payload {
    if (_self.payload == null) {
      return null;
    }

    return $PHXPayloadEntityCopyWith<$Res>(_self.payload!, (value) {
      return _then(_self.copyWith(payload: value));
    });
  }
}

/// @nodoc
mixin _$PHXPayloadEntity {
  String? get action;
  String? get type;
  String? get title;
  String? get content;
  String? get notificationId;
  String? get studentCode;
  String? get attendanceLessonId;
  String? get assignId;
  String? get subsystem;
  String? get status;
  String? get eventType;
  String? get classroomName;
  String? get schoolYearId;
  String? get borrowTicketState;
  String? get id;
  String? get studentId;
  String? get quickExaminationId;
  String? get orderId;
  String? get feedbackId;
  String? get typeDetail;
  String? get inappNotiId;
  String? get hasShareMessage;
  String? get monthId;
  String? get schoolTermId;
  String? get code;
  String? get requestId;
  String? get schoolId;
  String? get isCancelRequest;

  /// Create a copy of PHXPayloadEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXPayloadEntityCopyWith<PHXPayloadEntity> get copyWith =>
      _$PHXPayloadEntityCopyWithImpl<PHXPayloadEntity>(
          this as PHXPayloadEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXPayloadEntity &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId) &&
            (identical(other.studentCode, studentCode) ||
                other.studentCode == studentCode) &&
            (identical(other.attendanceLessonId, attendanceLessonId) ||
                other.attendanceLessonId == attendanceLessonId) &&
            (identical(other.assignId, assignId) ||
                other.assignId == assignId) &&
            (identical(other.subsystem, subsystem) ||
                other.subsystem == subsystem) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.classroomName, classroomName) ||
                other.classroomName == classroomName) &&
            (identical(other.schoolYearId, schoolYearId) ||
                other.schoolYearId == schoolYearId) &&
            (identical(other.borrowTicketState, borrowTicketState) ||
                other.borrowTicketState == borrowTicketState) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.quickExaminationId, quickExaminationId) ||
                other.quickExaminationId == quickExaminationId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.feedbackId, feedbackId) ||
                other.feedbackId == feedbackId) &&
            (identical(other.typeDetail, typeDetail) ||
                other.typeDetail == typeDetail) &&
            (identical(other.inappNotiId, inappNotiId) ||
                other.inappNotiId == inappNotiId) &&
            (identical(other.hasShareMessage, hasShareMessage) ||
                other.hasShareMessage == hasShareMessage) &&
            (identical(other.monthId, monthId) || other.monthId == monthId) &&
            (identical(other.schoolTermId, schoolTermId) ||
                other.schoolTermId == schoolTermId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.schoolId, schoolId) ||
                other.schoolId == schoolId) &&
            (identical(other.isCancelRequest, isCancelRequest) ||
                other.isCancelRequest == isCancelRequest));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        action,
        type,
        title,
        content,
        notificationId,
        studentCode,
        attendanceLessonId,
        assignId,
        subsystem,
        status,
        eventType,
        classroomName,
        schoolYearId,
        borrowTicketState,
        id,
        studentId,
        quickExaminationId,
        orderId,
        feedbackId,
        typeDetail,
        inappNotiId,
        hasShareMessage,
        monthId,
        schoolTermId,
        code,
        requestId,
        schoolId,
        isCancelRequest
      ]);

  @override
  String toString() {
    return 'PHXPayloadEntity(action: $action, type: $type, title: $title, content: $content, notificationId: $notificationId, studentCode: $studentCode, attendanceLessonId: $attendanceLessonId, assignId: $assignId, subsystem: $subsystem, status: $status, eventType: $eventType, classroomName: $classroomName, schoolYearId: $schoolYearId, borrowTicketState: $borrowTicketState, id: $id, studentId: $studentId, quickExaminationId: $quickExaminationId, orderId: $orderId, feedbackId: $feedbackId, typeDetail: $typeDetail, inappNotiId: $inappNotiId, hasShareMessage: $hasShareMessage, monthId: $monthId, schoolTermId: $schoolTermId, code: $code, requestId: $requestId, schoolId: $schoolId, isCancelRequest: $isCancelRequest)';
  }
}

/// @nodoc
abstract mixin class $PHXPayloadEntityCopyWith<$Res> {
  factory $PHXPayloadEntityCopyWith(
          PHXPayloadEntity value, $Res Function(PHXPayloadEntity) _then) =
      _$PHXPayloadEntityCopyWithImpl;
  @useResult
  $Res call(
      {String? action,
      String? type,
      String? title,
      String? content,
      String? notificationId,
      String? studentCode,
      String? attendanceLessonId,
      String? assignId,
      String? subsystem,
      String? status,
      String? eventType,
      String? classroomName,
      String? schoolYearId,
      String? borrowTicketState,
      String? id,
      String? studentId,
      String? quickExaminationId,
      String? orderId,
      String? feedbackId,
      String? typeDetail,
      String? inappNotiId,
      String? hasShareMessage,
      String? monthId,
      String? schoolTermId,
      String? code,
      String? requestId,
      String? schoolId,
      String? isCancelRequest});
}

/// @nodoc
class _$PHXPayloadEntityCopyWithImpl<$Res>
    implements $PHXPayloadEntityCopyWith<$Res> {
  _$PHXPayloadEntityCopyWithImpl(this._self, this._then);

  final PHXPayloadEntity _self;
  final $Res Function(PHXPayloadEntity) _then;

  /// Create a copy of PHXPayloadEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = freezed,
    Object? type = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? notificationId = freezed,
    Object? studentCode = freezed,
    Object? attendanceLessonId = freezed,
    Object? assignId = freezed,
    Object? subsystem = freezed,
    Object? status = freezed,
    Object? eventType = freezed,
    Object? classroomName = freezed,
    Object? schoolYearId = freezed,
    Object? borrowTicketState = freezed,
    Object? id = freezed,
    Object? studentId = freezed,
    Object? quickExaminationId = freezed,
    Object? orderId = freezed,
    Object? feedbackId = freezed,
    Object? typeDetail = freezed,
    Object? inappNotiId = freezed,
    Object? hasShareMessage = freezed,
    Object? monthId = freezed,
    Object? schoolTermId = freezed,
    Object? code = freezed,
    Object? requestId = freezed,
    Object? schoolId = freezed,
    Object? isCancelRequest = freezed,
  }) {
    return _then(_self.copyWith(
      action: freezed == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationId: freezed == notificationId
          ? _self.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      studentCode: freezed == studentCode
          ? _self.studentCode
          : studentCode // ignore: cast_nullable_to_non_nullable
              as String?,
      attendanceLessonId: freezed == attendanceLessonId
          ? _self.attendanceLessonId
          : attendanceLessonId // ignore: cast_nullable_to_non_nullable
              as String?,
      assignId: freezed == assignId
          ? _self.assignId
          : assignId // ignore: cast_nullable_to_non_nullable
              as String?,
      subsystem: freezed == subsystem
          ? _self.subsystem
          : subsystem // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      eventType: freezed == eventType
          ? _self.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String?,
      classroomName: freezed == classroomName
          ? _self.classroomName
          : classroomName // ignore: cast_nullable_to_non_nullable
              as String?,
      schoolYearId: freezed == schoolYearId
          ? _self.schoolYearId
          : schoolYearId // ignore: cast_nullable_to_non_nullable
              as String?,
      borrowTicketState: freezed == borrowTicketState
          ? _self.borrowTicketState
          : borrowTicketState // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      studentId: freezed == studentId
          ? _self.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String?,
      quickExaminationId: freezed == quickExaminationId
          ? _self.quickExaminationId
          : quickExaminationId // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: freezed == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      feedbackId: freezed == feedbackId
          ? _self.feedbackId
          : feedbackId // ignore: cast_nullable_to_non_nullable
              as String?,
      typeDetail: freezed == typeDetail
          ? _self.typeDetail
          : typeDetail // ignore: cast_nullable_to_non_nullable
              as String?,
      inappNotiId: freezed == inappNotiId
          ? _self.inappNotiId
          : inappNotiId // ignore: cast_nullable_to_non_nullable
              as String?,
      hasShareMessage: freezed == hasShareMessage
          ? _self.hasShareMessage
          : hasShareMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      monthId: freezed == monthId
          ? _self.monthId
          : monthId // ignore: cast_nullable_to_non_nullable
              as String?,
      schoolTermId: freezed == schoolTermId
          ? _self.schoolTermId
          : schoolTermId // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      requestId: freezed == requestId
          ? _self.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      schoolId: freezed == schoolId
          ? _self.schoolId
          : schoolId // ignore: cast_nullable_to_non_nullable
              as String?,
      isCancelRequest: freezed == isCancelRequest
          ? _self.isCancelRequest
          : isCancelRequest // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PHXPayloadEntity].
extension PHXPayloadEntityPatterns on PHXPayloadEntity {
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
    TResult Function(_PHXPayloadEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXPayloadEntity() when $default != null:
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
    TResult Function(_PHXPayloadEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXPayloadEntity():
        return $default(_that);
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
    TResult? Function(_PHXPayloadEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXPayloadEntity() when $default != null:
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
            String? action,
            String? type,
            String? title,
            String? content,
            String? notificationId,
            String? studentCode,
            String? attendanceLessonId,
            String? assignId,
            String? subsystem,
            String? status,
            String? eventType,
            String? classroomName,
            String? schoolYearId,
            String? borrowTicketState,
            String? id,
            String? studentId,
            String? quickExaminationId,
            String? orderId,
            String? feedbackId,
            String? typeDetail,
            String? inappNotiId,
            String? hasShareMessage,
            String? monthId,
            String? schoolTermId,
            String? code,
            String? requestId,
            String? schoolId,
            String? isCancelRequest)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXPayloadEntity() when $default != null:
        return $default(
            _that.action,
            _that.type,
            _that.title,
            _that.content,
            _that.notificationId,
            _that.studentCode,
            _that.attendanceLessonId,
            _that.assignId,
            _that.subsystem,
            _that.status,
            _that.eventType,
            _that.classroomName,
            _that.schoolYearId,
            _that.borrowTicketState,
            _that.id,
            _that.studentId,
            _that.quickExaminationId,
            _that.orderId,
            _that.feedbackId,
            _that.typeDetail,
            _that.inappNotiId,
            _that.hasShareMessage,
            _that.monthId,
            _that.schoolTermId,
            _that.code,
            _that.requestId,
            _that.schoolId,
            _that.isCancelRequest);
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
            String? action,
            String? type,
            String? title,
            String? content,
            String? notificationId,
            String? studentCode,
            String? attendanceLessonId,
            String? assignId,
            String? subsystem,
            String? status,
            String? eventType,
            String? classroomName,
            String? schoolYearId,
            String? borrowTicketState,
            String? id,
            String? studentId,
            String? quickExaminationId,
            String? orderId,
            String? feedbackId,
            String? typeDetail,
            String? inappNotiId,
            String? hasShareMessage,
            String? monthId,
            String? schoolTermId,
            String? code,
            String? requestId,
            String? schoolId,
            String? isCancelRequest)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXPayloadEntity():
        return $default(
            _that.action,
            _that.type,
            _that.title,
            _that.content,
            _that.notificationId,
            _that.studentCode,
            _that.attendanceLessonId,
            _that.assignId,
            _that.subsystem,
            _that.status,
            _that.eventType,
            _that.classroomName,
            _that.schoolYearId,
            _that.borrowTicketState,
            _that.id,
            _that.studentId,
            _that.quickExaminationId,
            _that.orderId,
            _that.feedbackId,
            _that.typeDetail,
            _that.inappNotiId,
            _that.hasShareMessage,
            _that.monthId,
            _that.schoolTermId,
            _that.code,
            _that.requestId,
            _that.schoolId,
            _that.isCancelRequest);
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
            String? action,
            String? type,
            String? title,
            String? content,
            String? notificationId,
            String? studentCode,
            String? attendanceLessonId,
            String? assignId,
            String? subsystem,
            String? status,
            String? eventType,
            String? classroomName,
            String? schoolYearId,
            String? borrowTicketState,
            String? id,
            String? studentId,
            String? quickExaminationId,
            String? orderId,
            String? feedbackId,
            String? typeDetail,
            String? inappNotiId,
            String? hasShareMessage,
            String? monthId,
            String? schoolTermId,
            String? code,
            String? requestId,
            String? schoolId,
            String? isCancelRequest)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXPayloadEntity() when $default != null:
        return $default(
            _that.action,
            _that.type,
            _that.title,
            _that.content,
            _that.notificationId,
            _that.studentCode,
            _that.attendanceLessonId,
            _that.assignId,
            _that.subsystem,
            _that.status,
            _that.eventType,
            _that.classroomName,
            _that.schoolYearId,
            _that.borrowTicketState,
            _that.id,
            _that.studentId,
            _that.quickExaminationId,
            _that.orderId,
            _that.feedbackId,
            _that.typeDetail,
            _that.inappNotiId,
            _that.hasShareMessage,
            _that.monthId,
            _that.schoolTermId,
            _that.code,
            _that.requestId,
            _that.schoolId,
            _that.isCancelRequest);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PHXPayloadEntity extends PHXPayloadEntity {
  const _PHXPayloadEntity(
      {this.action = '',
      this.type = '',
      this.title = '',
      this.content = '',
      this.notificationId = '',
      this.studentCode = '',
      this.attendanceLessonId = '',
      this.assignId = '',
      this.subsystem = '',
      this.status = '',
      this.eventType = '',
      this.classroomName = '',
      this.schoolYearId = '',
      this.borrowTicketState = '',
      this.id = '',
      this.studentId = '',
      this.quickExaminationId = '',
      this.orderId = '',
      this.feedbackId = '',
      this.typeDetail = '',
      this.inappNotiId = '',
      this.hasShareMessage = '',
      this.monthId = '',
      this.schoolTermId = '',
      this.code = '',
      this.requestId = '',
      this.schoolId = '',
      this.isCancelRequest = ''})
      : super._();

  @override
  @JsonKey()
  final String? action;
  @override
  @JsonKey()
  final String? type;
  @override
  @JsonKey()
  final String? title;
  @override
  @JsonKey()
  final String? content;
  @override
  @JsonKey()
  final String? notificationId;
  @override
  @JsonKey()
  final String? studentCode;
  @override
  @JsonKey()
  final String? attendanceLessonId;
  @override
  @JsonKey()
  final String? assignId;
  @override
  @JsonKey()
  final String? subsystem;
  @override
  @JsonKey()
  final String? status;
  @override
  @JsonKey()
  final String? eventType;
  @override
  @JsonKey()
  final String? classroomName;
  @override
  @JsonKey()
  final String? schoolYearId;
  @override
  @JsonKey()
  final String? borrowTicketState;
  @override
  @JsonKey()
  final String? id;
  @override
  @JsonKey()
  final String? studentId;
  @override
  @JsonKey()
  final String? quickExaminationId;
  @override
  @JsonKey()
  final String? orderId;
  @override
  @JsonKey()
  final String? feedbackId;
  @override
  @JsonKey()
  final String? typeDetail;
  @override
  @JsonKey()
  final String? inappNotiId;
  @override
  @JsonKey()
  final String? hasShareMessage;
  @override
  @JsonKey()
  final String? monthId;
  @override
  @JsonKey()
  final String? schoolTermId;
  @override
  @JsonKey()
  final String? code;
  @override
  @JsonKey()
  final String? requestId;
  @override
  @JsonKey()
  final String? schoolId;
  @override
  @JsonKey()
  final String? isCancelRequest;

  /// Create a copy of PHXPayloadEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXPayloadEntityCopyWith<_PHXPayloadEntity> get copyWith =>
      __$PHXPayloadEntityCopyWithImpl<_PHXPayloadEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXPayloadEntity &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId) &&
            (identical(other.studentCode, studentCode) ||
                other.studentCode == studentCode) &&
            (identical(other.attendanceLessonId, attendanceLessonId) ||
                other.attendanceLessonId == attendanceLessonId) &&
            (identical(other.assignId, assignId) ||
                other.assignId == assignId) &&
            (identical(other.subsystem, subsystem) ||
                other.subsystem == subsystem) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.classroomName, classroomName) ||
                other.classroomName == classroomName) &&
            (identical(other.schoolYearId, schoolYearId) ||
                other.schoolYearId == schoolYearId) &&
            (identical(other.borrowTicketState, borrowTicketState) ||
                other.borrowTicketState == borrowTicketState) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.quickExaminationId, quickExaminationId) ||
                other.quickExaminationId == quickExaminationId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.feedbackId, feedbackId) ||
                other.feedbackId == feedbackId) &&
            (identical(other.typeDetail, typeDetail) ||
                other.typeDetail == typeDetail) &&
            (identical(other.inappNotiId, inappNotiId) ||
                other.inappNotiId == inappNotiId) &&
            (identical(other.hasShareMessage, hasShareMessage) ||
                other.hasShareMessage == hasShareMessage) &&
            (identical(other.monthId, monthId) || other.monthId == monthId) &&
            (identical(other.schoolTermId, schoolTermId) ||
                other.schoolTermId == schoolTermId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.schoolId, schoolId) ||
                other.schoolId == schoolId) &&
            (identical(other.isCancelRequest, isCancelRequest) ||
                other.isCancelRequest == isCancelRequest));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        action,
        type,
        title,
        content,
        notificationId,
        studentCode,
        attendanceLessonId,
        assignId,
        subsystem,
        status,
        eventType,
        classroomName,
        schoolYearId,
        borrowTicketState,
        id,
        studentId,
        quickExaminationId,
        orderId,
        feedbackId,
        typeDetail,
        inappNotiId,
        hasShareMessage,
        monthId,
        schoolTermId,
        code,
        requestId,
        schoolId,
        isCancelRequest
      ]);

  @override
  String toString() {
    return 'PHXPayloadEntity(action: $action, type: $type, title: $title, content: $content, notificationId: $notificationId, studentCode: $studentCode, attendanceLessonId: $attendanceLessonId, assignId: $assignId, subsystem: $subsystem, status: $status, eventType: $eventType, classroomName: $classroomName, schoolYearId: $schoolYearId, borrowTicketState: $borrowTicketState, id: $id, studentId: $studentId, quickExaminationId: $quickExaminationId, orderId: $orderId, feedbackId: $feedbackId, typeDetail: $typeDetail, inappNotiId: $inappNotiId, hasShareMessage: $hasShareMessage, monthId: $monthId, schoolTermId: $schoolTermId, code: $code, requestId: $requestId, schoolId: $schoolId, isCancelRequest: $isCancelRequest)';
  }
}

/// @nodoc
abstract mixin class _$PHXPayloadEntityCopyWith<$Res>
    implements $PHXPayloadEntityCopyWith<$Res> {
  factory _$PHXPayloadEntityCopyWith(
          _PHXPayloadEntity value, $Res Function(_PHXPayloadEntity) _then) =
      __$PHXPayloadEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? action,
      String? type,
      String? title,
      String? content,
      String? notificationId,
      String? studentCode,
      String? attendanceLessonId,
      String? assignId,
      String? subsystem,
      String? status,
      String? eventType,
      String? classroomName,
      String? schoolYearId,
      String? borrowTicketState,
      String? id,
      String? studentId,
      String? quickExaminationId,
      String? orderId,
      String? feedbackId,
      String? typeDetail,
      String? inappNotiId,
      String? hasShareMessage,
      String? monthId,
      String? schoolTermId,
      String? code,
      String? requestId,
      String? schoolId,
      String? isCancelRequest});
}

/// @nodoc
class __$PHXPayloadEntityCopyWithImpl<$Res>
    implements _$PHXPayloadEntityCopyWith<$Res> {
  __$PHXPayloadEntityCopyWithImpl(this._self, this._then);

  final _PHXPayloadEntity _self;
  final $Res Function(_PHXPayloadEntity) _then;

  /// Create a copy of PHXPayloadEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? action = freezed,
    Object? type = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? notificationId = freezed,
    Object? studentCode = freezed,
    Object? attendanceLessonId = freezed,
    Object? assignId = freezed,
    Object? subsystem = freezed,
    Object? status = freezed,
    Object? eventType = freezed,
    Object? classroomName = freezed,
    Object? schoolYearId = freezed,
    Object? borrowTicketState = freezed,
    Object? id = freezed,
    Object? studentId = freezed,
    Object? quickExaminationId = freezed,
    Object? orderId = freezed,
    Object? feedbackId = freezed,
    Object? typeDetail = freezed,
    Object? inappNotiId = freezed,
    Object? hasShareMessage = freezed,
    Object? monthId = freezed,
    Object? schoolTermId = freezed,
    Object? code = freezed,
    Object? requestId = freezed,
    Object? schoolId = freezed,
    Object? isCancelRequest = freezed,
  }) {
    return _then(_PHXPayloadEntity(
      action: freezed == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationId: freezed == notificationId
          ? _self.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      studentCode: freezed == studentCode
          ? _self.studentCode
          : studentCode // ignore: cast_nullable_to_non_nullable
              as String?,
      attendanceLessonId: freezed == attendanceLessonId
          ? _self.attendanceLessonId
          : attendanceLessonId // ignore: cast_nullable_to_non_nullable
              as String?,
      assignId: freezed == assignId
          ? _self.assignId
          : assignId // ignore: cast_nullable_to_non_nullable
              as String?,
      subsystem: freezed == subsystem
          ? _self.subsystem
          : subsystem // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      eventType: freezed == eventType
          ? _self.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String?,
      classroomName: freezed == classroomName
          ? _self.classroomName
          : classroomName // ignore: cast_nullable_to_non_nullable
              as String?,
      schoolYearId: freezed == schoolYearId
          ? _self.schoolYearId
          : schoolYearId // ignore: cast_nullable_to_non_nullable
              as String?,
      borrowTicketState: freezed == borrowTicketState
          ? _self.borrowTicketState
          : borrowTicketState // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      studentId: freezed == studentId
          ? _self.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String?,
      quickExaminationId: freezed == quickExaminationId
          ? _self.quickExaminationId
          : quickExaminationId // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: freezed == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      feedbackId: freezed == feedbackId
          ? _self.feedbackId
          : feedbackId // ignore: cast_nullable_to_non_nullable
              as String?,
      typeDetail: freezed == typeDetail
          ? _self.typeDetail
          : typeDetail // ignore: cast_nullable_to_non_nullable
              as String?,
      inappNotiId: freezed == inappNotiId
          ? _self.inappNotiId
          : inappNotiId // ignore: cast_nullable_to_non_nullable
              as String?,
      hasShareMessage: freezed == hasShareMessage
          ? _self.hasShareMessage
          : hasShareMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      monthId: freezed == monthId
          ? _self.monthId
          : monthId // ignore: cast_nullable_to_non_nullable
              as String?,
      schoolTermId: freezed == schoolTermId
          ? _self.schoolTermId
          : schoolTermId // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      requestId: freezed == requestId
          ? _self.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      schoolId: freezed == schoolId
          ? _self.schoolId
          : schoolId // ignore: cast_nullable_to_non_nullable
              as String?,
      isCancelRequest: freezed == isCancelRequest
          ? _self.isCancelRequest
          : isCancelRequest // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$PHXMultiBadgeEntity {
  String? get badgeType;
  String? get content;
  String? get title;

  /// Create a copy of PHXMultiBadgeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXMultiBadgeEntityCopyWith<PHXMultiBadgeEntity> get copyWith =>
      _$PHXMultiBadgeEntityCopyWithImpl<PHXMultiBadgeEntity>(
          this as PHXMultiBadgeEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXMultiBadgeEntity &&
            (identical(other.badgeType, badgeType) ||
                other.badgeType == badgeType) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, badgeType, content, title);

  @override
  String toString() {
    return 'PHXMultiBadgeEntity(badgeType: $badgeType, content: $content, title: $title)';
  }
}

/// @nodoc
abstract mixin class $PHXMultiBadgeEntityCopyWith<$Res> {
  factory $PHXMultiBadgeEntityCopyWith(
          PHXMultiBadgeEntity value, $Res Function(PHXMultiBadgeEntity) _then) =
      _$PHXMultiBadgeEntityCopyWithImpl;
  @useResult
  $Res call({String? badgeType, String? content, String? title});
}

/// @nodoc
class _$PHXMultiBadgeEntityCopyWithImpl<$Res>
    implements $PHXMultiBadgeEntityCopyWith<$Res> {
  _$PHXMultiBadgeEntityCopyWithImpl(this._self, this._then);

  final PHXMultiBadgeEntity _self;
  final $Res Function(PHXMultiBadgeEntity) _then;

  /// Create a copy of PHXMultiBadgeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? badgeType = freezed,
    Object? content = freezed,
    Object? title = freezed,
  }) {
    return _then(_self.copyWith(
      badgeType: freezed == badgeType
          ? _self.badgeType
          : badgeType // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PHXMultiBadgeEntity].
extension PHXMultiBadgeEntityPatterns on PHXMultiBadgeEntity {
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
    TResult Function(_PHXMultiBadgeEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXMultiBadgeEntity() when $default != null:
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
    TResult Function(_PHXMultiBadgeEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXMultiBadgeEntity():
        return $default(_that);
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
    TResult? Function(_PHXMultiBadgeEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXMultiBadgeEntity() when $default != null:
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
    TResult Function(String? badgeType, String? content, String? title)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXMultiBadgeEntity() when $default != null:
        return $default(_that.badgeType, _that.content, _that.title);
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
    TResult Function(String? badgeType, String? content, String? title)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXMultiBadgeEntity():
        return $default(_that.badgeType, _that.content, _that.title);
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
    TResult? Function(String? badgeType, String? content, String? title)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXMultiBadgeEntity() when $default != null:
        return $default(_that.badgeType, _that.content, _that.title);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PHXMultiBadgeEntity extends PHXMultiBadgeEntity {
  const _PHXMultiBadgeEntity(
      {this.badgeType = '', this.content = '', this.title = ''})
      : super._();

  @override
  @JsonKey()
  final String? badgeType;
  @override
  @JsonKey()
  final String? content;
  @override
  @JsonKey()
  final String? title;

  /// Create a copy of PHXMultiBadgeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXMultiBadgeEntityCopyWith<_PHXMultiBadgeEntity> get copyWith =>
      __$PHXMultiBadgeEntityCopyWithImpl<_PHXMultiBadgeEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXMultiBadgeEntity &&
            (identical(other.badgeType, badgeType) ||
                other.badgeType == badgeType) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, badgeType, content, title);

  @override
  String toString() {
    return 'PHXMultiBadgeEntity(badgeType: $badgeType, content: $content, title: $title)';
  }
}

/// @nodoc
abstract mixin class _$PHXMultiBadgeEntityCopyWith<$Res>
    implements $PHXMultiBadgeEntityCopyWith<$Res> {
  factory _$PHXMultiBadgeEntityCopyWith(_PHXMultiBadgeEntity value,
          $Res Function(_PHXMultiBadgeEntity) _then) =
      __$PHXMultiBadgeEntityCopyWithImpl;
  @override
  @useResult
  $Res call({String? badgeType, String? content, String? title});
}

/// @nodoc
class __$PHXMultiBadgeEntityCopyWithImpl<$Res>
    implements _$PHXMultiBadgeEntityCopyWith<$Res> {
  __$PHXMultiBadgeEntityCopyWithImpl(this._self, this._then);

  final _PHXMultiBadgeEntity _self;
  final $Res Function(_PHXMultiBadgeEntity) _then;

  /// Create a copy of PHXMultiBadgeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? badgeType = freezed,
    Object? content = freezed,
    Object? title = freezed,
  }) {
    return _then(_PHXMultiBadgeEntity(
      badgeType: freezed == badgeType
          ? _self.badgeType
          : badgeType // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$PHXStudentEntity {
  int? get id;
  int? get studentId;
  String? get name;
  String? get avatarUrl;
  String? get subTitle;

  /// Create a copy of PHXStudentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXStudentEntityCopyWith<PHXStudentEntity> get copyWith =>
      _$PHXStudentEntityCopyWithImpl<PHXStudentEntity>(
          this as PHXStudentEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXStudentEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, studentId, name, avatarUrl, subTitle);

  @override
  String toString() {
    return 'PHXStudentEntity(id: $id, studentId: $studentId, name: $name, avatarUrl: $avatarUrl, subTitle: $subTitle)';
  }
}

/// @nodoc
abstract mixin class $PHXStudentEntityCopyWith<$Res> {
  factory $PHXStudentEntityCopyWith(
          PHXStudentEntity value, $Res Function(PHXStudentEntity) _then) =
      _$PHXStudentEntityCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      int? studentId,
      String? name,
      String? avatarUrl,
      String? subTitle});
}

/// @nodoc
class _$PHXStudentEntityCopyWithImpl<$Res>
    implements $PHXStudentEntityCopyWith<$Res> {
  _$PHXStudentEntityCopyWithImpl(this._self, this._then);

  final PHXStudentEntity _self;
  final $Res Function(PHXStudentEntity) _then;

  /// Create a copy of PHXStudentEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? studentId = freezed,
    Object? name = freezed,
    Object? avatarUrl = freezed,
    Object? subTitle = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      studentId: freezed == studentId
          ? _self.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      subTitle: freezed == subTitle
          ? _self.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PHXStudentEntity].
extension PHXStudentEntityPatterns on PHXStudentEntity {
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
    TResult Function(_PHXStudentEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXStudentEntity() when $default != null:
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
    TResult Function(_PHXStudentEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXStudentEntity():
        return $default(_that);
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
    TResult? Function(_PHXStudentEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXStudentEntity() when $default != null:
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
    TResult Function(int? id, int? studentId, String? name, String? avatarUrl,
            String? subTitle)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXStudentEntity() when $default != null:
        return $default(_that.id, _that.studentId, _that.name, _that.avatarUrl,
            _that.subTitle);
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
    TResult Function(int? id, int? studentId, String? name, String? avatarUrl,
            String? subTitle)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXStudentEntity():
        return $default(_that.id, _that.studentId, _that.name, _that.avatarUrl,
            _that.subTitle);
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
    TResult? Function(int? id, int? studentId, String? name, String? avatarUrl,
            String? subTitle)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXStudentEntity() when $default != null:
        return $default(_that.id, _that.studentId, _that.name, _that.avatarUrl,
            _that.subTitle);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PHXStudentEntity extends PHXStudentEntity {
  const _PHXStudentEntity(
      {this.id = 0,
      this.studentId = 0,
      this.name = '',
      this.avatarUrl = '',
      this.subTitle = ''})
      : super._();

  @override
  @JsonKey()
  final int? id;
  @override
  @JsonKey()
  final int? studentId;
  @override
  @JsonKey()
  final String? name;
  @override
  @JsonKey()
  final String? avatarUrl;
  @override
  @JsonKey()
  final String? subTitle;

  /// Create a copy of PHXStudentEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXStudentEntityCopyWith<_PHXStudentEntity> get copyWith =>
      __$PHXStudentEntityCopyWithImpl<_PHXStudentEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXStudentEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, studentId, name, avatarUrl, subTitle);

  @override
  String toString() {
    return 'PHXStudentEntity(id: $id, studentId: $studentId, name: $name, avatarUrl: $avatarUrl, subTitle: $subTitle)';
  }
}

/// @nodoc
abstract mixin class _$PHXStudentEntityCopyWith<$Res>
    implements $PHXStudentEntityCopyWith<$Res> {
  factory _$PHXStudentEntityCopyWith(
          _PHXStudentEntity value, $Res Function(_PHXStudentEntity) _then) =
      __$PHXStudentEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      int? studentId,
      String? name,
      String? avatarUrl,
      String? subTitle});
}

/// @nodoc
class __$PHXStudentEntityCopyWithImpl<$Res>
    implements _$PHXStudentEntityCopyWith<$Res> {
  __$PHXStudentEntityCopyWithImpl(this._self, this._then);

  final _PHXStudentEntity _self;
  final $Res Function(_PHXStudentEntity) _then;

  /// Create a copy of PHXStudentEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? studentId = freezed,
    Object? name = freezed,
    Object? avatarUrl = freezed,
    Object? subTitle = freezed,
  }) {
    return _then(_PHXStudentEntity(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      studentId: freezed == studentId
          ? _self.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      subTitle: freezed == subTitle
          ? _self.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$PHXSectionItemDetailEntity {
  int? get id;
  String? get title;
  String? get content;
  List<PHXSectionItemDetailIconEntity>? get icon;
  List<PHXSectionContentTypeEntity>? get type;
  bool? get showDivider;
  bool? get isBreakLine;
  bool? get isJustify;
  String? get badgeType;
  PHXSectionItemBadgeEntity? get badge;
  bool? get isActionItem;
  String? get imageUrl;
  PHXExtraEntity? get extra;

  /// Create a copy of PHXSectionItemDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXSectionItemDetailEntityCopyWith<PHXSectionItemDetailEntity>
      get copyWith =>
          _$PHXSectionItemDetailEntityCopyWithImpl<PHXSectionItemDetailEntity>(
              this as PHXSectionItemDetailEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXSectionItemDetailEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other.icon, icon) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            (identical(other.showDivider, showDivider) ||
                other.showDivider == showDivider) &&
            (identical(other.isBreakLine, isBreakLine) ||
                other.isBreakLine == isBreakLine) &&
            (identical(other.isJustify, isJustify) ||
                other.isJustify == isJustify) &&
            (identical(other.badgeType, badgeType) ||
                other.badgeType == badgeType) &&
            (identical(other.badge, badge) || other.badge == badge) &&
            (identical(other.isActionItem, isActionItem) ||
                other.isActionItem == isActionItem) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.extra, extra) || other.extra == extra));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      content,
      const DeepCollectionEquality().hash(icon),
      const DeepCollectionEquality().hash(type),
      showDivider,
      isBreakLine,
      isJustify,
      badgeType,
      badge,
      isActionItem,
      imageUrl,
      extra);

  @override
  String toString() {
    return 'PHXSectionItemDetailEntity(id: $id, title: $title, content: $content, icon: $icon, type: $type, showDivider: $showDivider, isBreakLine: $isBreakLine, isJustify: $isJustify, badgeType: $badgeType, badge: $badge, isActionItem: $isActionItem, imageUrl: $imageUrl, extra: $extra)';
  }
}

/// @nodoc
abstract mixin class $PHXSectionItemDetailEntityCopyWith<$Res> {
  factory $PHXSectionItemDetailEntityCopyWith(PHXSectionItemDetailEntity value,
          $Res Function(PHXSectionItemDetailEntity) _then) =
      _$PHXSectionItemDetailEntityCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? content,
      List<PHXSectionItemDetailIconEntity>? icon,
      List<PHXSectionContentTypeEntity>? type,
      bool? showDivider,
      bool? isBreakLine,
      bool? isJustify,
      String? badgeType,
      PHXSectionItemBadgeEntity? badge,
      bool? isActionItem,
      String? imageUrl,
      PHXExtraEntity? extra});

  $PHXSectionItemBadgeEntityCopyWith<$Res>? get badge;
  $PHXExtraEntityCopyWith<$Res>? get extra;
}

/// @nodoc
class _$PHXSectionItemDetailEntityCopyWithImpl<$Res>
    implements $PHXSectionItemDetailEntityCopyWith<$Res> {
  _$PHXSectionItemDetailEntityCopyWithImpl(this._self, this._then);

  final PHXSectionItemDetailEntity _self;
  final $Res Function(PHXSectionItemDetailEntity) _then;

  /// Create a copy of PHXSectionItemDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? icon = freezed,
    Object? type = freezed,
    Object? showDivider = freezed,
    Object? isBreakLine = freezed,
    Object? isJustify = freezed,
    Object? badgeType = freezed,
    Object? badge = freezed,
    Object? isActionItem = freezed,
    Object? imageUrl = freezed,
    Object? extra = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as List<PHXSectionItemDetailIconEntity>?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as List<PHXSectionContentTypeEntity>?,
      showDivider: freezed == showDivider
          ? _self.showDivider
          : showDivider // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBreakLine: freezed == isBreakLine
          ? _self.isBreakLine
          : isBreakLine // ignore: cast_nullable_to_non_nullable
              as bool?,
      isJustify: freezed == isJustify
          ? _self.isJustify
          : isJustify // ignore: cast_nullable_to_non_nullable
              as bool?,
      badgeType: freezed == badgeType
          ? _self.badgeType
          : badgeType // ignore: cast_nullable_to_non_nullable
              as String?,
      badge: freezed == badge
          ? _self.badge
          : badge // ignore: cast_nullable_to_non_nullable
              as PHXSectionItemBadgeEntity?,
      isActionItem: freezed == isActionItem
          ? _self.isActionItem
          : isActionItem // ignore: cast_nullable_to_non_nullable
              as bool?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      extra: freezed == extra
          ? _self.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as PHXExtraEntity?,
    ));
  }

  /// Create a copy of PHXSectionItemDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXSectionItemBadgeEntityCopyWith<$Res>? get badge {
    if (_self.badge == null) {
      return null;
    }

    return $PHXSectionItemBadgeEntityCopyWith<$Res>(_self.badge!, (value) {
      return _then(_self.copyWith(badge: value));
    });
  }

  /// Create a copy of PHXSectionItemDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXExtraEntityCopyWith<$Res>? get extra {
    if (_self.extra == null) {
      return null;
    }

    return $PHXExtraEntityCopyWith<$Res>(_self.extra!, (value) {
      return _then(_self.copyWith(extra: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PHXSectionItemDetailEntity].
extension PHXSectionItemDetailEntityPatterns on PHXSectionItemDetailEntity {
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
    TResult Function(_PHXSectionItemDetailEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemDetailEntity() when $default != null:
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
    TResult Function(_PHXSectionItemDetailEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemDetailEntity():
        return $default(_that);
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
    TResult? Function(_PHXSectionItemDetailEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemDetailEntity() when $default != null:
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
            int? id,
            String? title,
            String? content,
            List<PHXSectionItemDetailIconEntity>? icon,
            List<PHXSectionContentTypeEntity>? type,
            bool? showDivider,
            bool? isBreakLine,
            bool? isJustify,
            String? badgeType,
            PHXSectionItemBadgeEntity? badge,
            bool? isActionItem,
            String? imageUrl,
            PHXExtraEntity? extra)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemDetailEntity() when $default != null:
        return $default(
            _that.id,
            _that.title,
            _that.content,
            _that.icon,
            _that.type,
            _that.showDivider,
            _that.isBreakLine,
            _that.isJustify,
            _that.badgeType,
            _that.badge,
            _that.isActionItem,
            _that.imageUrl,
            _that.extra);
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
            int? id,
            String? title,
            String? content,
            List<PHXSectionItemDetailIconEntity>? icon,
            List<PHXSectionContentTypeEntity>? type,
            bool? showDivider,
            bool? isBreakLine,
            bool? isJustify,
            String? badgeType,
            PHXSectionItemBadgeEntity? badge,
            bool? isActionItem,
            String? imageUrl,
            PHXExtraEntity? extra)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemDetailEntity():
        return $default(
            _that.id,
            _that.title,
            _that.content,
            _that.icon,
            _that.type,
            _that.showDivider,
            _that.isBreakLine,
            _that.isJustify,
            _that.badgeType,
            _that.badge,
            _that.isActionItem,
            _that.imageUrl,
            _that.extra);
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
            int? id,
            String? title,
            String? content,
            List<PHXSectionItemDetailIconEntity>? icon,
            List<PHXSectionContentTypeEntity>? type,
            bool? showDivider,
            bool? isBreakLine,
            bool? isJustify,
            String? badgeType,
            PHXSectionItemBadgeEntity? badge,
            bool? isActionItem,
            String? imageUrl,
            PHXExtraEntity? extra)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemDetailEntity() when $default != null:
        return $default(
            _that.id,
            _that.title,
            _that.content,
            _that.icon,
            _that.type,
            _that.showDivider,
            _that.isBreakLine,
            _that.isJustify,
            _that.badgeType,
            _that.badge,
            _that.isActionItem,
            _that.imageUrl,
            _that.extra);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PHXSectionItemDetailEntity extends PHXSectionItemDetailEntity {
  const _PHXSectionItemDetailEntity(
      {this.id = 0,
      this.title = '',
      this.content = '',
      final List<PHXSectionItemDetailIconEntity>? icon = const [],
      final List<PHXSectionContentTypeEntity>? type = const [],
      this.showDivider = false,
      this.isBreakLine = false,
      this.isJustify = false,
      this.badgeType = 'default',
      this.badge = null,
      this.isActionItem = false,
      this.imageUrl = '',
      this.extra = null})
      : _icon = icon,
        _type = type,
        super._();

  @override
  @JsonKey()
  final int? id;
  @override
  @JsonKey()
  final String? title;
  @override
  @JsonKey()
  final String? content;
  final List<PHXSectionItemDetailIconEntity>? _icon;
  @override
  @JsonKey()
  List<PHXSectionItemDetailIconEntity>? get icon {
    final value = _icon;
    if (value == null) return null;
    if (_icon is EqualUnmodifiableListView) return _icon;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<PHXSectionContentTypeEntity>? _type;
  @override
  @JsonKey()
  List<PHXSectionContentTypeEntity>? get type {
    final value = _type;
    if (value == null) return null;
    if (_type is EqualUnmodifiableListView) return _type;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool? showDivider;
  @override
  @JsonKey()
  final bool? isBreakLine;
  @override
  @JsonKey()
  final bool? isJustify;
  @override
  @JsonKey()
  final String? badgeType;
  @override
  @JsonKey()
  final PHXSectionItemBadgeEntity? badge;
  @override
  @JsonKey()
  final bool? isActionItem;
  @override
  @JsonKey()
  final String? imageUrl;
  @override
  @JsonKey()
  final PHXExtraEntity? extra;

  /// Create a copy of PHXSectionItemDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXSectionItemDetailEntityCopyWith<_PHXSectionItemDetailEntity>
      get copyWith => __$PHXSectionItemDetailEntityCopyWithImpl<
          _PHXSectionItemDetailEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXSectionItemDetailEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other._icon, _icon) &&
            const DeepCollectionEquality().equals(other._type, _type) &&
            (identical(other.showDivider, showDivider) ||
                other.showDivider == showDivider) &&
            (identical(other.isBreakLine, isBreakLine) ||
                other.isBreakLine == isBreakLine) &&
            (identical(other.isJustify, isJustify) ||
                other.isJustify == isJustify) &&
            (identical(other.badgeType, badgeType) ||
                other.badgeType == badgeType) &&
            (identical(other.badge, badge) || other.badge == badge) &&
            (identical(other.isActionItem, isActionItem) ||
                other.isActionItem == isActionItem) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.extra, extra) || other.extra == extra));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      content,
      const DeepCollectionEquality().hash(_icon),
      const DeepCollectionEquality().hash(_type),
      showDivider,
      isBreakLine,
      isJustify,
      badgeType,
      badge,
      isActionItem,
      imageUrl,
      extra);

  @override
  String toString() {
    return 'PHXSectionItemDetailEntity(id: $id, title: $title, content: $content, icon: $icon, type: $type, showDivider: $showDivider, isBreakLine: $isBreakLine, isJustify: $isJustify, badgeType: $badgeType, badge: $badge, isActionItem: $isActionItem, imageUrl: $imageUrl, extra: $extra)';
  }
}

/// @nodoc
abstract mixin class _$PHXSectionItemDetailEntityCopyWith<$Res>
    implements $PHXSectionItemDetailEntityCopyWith<$Res> {
  factory _$PHXSectionItemDetailEntityCopyWith(
          _PHXSectionItemDetailEntity value,
          $Res Function(_PHXSectionItemDetailEntity) _then) =
      __$PHXSectionItemDetailEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? content,
      List<PHXSectionItemDetailIconEntity>? icon,
      List<PHXSectionContentTypeEntity>? type,
      bool? showDivider,
      bool? isBreakLine,
      bool? isJustify,
      String? badgeType,
      PHXSectionItemBadgeEntity? badge,
      bool? isActionItem,
      String? imageUrl,
      PHXExtraEntity? extra});

  @override
  $PHXSectionItemBadgeEntityCopyWith<$Res>? get badge;
  @override
  $PHXExtraEntityCopyWith<$Res>? get extra;
}

/// @nodoc
class __$PHXSectionItemDetailEntityCopyWithImpl<$Res>
    implements _$PHXSectionItemDetailEntityCopyWith<$Res> {
  __$PHXSectionItemDetailEntityCopyWithImpl(this._self, this._then);

  final _PHXSectionItemDetailEntity _self;
  final $Res Function(_PHXSectionItemDetailEntity) _then;

  /// Create a copy of PHXSectionItemDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? icon = freezed,
    Object? type = freezed,
    Object? showDivider = freezed,
    Object? isBreakLine = freezed,
    Object? isJustify = freezed,
    Object? badgeType = freezed,
    Object? badge = freezed,
    Object? isActionItem = freezed,
    Object? imageUrl = freezed,
    Object? extra = freezed,
  }) {
    return _then(_PHXSectionItemDetailEntity(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _self._icon
          : icon // ignore: cast_nullable_to_non_nullable
              as List<PHXSectionItemDetailIconEntity>?,
      type: freezed == type
          ? _self._type
          : type // ignore: cast_nullable_to_non_nullable
              as List<PHXSectionContentTypeEntity>?,
      showDivider: freezed == showDivider
          ? _self.showDivider
          : showDivider // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBreakLine: freezed == isBreakLine
          ? _self.isBreakLine
          : isBreakLine // ignore: cast_nullable_to_non_nullable
              as bool?,
      isJustify: freezed == isJustify
          ? _self.isJustify
          : isJustify // ignore: cast_nullable_to_non_nullable
              as bool?,
      badgeType: freezed == badgeType
          ? _self.badgeType
          : badgeType // ignore: cast_nullable_to_non_nullable
              as String?,
      badge: freezed == badge
          ? _self.badge
          : badge // ignore: cast_nullable_to_non_nullable
              as PHXSectionItemBadgeEntity?,
      isActionItem: freezed == isActionItem
          ? _self.isActionItem
          : isActionItem // ignore: cast_nullable_to_non_nullable
              as bool?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      extra: freezed == extra
          ? _self.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as PHXExtraEntity?,
    ));
  }

  /// Create a copy of PHXSectionItemDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXSectionItemBadgeEntityCopyWith<$Res>? get badge {
    if (_self.badge == null) {
      return null;
    }

    return $PHXSectionItemBadgeEntityCopyWith<$Res>(_self.badge!, (value) {
      return _then(_self.copyWith(badge: value));
    });
  }

  /// Create a copy of PHXSectionItemDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXExtraEntityCopyWith<$Res>? get extra {
    if (_self.extra == null) {
      return null;
    }

    return $PHXExtraEntityCopyWith<$Res>(_self.extra!, (value) {
      return _then(_self.copyWith(extra: value));
    });
  }
}

/// @nodoc
mixin _$PHXSectionItemDetailIconEntity {
  String? get url;
  String? get action;

  /// Create a copy of PHXSectionItemDetailIconEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXSectionItemDetailIconEntityCopyWith<PHXSectionItemDetailIconEntity>
      get copyWith => _$PHXSectionItemDetailIconEntityCopyWithImpl<
              PHXSectionItemDetailIconEntity>(
          this as PHXSectionItemDetailIconEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXSectionItemDetailIconEntity &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.action, action) || other.action == action));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url, action);

  @override
  String toString() {
    return 'PHXSectionItemDetailIconEntity(url: $url, action: $action)';
  }
}

/// @nodoc
abstract mixin class $PHXSectionItemDetailIconEntityCopyWith<$Res> {
  factory $PHXSectionItemDetailIconEntityCopyWith(
          PHXSectionItemDetailIconEntity value,
          $Res Function(PHXSectionItemDetailIconEntity) _then) =
      _$PHXSectionItemDetailIconEntityCopyWithImpl;
  @useResult
  $Res call({String? url, String? action});
}

/// @nodoc
class _$PHXSectionItemDetailIconEntityCopyWithImpl<$Res>
    implements $PHXSectionItemDetailIconEntityCopyWith<$Res> {
  _$PHXSectionItemDetailIconEntityCopyWithImpl(this._self, this._then);

  final PHXSectionItemDetailIconEntity _self;
  final $Res Function(PHXSectionItemDetailIconEntity) _then;

  /// Create a copy of PHXSectionItemDetailIconEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? action = freezed,
  }) {
    return _then(_self.copyWith(
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      action: freezed == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PHXSectionItemDetailIconEntity].
extension PHXSectionItemDetailIconEntityPatterns
    on PHXSectionItemDetailIconEntity {
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
    TResult Function(_PHXSectionItemDetailIconEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemDetailIconEntity() when $default != null:
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
    TResult Function(_PHXSectionItemDetailIconEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemDetailIconEntity():
        return $default(_that);
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
    TResult? Function(_PHXSectionItemDetailIconEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemDetailIconEntity() when $default != null:
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
    TResult Function(String? url, String? action)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemDetailIconEntity() when $default != null:
        return $default(_that.url, _that.action);
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
    TResult Function(String? url, String? action) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemDetailIconEntity():
        return $default(_that.url, _that.action);
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
    TResult? Function(String? url, String? action)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemDetailIconEntity() when $default != null:
        return $default(_that.url, _that.action);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PHXSectionItemDetailIconEntity extends PHXSectionItemDetailIconEntity {
  const _PHXSectionItemDetailIconEntity({this.url = '', this.action = ''})
      : super._();

  @override
  @JsonKey()
  final String? url;
  @override
  @JsonKey()
  final String? action;

  /// Create a copy of PHXSectionItemDetailIconEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXSectionItemDetailIconEntityCopyWith<_PHXSectionItemDetailIconEntity>
      get copyWith => __$PHXSectionItemDetailIconEntityCopyWithImpl<
          _PHXSectionItemDetailIconEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXSectionItemDetailIconEntity &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.action, action) || other.action == action));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url, action);

  @override
  String toString() {
    return 'PHXSectionItemDetailIconEntity(url: $url, action: $action)';
  }
}

/// @nodoc
abstract mixin class _$PHXSectionItemDetailIconEntityCopyWith<$Res>
    implements $PHXSectionItemDetailIconEntityCopyWith<$Res> {
  factory _$PHXSectionItemDetailIconEntityCopyWith(
          _PHXSectionItemDetailIconEntity value,
          $Res Function(_PHXSectionItemDetailIconEntity) _then) =
      __$PHXSectionItemDetailIconEntityCopyWithImpl;
  @override
  @useResult
  $Res call({String? url, String? action});
}

/// @nodoc
class __$PHXSectionItemDetailIconEntityCopyWithImpl<$Res>
    implements _$PHXSectionItemDetailIconEntityCopyWith<$Res> {
  __$PHXSectionItemDetailIconEntityCopyWithImpl(this._self, this._then);

  final _PHXSectionItemDetailIconEntity _self;
  final $Res Function(_PHXSectionItemDetailIconEntity) _then;

  /// Create a copy of PHXSectionItemDetailIconEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? url = freezed,
    Object? action = freezed,
  }) {
    return _then(_PHXSectionItemDetailIconEntity(
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      action: freezed == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$PHXSectionContentTypeEntity {
  bool? get isDisable;
  bool? get isEnable;
  bool? get isTextArea;

  /// Create a copy of PHXSectionContentTypeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXSectionContentTypeEntityCopyWith<PHXSectionContentTypeEntity>
      get copyWith => _$PHXSectionContentTypeEntityCopyWithImpl<
              PHXSectionContentTypeEntity>(
          this as PHXSectionContentTypeEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXSectionContentTypeEntity &&
            (identical(other.isDisable, isDisable) ||
                other.isDisable == isDisable) &&
            (identical(other.isEnable, isEnable) ||
                other.isEnable == isEnable) &&
            (identical(other.isTextArea, isTextArea) ||
                other.isTextArea == isTextArea));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDisable, isEnable, isTextArea);

  @override
  String toString() {
    return 'PHXSectionContentTypeEntity(isDisable: $isDisable, isEnable: $isEnable, isTextArea: $isTextArea)';
  }
}

/// @nodoc
abstract mixin class $PHXSectionContentTypeEntityCopyWith<$Res> {
  factory $PHXSectionContentTypeEntityCopyWith(
          PHXSectionContentTypeEntity value,
          $Res Function(PHXSectionContentTypeEntity) _then) =
      _$PHXSectionContentTypeEntityCopyWithImpl;
  @useResult
  $Res call({bool? isDisable, bool? isEnable, bool? isTextArea});
}

/// @nodoc
class _$PHXSectionContentTypeEntityCopyWithImpl<$Res>
    implements $PHXSectionContentTypeEntityCopyWith<$Res> {
  _$PHXSectionContentTypeEntityCopyWithImpl(this._self, this._then);

  final PHXSectionContentTypeEntity _self;
  final $Res Function(PHXSectionContentTypeEntity) _then;

  /// Create a copy of PHXSectionContentTypeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDisable = freezed,
    Object? isEnable = freezed,
    Object? isTextArea = freezed,
  }) {
    return _then(_self.copyWith(
      isDisable: freezed == isDisable
          ? _self.isDisable
          : isDisable // ignore: cast_nullable_to_non_nullable
              as bool?,
      isEnable: freezed == isEnable
          ? _self.isEnable
          : isEnable // ignore: cast_nullable_to_non_nullable
              as bool?,
      isTextArea: freezed == isTextArea
          ? _self.isTextArea
          : isTextArea // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PHXSectionContentTypeEntity].
extension PHXSectionContentTypeEntityPatterns on PHXSectionContentTypeEntity {
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
    TResult Function(_PHXSectionContentTypeEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXSectionContentTypeEntity() when $default != null:
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
    TResult Function(_PHXSectionContentTypeEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionContentTypeEntity():
        return $default(_that);
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
    TResult? Function(_PHXSectionContentTypeEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionContentTypeEntity() when $default != null:
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
    TResult Function(bool? isDisable, bool? isEnable, bool? isTextArea)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXSectionContentTypeEntity() when $default != null:
        return $default(_that.isDisable, _that.isEnable, _that.isTextArea);
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
    TResult Function(bool? isDisable, bool? isEnable, bool? isTextArea)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionContentTypeEntity():
        return $default(_that.isDisable, _that.isEnable, _that.isTextArea);
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
    TResult? Function(bool? isDisable, bool? isEnable, bool? isTextArea)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionContentTypeEntity() when $default != null:
        return $default(_that.isDisable, _that.isEnable, _that.isTextArea);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PHXSectionContentTypeEntity extends PHXSectionContentTypeEntity {
  const _PHXSectionContentTypeEntity(
      {this.isDisable = false, this.isEnable = false, this.isTextArea = false})
      : super._();

  @override
  @JsonKey()
  final bool? isDisable;
  @override
  @JsonKey()
  final bool? isEnable;
  @override
  @JsonKey()
  final bool? isTextArea;

  /// Create a copy of PHXSectionContentTypeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXSectionContentTypeEntityCopyWith<_PHXSectionContentTypeEntity>
      get copyWith => __$PHXSectionContentTypeEntityCopyWithImpl<
          _PHXSectionContentTypeEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXSectionContentTypeEntity &&
            (identical(other.isDisable, isDisable) ||
                other.isDisable == isDisable) &&
            (identical(other.isEnable, isEnable) ||
                other.isEnable == isEnable) &&
            (identical(other.isTextArea, isTextArea) ||
                other.isTextArea == isTextArea));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDisable, isEnable, isTextArea);

  @override
  String toString() {
    return 'PHXSectionContentTypeEntity(isDisable: $isDisable, isEnable: $isEnable, isTextArea: $isTextArea)';
  }
}

/// @nodoc
abstract mixin class _$PHXSectionContentTypeEntityCopyWith<$Res>
    implements $PHXSectionContentTypeEntityCopyWith<$Res> {
  factory _$PHXSectionContentTypeEntityCopyWith(
          _PHXSectionContentTypeEntity value,
          $Res Function(_PHXSectionContentTypeEntity) _then) =
      __$PHXSectionContentTypeEntityCopyWithImpl;
  @override
  @useResult
  $Res call({bool? isDisable, bool? isEnable, bool? isTextArea});
}

/// @nodoc
class __$PHXSectionContentTypeEntityCopyWithImpl<$Res>
    implements _$PHXSectionContentTypeEntityCopyWith<$Res> {
  __$PHXSectionContentTypeEntityCopyWithImpl(this._self, this._then);

  final _PHXSectionContentTypeEntity _self;
  final $Res Function(_PHXSectionContentTypeEntity) _then;

  /// Create a copy of PHXSectionContentTypeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isDisable = freezed,
    Object? isEnable = freezed,
    Object? isTextArea = freezed,
  }) {
    return _then(_PHXSectionContentTypeEntity(
      isDisable: freezed == isDisable
          ? _self.isDisable
          : isDisable // ignore: cast_nullable_to_non_nullable
              as bool?,
      isEnable: freezed == isEnable
          ? _self.isEnable
          : isEnable // ignore: cast_nullable_to_non_nullable
              as bool?,
      isTextArea: freezed == isTextArea
          ? _self.isTextArea
          : isTextArea // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
mixin _$PHXSectionItemBadgeEntity {
  String? get title;
  String? get content;
  String? get badgeType;

  /// Create a copy of PHXSectionItemBadgeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXSectionItemBadgeEntityCopyWith<PHXSectionItemBadgeEntity> get copyWith =>
      _$PHXSectionItemBadgeEntityCopyWithImpl<PHXSectionItemBadgeEntity>(
          this as PHXSectionItemBadgeEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXSectionItemBadgeEntity &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.badgeType, badgeType) ||
                other.badgeType == badgeType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, content, badgeType);

  @override
  String toString() {
    return 'PHXSectionItemBadgeEntity(title: $title, content: $content, badgeType: $badgeType)';
  }
}

/// @nodoc
abstract mixin class $PHXSectionItemBadgeEntityCopyWith<$Res> {
  factory $PHXSectionItemBadgeEntityCopyWith(PHXSectionItemBadgeEntity value,
          $Res Function(PHXSectionItemBadgeEntity) _then) =
      _$PHXSectionItemBadgeEntityCopyWithImpl;
  @useResult
  $Res call({String? title, String? content, String? badgeType});
}

/// @nodoc
class _$PHXSectionItemBadgeEntityCopyWithImpl<$Res>
    implements $PHXSectionItemBadgeEntityCopyWith<$Res> {
  _$PHXSectionItemBadgeEntityCopyWithImpl(this._self, this._then);

  final PHXSectionItemBadgeEntity _self;
  final $Res Function(PHXSectionItemBadgeEntity) _then;

  /// Create a copy of PHXSectionItemBadgeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
    Object? badgeType = freezed,
  }) {
    return _then(_self.copyWith(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      badgeType: freezed == badgeType
          ? _self.badgeType
          : badgeType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PHXSectionItemBadgeEntity].
extension PHXSectionItemBadgeEntityPatterns on PHXSectionItemBadgeEntity {
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
    TResult Function(_PHXSectionItemBadgeEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemBadgeEntity() when $default != null:
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
    TResult Function(_PHXSectionItemBadgeEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemBadgeEntity():
        return $default(_that);
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
    TResult? Function(_PHXSectionItemBadgeEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemBadgeEntity() when $default != null:
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
    TResult Function(String? title, String? content, String? badgeType)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemBadgeEntity() when $default != null:
        return $default(_that.title, _that.content, _that.badgeType);
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
    TResult Function(String? title, String? content, String? badgeType)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemBadgeEntity():
        return $default(_that.title, _that.content, _that.badgeType);
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
    TResult? Function(String? title, String? content, String? badgeType)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemBadgeEntity() when $default != null:
        return $default(_that.title, _that.content, _that.badgeType);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PHXSectionItemBadgeEntity extends PHXSectionItemBadgeEntity {
  const _PHXSectionItemBadgeEntity(
      {this.title = '', this.content = '', this.badgeType = 'default'})
      : super._();

  @override
  @JsonKey()
  final String? title;
  @override
  @JsonKey()
  final String? content;
  @override
  @JsonKey()
  final String? badgeType;

  /// Create a copy of PHXSectionItemBadgeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXSectionItemBadgeEntityCopyWith<_PHXSectionItemBadgeEntity>
      get copyWith =>
          __$PHXSectionItemBadgeEntityCopyWithImpl<_PHXSectionItemBadgeEntity>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXSectionItemBadgeEntity &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.badgeType, badgeType) ||
                other.badgeType == badgeType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, content, badgeType);

  @override
  String toString() {
    return 'PHXSectionItemBadgeEntity(title: $title, content: $content, badgeType: $badgeType)';
  }
}

/// @nodoc
abstract mixin class _$PHXSectionItemBadgeEntityCopyWith<$Res>
    implements $PHXSectionItemBadgeEntityCopyWith<$Res> {
  factory _$PHXSectionItemBadgeEntityCopyWith(_PHXSectionItemBadgeEntity value,
          $Res Function(_PHXSectionItemBadgeEntity) _then) =
      __$PHXSectionItemBadgeEntityCopyWithImpl;
  @override
  @useResult
  $Res call({String? title, String? content, String? badgeType});
}

/// @nodoc
class __$PHXSectionItemBadgeEntityCopyWithImpl<$Res>
    implements _$PHXSectionItemBadgeEntityCopyWith<$Res> {
  __$PHXSectionItemBadgeEntityCopyWithImpl(this._self, this._then);

  final _PHXSectionItemBadgeEntity _self;
  final $Res Function(_PHXSectionItemBadgeEntity) _then;

  /// Create a copy of PHXSectionItemBadgeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
    Object? badgeType = freezed,
  }) {
    return _then(_PHXSectionItemBadgeEntity(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      badgeType: freezed == badgeType
          ? _self.badgeType
          : badgeType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$PHXSectionItemBottomInfoEntity {
  String? get title;
  String? get subTitle;
  String? get avatarUrl;
  bool? get isContact;
  bool? get showDivider;
  List<PHXSectionItemDetailIconEntity>? get icon;

  /// Create a copy of PHXSectionItemBottomInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXSectionItemBottomInfoEntityCopyWith<PHXSectionItemBottomInfoEntity>
      get copyWith => _$PHXSectionItemBottomInfoEntityCopyWithImpl<
              PHXSectionItemBottomInfoEntity>(
          this as PHXSectionItemBottomInfoEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXSectionItemBottomInfoEntity &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.isContact, isContact) ||
                other.isContact == isContact) &&
            (identical(other.showDivider, showDivider) ||
                other.showDivider == showDivider) &&
            const DeepCollectionEquality().equals(other.icon, icon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, subTitle, avatarUrl,
      isContact, showDivider, const DeepCollectionEquality().hash(icon));

  @override
  String toString() {
    return 'PHXSectionItemBottomInfoEntity(title: $title, subTitle: $subTitle, avatarUrl: $avatarUrl, isContact: $isContact, showDivider: $showDivider, icon: $icon)';
  }
}

/// @nodoc
abstract mixin class $PHXSectionItemBottomInfoEntityCopyWith<$Res> {
  factory $PHXSectionItemBottomInfoEntityCopyWith(
          PHXSectionItemBottomInfoEntity value,
          $Res Function(PHXSectionItemBottomInfoEntity) _then) =
      _$PHXSectionItemBottomInfoEntityCopyWithImpl;
  @useResult
  $Res call(
      {String? title,
      String? subTitle,
      String? avatarUrl,
      bool? isContact,
      bool? showDivider,
      List<PHXSectionItemDetailIconEntity>? icon});
}

/// @nodoc
class _$PHXSectionItemBottomInfoEntityCopyWithImpl<$Res>
    implements $PHXSectionItemBottomInfoEntityCopyWith<$Res> {
  _$PHXSectionItemBottomInfoEntityCopyWithImpl(this._self, this._then);

  final PHXSectionItemBottomInfoEntity _self;
  final $Res Function(PHXSectionItemBottomInfoEntity) _then;

  /// Create a copy of PHXSectionItemBottomInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? subTitle = freezed,
    Object? avatarUrl = freezed,
    Object? isContact = freezed,
    Object? showDivider = freezed,
    Object? icon = freezed,
  }) {
    return _then(_self.copyWith(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subTitle: freezed == subTitle
          ? _self.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isContact: freezed == isContact
          ? _self.isContact
          : isContact // ignore: cast_nullable_to_non_nullable
              as bool?,
      showDivider: freezed == showDivider
          ? _self.showDivider
          : showDivider // ignore: cast_nullable_to_non_nullable
              as bool?,
      icon: freezed == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as List<PHXSectionItemDetailIconEntity>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PHXSectionItemBottomInfoEntity].
extension PHXSectionItemBottomInfoEntityPatterns
    on PHXSectionItemBottomInfoEntity {
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
    TResult Function(_PHXSectionItemBottomInfoEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemBottomInfoEntity() when $default != null:
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
    TResult Function(_PHXSectionItemBottomInfoEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemBottomInfoEntity():
        return $default(_that);
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
    TResult? Function(_PHXSectionItemBottomInfoEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemBottomInfoEntity() when $default != null:
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
            String? title,
            String? subTitle,
            String? avatarUrl,
            bool? isContact,
            bool? showDivider,
            List<PHXSectionItemDetailIconEntity>? icon)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemBottomInfoEntity() when $default != null:
        return $default(_that.title, _that.subTitle, _that.avatarUrl,
            _that.isContact, _that.showDivider, _that.icon);
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
            String? title,
            String? subTitle,
            String? avatarUrl,
            bool? isContact,
            bool? showDivider,
            List<PHXSectionItemDetailIconEntity>? icon)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemBottomInfoEntity():
        return $default(_that.title, _that.subTitle, _that.avatarUrl,
            _that.isContact, _that.showDivider, _that.icon);
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
            String? title,
            String? subTitle,
            String? avatarUrl,
            bool? isContact,
            bool? showDivider,
            List<PHXSectionItemDetailIconEntity>? icon)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemBottomInfoEntity() when $default != null:
        return $default(_that.title, _that.subTitle, _that.avatarUrl,
            _that.isContact, _that.showDivider, _that.icon);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PHXSectionItemBottomInfoEntity extends PHXSectionItemBottomInfoEntity {
  const _PHXSectionItemBottomInfoEntity(
      {this.title = '',
      this.subTitle = '',
      this.avatarUrl = '',
      this.isContact = false,
      this.showDivider = false,
      final List<PHXSectionItemDetailIconEntity>? icon = const []})
      : _icon = icon,
        super._();

  @override
  @JsonKey()
  final String? title;
  @override
  @JsonKey()
  final String? subTitle;
  @override
  @JsonKey()
  final String? avatarUrl;
  @override
  @JsonKey()
  final bool? isContact;
  @override
  @JsonKey()
  final bool? showDivider;
  final List<PHXSectionItemDetailIconEntity>? _icon;
  @override
  @JsonKey()
  List<PHXSectionItemDetailIconEntity>? get icon {
    final value = _icon;
    if (value == null) return null;
    if (_icon is EqualUnmodifiableListView) return _icon;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of PHXSectionItemBottomInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXSectionItemBottomInfoEntityCopyWith<_PHXSectionItemBottomInfoEntity>
      get copyWith => __$PHXSectionItemBottomInfoEntityCopyWithImpl<
          _PHXSectionItemBottomInfoEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXSectionItemBottomInfoEntity &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.isContact, isContact) ||
                other.isContact == isContact) &&
            (identical(other.showDivider, showDivider) ||
                other.showDivider == showDivider) &&
            const DeepCollectionEquality().equals(other._icon, _icon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, subTitle, avatarUrl,
      isContact, showDivider, const DeepCollectionEquality().hash(_icon));

  @override
  String toString() {
    return 'PHXSectionItemBottomInfoEntity(title: $title, subTitle: $subTitle, avatarUrl: $avatarUrl, isContact: $isContact, showDivider: $showDivider, icon: $icon)';
  }
}

/// @nodoc
abstract mixin class _$PHXSectionItemBottomInfoEntityCopyWith<$Res>
    implements $PHXSectionItemBottomInfoEntityCopyWith<$Res> {
  factory _$PHXSectionItemBottomInfoEntityCopyWith(
          _PHXSectionItemBottomInfoEntity value,
          $Res Function(_PHXSectionItemBottomInfoEntity) _then) =
      __$PHXSectionItemBottomInfoEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? title,
      String? subTitle,
      String? avatarUrl,
      bool? isContact,
      bool? showDivider,
      List<PHXSectionItemDetailIconEntity>? icon});
}

/// @nodoc
class __$PHXSectionItemBottomInfoEntityCopyWithImpl<$Res>
    implements _$PHXSectionItemBottomInfoEntityCopyWith<$Res> {
  __$PHXSectionItemBottomInfoEntityCopyWithImpl(this._self, this._then);

  final _PHXSectionItemBottomInfoEntity _self;
  final $Res Function(_PHXSectionItemBottomInfoEntity) _then;

  /// Create a copy of PHXSectionItemBottomInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? subTitle = freezed,
    Object? avatarUrl = freezed,
    Object? isContact = freezed,
    Object? showDivider = freezed,
    Object? icon = freezed,
  }) {
    return _then(_PHXSectionItemBottomInfoEntity(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subTitle: freezed == subTitle
          ? _self.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isContact: freezed == isContact
          ? _self.isContact
          : isContact // ignore: cast_nullable_to_non_nullable
              as bool?,
      showDivider: freezed == showDivider
          ? _self.showDivider
          : showDivider // ignore: cast_nullable_to_non_nullable
              as bool?,
      icon: freezed == icon
          ? _self._icon
          : icon // ignore: cast_nullable_to_non_nullable
              as List<PHXSectionItemDetailIconEntity>?,
    ));
  }
}

/// @nodoc
mixin _$PHXListOptionEntity {
  int? get id;
  String? get code;
  String? get title;
  bool? get isActive;
  PHXExtraEntity? get extra;

  /// Create a copy of PHXListOptionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXListOptionEntityCopyWith<PHXListOptionEntity> get copyWith =>
      _$PHXListOptionEntityCopyWithImpl<PHXListOptionEntity>(
          this as PHXListOptionEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXListOptionEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.extra, extra) || other.extra == extra));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, code, title, isActive, extra);

  @override
  String toString() {
    return 'PHXListOptionEntity(id: $id, code: $code, title: $title, isActive: $isActive, extra: $extra)';
  }
}

/// @nodoc
abstract mixin class $PHXListOptionEntityCopyWith<$Res> {
  factory $PHXListOptionEntityCopyWith(
          PHXListOptionEntity value, $Res Function(PHXListOptionEntity) _then) =
      _$PHXListOptionEntityCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String? code,
      String? title,
      bool? isActive,
      PHXExtraEntity? extra});

  $PHXExtraEntityCopyWith<$Res>? get extra;
}

/// @nodoc
class _$PHXListOptionEntityCopyWithImpl<$Res>
    implements $PHXListOptionEntityCopyWith<$Res> {
  _$PHXListOptionEntityCopyWithImpl(this._self, this._then);

  final PHXListOptionEntity _self;
  final $Res Function(PHXListOptionEntity) _then;

  /// Create a copy of PHXListOptionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? title = freezed,
    Object? isActive = freezed,
    Object? extra = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      extra: freezed == extra
          ? _self.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as PHXExtraEntity?,
    ));
  }

  /// Create a copy of PHXListOptionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXExtraEntityCopyWith<$Res>? get extra {
    if (_self.extra == null) {
      return null;
    }

    return $PHXExtraEntityCopyWith<$Res>(_self.extra!, (value) {
      return _then(_self.copyWith(extra: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PHXListOptionEntity].
extension PHXListOptionEntityPatterns on PHXListOptionEntity {
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
    TResult Function(_PHXListOptionEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXListOptionEntity() when $default != null:
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
    TResult Function(_PHXListOptionEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXListOptionEntity():
        return $default(_that);
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
    TResult? Function(_PHXListOptionEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXListOptionEntity() when $default != null:
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
    TResult Function(int? id, String? code, String? title, bool? isActive,
            PHXExtraEntity? extra)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXListOptionEntity() when $default != null:
        return $default(
            _that.id, _that.code, _that.title, _that.isActive, _that.extra);
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
    TResult Function(int? id, String? code, String? title, bool? isActive,
            PHXExtraEntity? extra)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXListOptionEntity():
        return $default(
            _that.id, _that.code, _that.title, _that.isActive, _that.extra);
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
    TResult? Function(int? id, String? code, String? title, bool? isActive,
            PHXExtraEntity? extra)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXListOptionEntity() when $default != null:
        return $default(
            _that.id, _that.code, _that.title, _that.isActive, _that.extra);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PHXListOptionEntity extends PHXListOptionEntity {
  const _PHXListOptionEntity(
      {this.id = 0,
      this.code = '',
      this.title = '',
      this.isActive = false,
      this.extra = null})
      : super._();

  @override
  @JsonKey()
  final int? id;
  @override
  @JsonKey()
  final String? code;
  @override
  @JsonKey()
  final String? title;
  @override
  @JsonKey()
  final bool? isActive;
  @override
  @JsonKey()
  final PHXExtraEntity? extra;

  /// Create a copy of PHXListOptionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXListOptionEntityCopyWith<_PHXListOptionEntity> get copyWith =>
      __$PHXListOptionEntityCopyWithImpl<_PHXListOptionEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXListOptionEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.extra, extra) || other.extra == extra));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, code, title, isActive, extra);

  @override
  String toString() {
    return 'PHXListOptionEntity(id: $id, code: $code, title: $title, isActive: $isActive, extra: $extra)';
  }
}

/// @nodoc
abstract mixin class _$PHXListOptionEntityCopyWith<$Res>
    implements $PHXListOptionEntityCopyWith<$Res> {
  factory _$PHXListOptionEntityCopyWith(_PHXListOptionEntity value,
          $Res Function(_PHXListOptionEntity) _then) =
      __$PHXListOptionEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String? code,
      String? title,
      bool? isActive,
      PHXExtraEntity? extra});

  @override
  $PHXExtraEntityCopyWith<$Res>? get extra;
}

/// @nodoc
class __$PHXListOptionEntityCopyWithImpl<$Res>
    implements _$PHXListOptionEntityCopyWith<$Res> {
  __$PHXListOptionEntityCopyWithImpl(this._self, this._then);

  final _PHXListOptionEntity _self;
  final $Res Function(_PHXListOptionEntity) _then;

  /// Create a copy of PHXListOptionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? title = freezed,
    Object? isActive = freezed,
    Object? extra = freezed,
  }) {
    return _then(_PHXListOptionEntity(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      extra: freezed == extra
          ? _self.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as PHXExtraEntity?,
    ));
  }

  /// Create a copy of PHXListOptionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXExtraEntityCopyWith<$Res>? get extra {
    if (_self.extra == null) {
      return null;
    }

    return $PHXExtraEntityCopyWith<$Res>(_self.extra!, (value) {
      return _then(_self.copyWith(extra: value));
    });
  }
}

/// @nodoc
mixin _$PHXBottomActionEntity {
  String? get title;
  String? get icon;
  String? get type;
  PHXExtraEntity? get extra;
  PHXBottomSheetEntity? get bottomSheet;
  bool? get isHiddenAction;
  bool? get isShowSubTitle;
  String? get subTitle;
  List<PHXStudentEntity>? get students;

  /// Create a copy of PHXBottomActionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXBottomActionEntityCopyWith<PHXBottomActionEntity> get copyWith =>
      _$PHXBottomActionEntityCopyWithImpl<PHXBottomActionEntity>(
          this as PHXBottomActionEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXBottomActionEntity &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.extra, extra) || other.extra == extra) &&
            (identical(other.bottomSheet, bottomSheet) ||
                other.bottomSheet == bottomSheet) &&
            (identical(other.isHiddenAction, isHiddenAction) ||
                other.isHiddenAction == isHiddenAction) &&
            (identical(other.isShowSubTitle, isShowSubTitle) ||
                other.isShowSubTitle == isShowSubTitle) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            const DeepCollectionEquality().equals(other.students, students));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      icon,
      type,
      extra,
      bottomSheet,
      isHiddenAction,
      isShowSubTitle,
      subTitle,
      const DeepCollectionEquality().hash(students));

  @override
  String toString() {
    return 'PHXBottomActionEntity(title: $title, icon: $icon, type: $type, extra: $extra, bottomSheet: $bottomSheet, isHiddenAction: $isHiddenAction, isShowSubTitle: $isShowSubTitle, subTitle: $subTitle, students: $students)';
  }
}

/// @nodoc
abstract mixin class $PHXBottomActionEntityCopyWith<$Res> {
  factory $PHXBottomActionEntityCopyWith(PHXBottomActionEntity value,
          $Res Function(PHXBottomActionEntity) _then) =
      _$PHXBottomActionEntityCopyWithImpl;
  @useResult
  $Res call(
      {String? title,
      String? icon,
      String? type,
      PHXExtraEntity? extra,
      PHXBottomSheetEntity? bottomSheet,
      bool? isHiddenAction,
      bool? isShowSubTitle,
      String? subTitle,
      List<PHXStudentEntity>? students});

  $PHXExtraEntityCopyWith<$Res>? get extra;
  $PHXBottomSheetEntityCopyWith<$Res>? get bottomSheet;
}

/// @nodoc
class _$PHXBottomActionEntityCopyWithImpl<$Res>
    implements $PHXBottomActionEntityCopyWith<$Res> {
  _$PHXBottomActionEntityCopyWithImpl(this._self, this._then);

  final PHXBottomActionEntity _self;
  final $Res Function(PHXBottomActionEntity) _then;

  /// Create a copy of PHXBottomActionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? icon = freezed,
    Object? type = freezed,
    Object? extra = freezed,
    Object? bottomSheet = freezed,
    Object? isHiddenAction = freezed,
    Object? isShowSubTitle = freezed,
    Object? subTitle = freezed,
    Object? students = freezed,
  }) {
    return _then(_self.copyWith(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      extra: freezed == extra
          ? _self.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as PHXExtraEntity?,
      bottomSheet: freezed == bottomSheet
          ? _self.bottomSheet
          : bottomSheet // ignore: cast_nullable_to_non_nullable
              as PHXBottomSheetEntity?,
      isHiddenAction: freezed == isHiddenAction
          ? _self.isHiddenAction
          : isHiddenAction // ignore: cast_nullable_to_non_nullable
              as bool?,
      isShowSubTitle: freezed == isShowSubTitle
          ? _self.isShowSubTitle
          : isShowSubTitle // ignore: cast_nullable_to_non_nullable
              as bool?,
      subTitle: freezed == subTitle
          ? _self.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      students: freezed == students
          ? _self.students
          : students // ignore: cast_nullable_to_non_nullable
              as List<PHXStudentEntity>?,
    ));
  }

  /// Create a copy of PHXBottomActionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXExtraEntityCopyWith<$Res>? get extra {
    if (_self.extra == null) {
      return null;
    }

    return $PHXExtraEntityCopyWith<$Res>(_self.extra!, (value) {
      return _then(_self.copyWith(extra: value));
    });
  }

  /// Create a copy of PHXBottomActionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXBottomSheetEntityCopyWith<$Res>? get bottomSheet {
    if (_self.bottomSheet == null) {
      return null;
    }

    return $PHXBottomSheetEntityCopyWith<$Res>(_self.bottomSheet!, (value) {
      return _then(_self.copyWith(bottomSheet: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PHXBottomActionEntity].
extension PHXBottomActionEntityPatterns on PHXBottomActionEntity {
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
    TResult Function(_PHXBottomActionEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXBottomActionEntity() when $default != null:
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
    TResult Function(_PHXBottomActionEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXBottomActionEntity():
        return $default(_that);
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
    TResult? Function(_PHXBottomActionEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXBottomActionEntity() when $default != null:
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
            String? title,
            String? icon,
            String? type,
            PHXExtraEntity? extra,
            PHXBottomSheetEntity? bottomSheet,
            bool? isHiddenAction,
            bool? isShowSubTitle,
            String? subTitle,
            List<PHXStudentEntity>? students)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXBottomActionEntity() when $default != null:
        return $default(
            _that.title,
            _that.icon,
            _that.type,
            _that.extra,
            _that.bottomSheet,
            _that.isHiddenAction,
            _that.isShowSubTitle,
            _that.subTitle,
            _that.students);
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
            String? title,
            String? icon,
            String? type,
            PHXExtraEntity? extra,
            PHXBottomSheetEntity? bottomSheet,
            bool? isHiddenAction,
            bool? isShowSubTitle,
            String? subTitle,
            List<PHXStudentEntity>? students)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXBottomActionEntity():
        return $default(
            _that.title,
            _that.icon,
            _that.type,
            _that.extra,
            _that.bottomSheet,
            _that.isHiddenAction,
            _that.isShowSubTitle,
            _that.subTitle,
            _that.students);
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
            String? title,
            String? icon,
            String? type,
            PHXExtraEntity? extra,
            PHXBottomSheetEntity? bottomSheet,
            bool? isHiddenAction,
            bool? isShowSubTitle,
            String? subTitle,
            List<PHXStudentEntity>? students)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXBottomActionEntity() when $default != null:
        return $default(
            _that.title,
            _that.icon,
            _that.type,
            _that.extra,
            _that.bottomSheet,
            _that.isHiddenAction,
            _that.isShowSubTitle,
            _that.subTitle,
            _that.students);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PHXBottomActionEntity extends PHXBottomActionEntity {
  const _PHXBottomActionEntity(
      {this.title = '',
      this.icon = '',
      this.type = '',
      this.extra = null,
      this.bottomSheet = null,
      this.isHiddenAction = false,
      this.isShowSubTitle = false,
      this.subTitle = '',
      final List<PHXStudentEntity>? students = null})
      : _students = students,
        super._();

  @override
  @JsonKey()
  final String? title;
  @override
  @JsonKey()
  final String? icon;
  @override
  @JsonKey()
  final String? type;
  @override
  @JsonKey()
  final PHXExtraEntity? extra;
  @override
  @JsonKey()
  final PHXBottomSheetEntity? bottomSheet;
  @override
  @JsonKey()
  final bool? isHiddenAction;
  @override
  @JsonKey()
  final bool? isShowSubTitle;
  @override
  @JsonKey()
  final String? subTitle;
  final List<PHXStudentEntity>? _students;
  @override
  @JsonKey()
  List<PHXStudentEntity>? get students {
    final value = _students;
    if (value == null) return null;
    if (_students is EqualUnmodifiableListView) return _students;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of PHXBottomActionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXBottomActionEntityCopyWith<_PHXBottomActionEntity> get copyWith =>
      __$PHXBottomActionEntityCopyWithImpl<_PHXBottomActionEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXBottomActionEntity &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.extra, extra) || other.extra == extra) &&
            (identical(other.bottomSheet, bottomSheet) ||
                other.bottomSheet == bottomSheet) &&
            (identical(other.isHiddenAction, isHiddenAction) ||
                other.isHiddenAction == isHiddenAction) &&
            (identical(other.isShowSubTitle, isShowSubTitle) ||
                other.isShowSubTitle == isShowSubTitle) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            const DeepCollectionEquality().equals(other._students, _students));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      icon,
      type,
      extra,
      bottomSheet,
      isHiddenAction,
      isShowSubTitle,
      subTitle,
      const DeepCollectionEquality().hash(_students));

  @override
  String toString() {
    return 'PHXBottomActionEntity(title: $title, icon: $icon, type: $type, extra: $extra, bottomSheet: $bottomSheet, isHiddenAction: $isHiddenAction, isShowSubTitle: $isShowSubTitle, subTitle: $subTitle, students: $students)';
  }
}

/// @nodoc
abstract mixin class _$PHXBottomActionEntityCopyWith<$Res>
    implements $PHXBottomActionEntityCopyWith<$Res> {
  factory _$PHXBottomActionEntityCopyWith(_PHXBottomActionEntity value,
          $Res Function(_PHXBottomActionEntity) _then) =
      __$PHXBottomActionEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? title,
      String? icon,
      String? type,
      PHXExtraEntity? extra,
      PHXBottomSheetEntity? bottomSheet,
      bool? isHiddenAction,
      bool? isShowSubTitle,
      String? subTitle,
      List<PHXStudentEntity>? students});

  @override
  $PHXExtraEntityCopyWith<$Res>? get extra;
  @override
  $PHXBottomSheetEntityCopyWith<$Res>? get bottomSheet;
}

/// @nodoc
class __$PHXBottomActionEntityCopyWithImpl<$Res>
    implements _$PHXBottomActionEntityCopyWith<$Res> {
  __$PHXBottomActionEntityCopyWithImpl(this._self, this._then);

  final _PHXBottomActionEntity _self;
  final $Res Function(_PHXBottomActionEntity) _then;

  /// Create a copy of PHXBottomActionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? icon = freezed,
    Object? type = freezed,
    Object? extra = freezed,
    Object? bottomSheet = freezed,
    Object? isHiddenAction = freezed,
    Object? isShowSubTitle = freezed,
    Object? subTitle = freezed,
    Object? students = freezed,
  }) {
    return _then(_PHXBottomActionEntity(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      extra: freezed == extra
          ? _self.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as PHXExtraEntity?,
      bottomSheet: freezed == bottomSheet
          ? _self.bottomSheet
          : bottomSheet // ignore: cast_nullable_to_non_nullable
              as PHXBottomSheetEntity?,
      isHiddenAction: freezed == isHiddenAction
          ? _self.isHiddenAction
          : isHiddenAction // ignore: cast_nullable_to_non_nullable
              as bool?,
      isShowSubTitle: freezed == isShowSubTitle
          ? _self.isShowSubTitle
          : isShowSubTitle // ignore: cast_nullable_to_non_nullable
              as bool?,
      subTitle: freezed == subTitle
          ? _self.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      students: freezed == students
          ? _self._students
          : students // ignore: cast_nullable_to_non_nullable
              as List<PHXStudentEntity>?,
    ));
  }

  /// Create a copy of PHXBottomActionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXExtraEntityCopyWith<$Res>? get extra {
    if (_self.extra == null) {
      return null;
    }

    return $PHXExtraEntityCopyWith<$Res>(_self.extra!, (value) {
      return _then(_self.copyWith(extra: value));
    });
  }

  /// Create a copy of PHXBottomActionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXBottomSheetEntityCopyWith<$Res>? get bottomSheet {
    if (_self.bottomSheet == null) {
      return null;
    }

    return $PHXBottomSheetEntityCopyWith<$Res>(_self.bottomSheet!, (value) {
      return _then(_self.copyWith(bottomSheet: value));
    });
  }
}

/// @nodoc
mixin _$PHXBottomSheetEntity {
  String? get sheetTitle;
  List<String>? get sheetDescription;
  String? get bottomSheetType;
  List<PHXBottomSheetContentEntity>? get sheetContent;

  /// Create a copy of PHXBottomSheetEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXBottomSheetEntityCopyWith<PHXBottomSheetEntity> get copyWith =>
      _$PHXBottomSheetEntityCopyWithImpl<PHXBottomSheetEntity>(
          this as PHXBottomSheetEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXBottomSheetEntity &&
            (identical(other.sheetTitle, sheetTitle) ||
                other.sheetTitle == sheetTitle) &&
            const DeepCollectionEquality()
                .equals(other.sheetDescription, sheetDescription) &&
            (identical(other.bottomSheetType, bottomSheetType) ||
                other.bottomSheetType == bottomSheetType) &&
            const DeepCollectionEquality()
                .equals(other.sheetContent, sheetContent));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      sheetTitle,
      const DeepCollectionEquality().hash(sheetDescription),
      bottomSheetType,
      const DeepCollectionEquality().hash(sheetContent));

  @override
  String toString() {
    return 'PHXBottomSheetEntity(sheetTitle: $sheetTitle, sheetDescription: $sheetDescription, bottomSheetType: $bottomSheetType, sheetContent: $sheetContent)';
  }
}

/// @nodoc
abstract mixin class $PHXBottomSheetEntityCopyWith<$Res> {
  factory $PHXBottomSheetEntityCopyWith(PHXBottomSheetEntity value,
          $Res Function(PHXBottomSheetEntity) _then) =
      _$PHXBottomSheetEntityCopyWithImpl;
  @useResult
  $Res call(
      {String? sheetTitle,
      List<String>? sheetDescription,
      String? bottomSheetType,
      List<PHXBottomSheetContentEntity>? sheetContent});
}

/// @nodoc
class _$PHXBottomSheetEntityCopyWithImpl<$Res>
    implements $PHXBottomSheetEntityCopyWith<$Res> {
  _$PHXBottomSheetEntityCopyWithImpl(this._self, this._then);

  final PHXBottomSheetEntity _self;
  final $Res Function(PHXBottomSheetEntity) _then;

  /// Create a copy of PHXBottomSheetEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sheetTitle = freezed,
    Object? sheetDescription = freezed,
    Object? bottomSheetType = freezed,
    Object? sheetContent = freezed,
  }) {
    return _then(_self.copyWith(
      sheetTitle: freezed == sheetTitle
          ? _self.sheetTitle
          : sheetTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      sheetDescription: freezed == sheetDescription
          ? _self.sheetDescription
          : sheetDescription // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      bottomSheetType: freezed == bottomSheetType
          ? _self.bottomSheetType
          : bottomSheetType // ignore: cast_nullable_to_non_nullable
              as String?,
      sheetContent: freezed == sheetContent
          ? _self.sheetContent
          : sheetContent // ignore: cast_nullable_to_non_nullable
              as List<PHXBottomSheetContentEntity>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PHXBottomSheetEntity].
extension PHXBottomSheetEntityPatterns on PHXBottomSheetEntity {
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
    TResult Function(_PHXBottomSheetEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXBottomSheetEntity() when $default != null:
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
    TResult Function(_PHXBottomSheetEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXBottomSheetEntity():
        return $default(_that);
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
    TResult? Function(_PHXBottomSheetEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXBottomSheetEntity() when $default != null:
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
            String? sheetTitle,
            List<String>? sheetDescription,
            String? bottomSheetType,
            List<PHXBottomSheetContentEntity>? sheetContent)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXBottomSheetEntity() when $default != null:
        return $default(_that.sheetTitle, _that.sheetDescription,
            _that.bottomSheetType, _that.sheetContent);
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
            String? sheetTitle,
            List<String>? sheetDescription,
            String? bottomSheetType,
            List<PHXBottomSheetContentEntity>? sheetContent)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXBottomSheetEntity():
        return $default(_that.sheetTitle, _that.sheetDescription,
            _that.bottomSheetType, _that.sheetContent);
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
            String? sheetTitle,
            List<String>? sheetDescription,
            String? bottomSheetType,
            List<PHXBottomSheetContentEntity>? sheetContent)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXBottomSheetEntity() when $default != null:
        return $default(_that.sheetTitle, _that.sheetDescription,
            _that.bottomSheetType, _that.sheetContent);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PHXBottomSheetEntity extends PHXBottomSheetEntity {
  const _PHXBottomSheetEntity(
      {this.sheetTitle = '',
      final List<String>? sheetDescription = const [],
      this.bottomSheetType = '',
      final List<PHXBottomSheetContentEntity>? sheetContent = const []})
      : _sheetDescription = sheetDescription,
        _sheetContent = sheetContent,
        super._();

  @override
  @JsonKey()
  final String? sheetTitle;
  final List<String>? _sheetDescription;
  @override
  @JsonKey()
  List<String>? get sheetDescription {
    final value = _sheetDescription;
    if (value == null) return null;
    if (_sheetDescription is EqualUnmodifiableListView)
      return _sheetDescription;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final String? bottomSheetType;
  final List<PHXBottomSheetContentEntity>? _sheetContent;
  @override
  @JsonKey()
  List<PHXBottomSheetContentEntity>? get sheetContent {
    final value = _sheetContent;
    if (value == null) return null;
    if (_sheetContent is EqualUnmodifiableListView) return _sheetContent;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of PHXBottomSheetEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXBottomSheetEntityCopyWith<_PHXBottomSheetEntity> get copyWith =>
      __$PHXBottomSheetEntityCopyWithImpl<_PHXBottomSheetEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXBottomSheetEntity &&
            (identical(other.sheetTitle, sheetTitle) ||
                other.sheetTitle == sheetTitle) &&
            const DeepCollectionEquality()
                .equals(other._sheetDescription, _sheetDescription) &&
            (identical(other.bottomSheetType, bottomSheetType) ||
                other.bottomSheetType == bottomSheetType) &&
            const DeepCollectionEquality()
                .equals(other._sheetContent, _sheetContent));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      sheetTitle,
      const DeepCollectionEquality().hash(_sheetDescription),
      bottomSheetType,
      const DeepCollectionEquality().hash(_sheetContent));

  @override
  String toString() {
    return 'PHXBottomSheetEntity(sheetTitle: $sheetTitle, sheetDescription: $sheetDescription, bottomSheetType: $bottomSheetType, sheetContent: $sheetContent)';
  }
}

/// @nodoc
abstract mixin class _$PHXBottomSheetEntityCopyWith<$Res>
    implements $PHXBottomSheetEntityCopyWith<$Res> {
  factory _$PHXBottomSheetEntityCopyWith(_PHXBottomSheetEntity value,
          $Res Function(_PHXBottomSheetEntity) _then) =
      __$PHXBottomSheetEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? sheetTitle,
      List<String>? sheetDescription,
      String? bottomSheetType,
      List<PHXBottomSheetContentEntity>? sheetContent});
}

/// @nodoc
class __$PHXBottomSheetEntityCopyWithImpl<$Res>
    implements _$PHXBottomSheetEntityCopyWith<$Res> {
  __$PHXBottomSheetEntityCopyWithImpl(this._self, this._then);

  final _PHXBottomSheetEntity _self;
  final $Res Function(_PHXBottomSheetEntity) _then;

  /// Create a copy of PHXBottomSheetEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sheetTitle = freezed,
    Object? sheetDescription = freezed,
    Object? bottomSheetType = freezed,
    Object? sheetContent = freezed,
  }) {
    return _then(_PHXBottomSheetEntity(
      sheetTitle: freezed == sheetTitle
          ? _self.sheetTitle
          : sheetTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      sheetDescription: freezed == sheetDescription
          ? _self._sheetDescription
          : sheetDescription // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      bottomSheetType: freezed == bottomSheetType
          ? _self.bottomSheetType
          : bottomSheetType // ignore: cast_nullable_to_non_nullable
              as String?,
      sheetContent: freezed == sheetContent
          ? _self._sheetContent
          : sheetContent // ignore: cast_nullable_to_non_nullable
              as List<PHXBottomSheetContentEntity>?,
    ));
  }
}

/// @nodoc
mixin _$PHXBottomSheetContentEntity {
  int? get id;
  String? get title;
  String? get subTitle;
  String? get imageUrl;
  String? get content;

  /// Create a copy of PHXBottomSheetContentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXBottomSheetContentEntityCopyWith<PHXBottomSheetContentEntity>
      get copyWith => _$PHXBottomSheetContentEntityCopyWithImpl<
              PHXBottomSheetContentEntity>(
          this as PHXBottomSheetContentEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXBottomSheetContentEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, subTitle, imageUrl, content);

  @override
  String toString() {
    return 'PHXBottomSheetContentEntity(id: $id, title: $title, subTitle: $subTitle, imageUrl: $imageUrl, content: $content)';
  }
}

/// @nodoc
abstract mixin class $PHXBottomSheetContentEntityCopyWith<$Res> {
  factory $PHXBottomSheetContentEntityCopyWith(
          PHXBottomSheetContentEntity value,
          $Res Function(PHXBottomSheetContentEntity) _then) =
      _$PHXBottomSheetContentEntityCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? subTitle,
      String? imageUrl,
      String? content});
}

/// @nodoc
class _$PHXBottomSheetContentEntityCopyWithImpl<$Res>
    implements $PHXBottomSheetContentEntityCopyWith<$Res> {
  _$PHXBottomSheetContentEntityCopyWithImpl(this._self, this._then);

  final PHXBottomSheetContentEntity _self;
  final $Res Function(PHXBottomSheetContentEntity) _then;

  /// Create a copy of PHXBottomSheetContentEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? subTitle = freezed,
    Object? imageUrl = freezed,
    Object? content = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subTitle: freezed == subTitle
          ? _self.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PHXBottomSheetContentEntity].
extension PHXBottomSheetContentEntityPatterns on PHXBottomSheetContentEntity {
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
    TResult Function(_PHXBottomSheetContentEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXBottomSheetContentEntity() when $default != null:
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
    TResult Function(_PHXBottomSheetContentEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXBottomSheetContentEntity():
        return $default(_that);
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
    TResult? Function(_PHXBottomSheetContentEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXBottomSheetContentEntity() when $default != null:
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
    TResult Function(int? id, String? title, String? subTitle, String? imageUrl,
            String? content)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXBottomSheetContentEntity() when $default != null:
        return $default(_that.id, _that.title, _that.subTitle, _that.imageUrl,
            _that.content);
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
    TResult Function(int? id, String? title, String? subTitle, String? imageUrl,
            String? content)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXBottomSheetContentEntity():
        return $default(_that.id, _that.title, _that.subTitle, _that.imageUrl,
            _that.content);
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
    TResult? Function(int? id, String? title, String? subTitle,
            String? imageUrl, String? content)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXBottomSheetContentEntity() when $default != null:
        return $default(_that.id, _that.title, _that.subTitle, _that.imageUrl,
            _that.content);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PHXBottomSheetContentEntity extends PHXBottomSheetContentEntity {
  const _PHXBottomSheetContentEntity(
      {this.id = 0,
      this.title = '',
      this.subTitle = '',
      this.imageUrl = '',
      this.content = ''})
      : super._();

  @override
  @JsonKey()
  final int? id;
  @override
  @JsonKey()
  final String? title;
  @override
  @JsonKey()
  final String? subTitle;
  @override
  @JsonKey()
  final String? imageUrl;
  @override
  @JsonKey()
  final String? content;

  /// Create a copy of PHXBottomSheetContentEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXBottomSheetContentEntityCopyWith<_PHXBottomSheetContentEntity>
      get copyWith => __$PHXBottomSheetContentEntityCopyWithImpl<
          _PHXBottomSheetContentEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXBottomSheetContentEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, subTitle, imageUrl, content);

  @override
  String toString() {
    return 'PHXBottomSheetContentEntity(id: $id, title: $title, subTitle: $subTitle, imageUrl: $imageUrl, content: $content)';
  }
}

/// @nodoc
abstract mixin class _$PHXBottomSheetContentEntityCopyWith<$Res>
    implements $PHXBottomSheetContentEntityCopyWith<$Res> {
  factory _$PHXBottomSheetContentEntityCopyWith(
          _PHXBottomSheetContentEntity value,
          $Res Function(_PHXBottomSheetContentEntity) _then) =
      __$PHXBottomSheetContentEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? subTitle,
      String? imageUrl,
      String? content});
}

/// @nodoc
class __$PHXBottomSheetContentEntityCopyWithImpl<$Res>
    implements _$PHXBottomSheetContentEntityCopyWith<$Res> {
  __$PHXBottomSheetContentEntityCopyWithImpl(this._self, this._then);

  final _PHXBottomSheetContentEntity _self;
  final $Res Function(_PHXBottomSheetContentEntity) _then;

  /// Create a copy of PHXBottomSheetContentEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? subTitle = freezed,
    Object? imageUrl = freezed,
    Object? content = freezed,
  }) {
    return _then(_PHXBottomSheetContentEntity(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subTitle: freezed == subTitle
          ? _self.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$PHXDataModalContentEntity {
  String? get title;
  String? get titleColor;
  String? get content;
  bool? get showDivider;
  bool? get isItalics;

  /// Create a copy of PHXDataModalContentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXDataModalContentEntityCopyWith<PHXDataModalContentEntity> get copyWith =>
      _$PHXDataModalContentEntityCopyWithImpl<PHXDataModalContentEntity>(
          this as PHXDataModalContentEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXDataModalContentEntity &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.titleColor, titleColor) ||
                other.titleColor == titleColor) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.showDivider, showDivider) ||
                other.showDivider == showDivider) &&
            (identical(other.isItalics, isItalics) ||
                other.isItalics == isItalics));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, title, titleColor, content, showDivider, isItalics);

  @override
  String toString() {
    return 'PHXDataModalContentEntity(title: $title, titleColor: $titleColor, content: $content, showDivider: $showDivider, isItalics: $isItalics)';
  }
}

/// @nodoc
abstract mixin class $PHXDataModalContentEntityCopyWith<$Res> {
  factory $PHXDataModalContentEntityCopyWith(PHXDataModalContentEntity value,
          $Res Function(PHXDataModalContentEntity) _then) =
      _$PHXDataModalContentEntityCopyWithImpl;
  @useResult
  $Res call(
      {String? title,
      String? titleColor,
      String? content,
      bool? showDivider,
      bool? isItalics});
}

/// @nodoc
class _$PHXDataModalContentEntityCopyWithImpl<$Res>
    implements $PHXDataModalContentEntityCopyWith<$Res> {
  _$PHXDataModalContentEntityCopyWithImpl(this._self, this._then);

  final PHXDataModalContentEntity _self;
  final $Res Function(PHXDataModalContentEntity) _then;

  /// Create a copy of PHXDataModalContentEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? titleColor = freezed,
    Object? content = freezed,
    Object? showDivider = freezed,
    Object? isItalics = freezed,
  }) {
    return _then(_self.copyWith(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      titleColor: freezed == titleColor
          ? _self.titleColor
          : titleColor // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      showDivider: freezed == showDivider
          ? _self.showDivider
          : showDivider // ignore: cast_nullable_to_non_nullable
              as bool?,
      isItalics: freezed == isItalics
          ? _self.isItalics
          : isItalics // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PHXDataModalContentEntity].
extension PHXDataModalContentEntityPatterns on PHXDataModalContentEntity {
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
    TResult Function(_PHXDataModalContentEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalContentEntity() when $default != null:
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
    TResult Function(_PHXDataModalContentEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalContentEntity():
        return $default(_that);
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
    TResult? Function(_PHXDataModalContentEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalContentEntity() when $default != null:
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
    TResult Function(String? title, String? titleColor, String? content,
            bool? showDivider, bool? isItalics)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalContentEntity() when $default != null:
        return $default(_that.title, _that.titleColor, _that.content,
            _that.showDivider, _that.isItalics);
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
    TResult Function(String? title, String? titleColor, String? content,
            bool? showDivider, bool? isItalics)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalContentEntity():
        return $default(_that.title, _that.titleColor, _that.content,
            _that.showDivider, _that.isItalics);
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
    TResult? Function(String? title, String? titleColor, String? content,
            bool? showDivider, bool? isItalics)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalContentEntity() when $default != null:
        return $default(_that.title, _that.titleColor, _that.content,
            _that.showDivider, _that.isItalics);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PHXDataModalContentEntity implements PHXDataModalContentEntity {
  const _PHXDataModalContentEntity(
      {this.title,
      this.titleColor,
      this.content,
      this.showDivider,
      this.isItalics});

  @override
  final String? title;
  @override
  final String? titleColor;
  @override
  final String? content;
  @override
  final bool? showDivider;
  @override
  final bool? isItalics;

  /// Create a copy of PHXDataModalContentEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXDataModalContentEntityCopyWith<_PHXDataModalContentEntity>
      get copyWith =>
          __$PHXDataModalContentEntityCopyWithImpl<_PHXDataModalContentEntity>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXDataModalContentEntity &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.titleColor, titleColor) ||
                other.titleColor == titleColor) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.showDivider, showDivider) ||
                other.showDivider == showDivider) &&
            (identical(other.isItalics, isItalics) ||
                other.isItalics == isItalics));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, title, titleColor, content, showDivider, isItalics);

  @override
  String toString() {
    return 'PHXDataModalContentEntity(title: $title, titleColor: $titleColor, content: $content, showDivider: $showDivider, isItalics: $isItalics)';
  }
}

/// @nodoc
abstract mixin class _$PHXDataModalContentEntityCopyWith<$Res>
    implements $PHXDataModalContentEntityCopyWith<$Res> {
  factory _$PHXDataModalContentEntityCopyWith(_PHXDataModalContentEntity value,
          $Res Function(_PHXDataModalContentEntity) _then) =
      __$PHXDataModalContentEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? title,
      String? titleColor,
      String? content,
      bool? showDivider,
      bool? isItalics});
}

/// @nodoc
class __$PHXDataModalContentEntityCopyWithImpl<$Res>
    implements _$PHXDataModalContentEntityCopyWith<$Res> {
  __$PHXDataModalContentEntityCopyWithImpl(this._self, this._then);

  final _PHXDataModalContentEntity _self;
  final $Res Function(_PHXDataModalContentEntity) _then;

  /// Create a copy of PHXDataModalContentEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? titleColor = freezed,
    Object? content = freezed,
    Object? showDivider = freezed,
    Object? isItalics = freezed,
  }) {
    return _then(_PHXDataModalContentEntity(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      titleColor: freezed == titleColor
          ? _self.titleColor
          : titleColor // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      showDivider: freezed == showDivider
          ? _self.showDivider
          : showDivider // ignore: cast_nullable_to_non_nullable
              as bool?,
      isItalics: freezed == isItalics
          ? _self.isItalics
          : isItalics // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
mixin _$PHXDataModalEntity {
  String? get title;
  List<PHXDataModalTabEntity>? get tabs;
  List<PHXDataModalContentEntity>? get content;

  /// Create a copy of PHXDataModalEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXDataModalEntityCopyWith<PHXDataModalEntity> get copyWith =>
      _$PHXDataModalEntityCopyWithImpl<PHXDataModalEntity>(
          this as PHXDataModalEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXDataModalEntity &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other.tabs, tabs) &&
            const DeepCollectionEquality().equals(other.content, content));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      const DeepCollectionEquality().hash(tabs),
      const DeepCollectionEquality().hash(content));

  @override
  String toString() {
    return 'PHXDataModalEntity(title: $title, tabs: $tabs, content: $content)';
  }
}

/// @nodoc
abstract mixin class $PHXDataModalEntityCopyWith<$Res> {
  factory $PHXDataModalEntityCopyWith(
          PHXDataModalEntity value, $Res Function(PHXDataModalEntity) _then) =
      _$PHXDataModalEntityCopyWithImpl;
  @useResult
  $Res call(
      {String? title,
      List<PHXDataModalTabEntity>? tabs,
      List<PHXDataModalContentEntity>? content});
}

/// @nodoc
class _$PHXDataModalEntityCopyWithImpl<$Res>
    implements $PHXDataModalEntityCopyWith<$Res> {
  _$PHXDataModalEntityCopyWithImpl(this._self, this._then);

  final PHXDataModalEntity _self;
  final $Res Function(PHXDataModalEntity) _then;

  /// Create a copy of PHXDataModalEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? tabs = freezed,
    Object? content = freezed,
  }) {
    return _then(_self.copyWith(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      tabs: freezed == tabs
          ? _self.tabs
          : tabs // ignore: cast_nullable_to_non_nullable
              as List<PHXDataModalTabEntity>?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<PHXDataModalContentEntity>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PHXDataModalEntity].
extension PHXDataModalEntityPatterns on PHXDataModalEntity {
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
    TResult Function(_PHXDataModalEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalEntity() when $default != null:
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
    TResult Function(_PHXDataModalEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalEntity():
        return $default(_that);
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
    TResult? Function(_PHXDataModalEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalEntity() when $default != null:
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
    TResult Function(String? title, List<PHXDataModalTabEntity>? tabs,
            List<PHXDataModalContentEntity>? content)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalEntity() when $default != null:
        return $default(_that.title, _that.tabs, _that.content);
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
    TResult Function(String? title, List<PHXDataModalTabEntity>? tabs,
            List<PHXDataModalContentEntity>? content)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalEntity():
        return $default(_that.title, _that.tabs, _that.content);
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
    TResult? Function(String? title, List<PHXDataModalTabEntity>? tabs,
            List<PHXDataModalContentEntity>? content)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalEntity() when $default != null:
        return $default(_that.title, _that.tabs, _that.content);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PHXDataModalEntity implements PHXDataModalEntity {
  const _PHXDataModalEntity(
      {this.title,
      final List<PHXDataModalTabEntity>? tabs = const [],
      final List<PHXDataModalContentEntity>? content = const []})
      : _tabs = tabs,
        _content = content;

  @override
  final String? title;
  final List<PHXDataModalTabEntity>? _tabs;
  @override
  @JsonKey()
  List<PHXDataModalTabEntity>? get tabs {
    final value = _tabs;
    if (value == null) return null;
    if (_tabs is EqualUnmodifiableListView) return _tabs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<PHXDataModalContentEntity>? _content;
  @override
  @JsonKey()
  List<PHXDataModalContentEntity>? get content {
    final value = _content;
    if (value == null) return null;
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of PHXDataModalEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXDataModalEntityCopyWith<_PHXDataModalEntity> get copyWith =>
      __$PHXDataModalEntityCopyWithImpl<_PHXDataModalEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXDataModalEntity &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._tabs, _tabs) &&
            const DeepCollectionEquality().equals(other._content, _content));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      const DeepCollectionEquality().hash(_tabs),
      const DeepCollectionEquality().hash(_content));

  @override
  String toString() {
    return 'PHXDataModalEntity(title: $title, tabs: $tabs, content: $content)';
  }
}

/// @nodoc
abstract mixin class _$PHXDataModalEntityCopyWith<$Res>
    implements $PHXDataModalEntityCopyWith<$Res> {
  factory _$PHXDataModalEntityCopyWith(
          _PHXDataModalEntity value, $Res Function(_PHXDataModalEntity) _then) =
      __$PHXDataModalEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? title,
      List<PHXDataModalTabEntity>? tabs,
      List<PHXDataModalContentEntity>? content});
}

/// @nodoc
class __$PHXDataModalEntityCopyWithImpl<$Res>
    implements _$PHXDataModalEntityCopyWith<$Res> {
  __$PHXDataModalEntityCopyWithImpl(this._self, this._then);

  final _PHXDataModalEntity _self;
  final $Res Function(_PHXDataModalEntity) _then;

  /// Create a copy of PHXDataModalEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? tabs = freezed,
    Object? content = freezed,
  }) {
    return _then(_PHXDataModalEntity(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      tabs: freezed == tabs
          ? _self._tabs
          : tabs // ignore: cast_nullable_to_non_nullable
              as List<PHXDataModalTabEntity>?,
      content: freezed == content
          ? _self._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<PHXDataModalContentEntity>?,
    ));
  }
}

/// @nodoc
mixin _$PHXExtraEntity {
  int? get teacherId;
  String? get phoneNumber;
  int? get groupId;
  bool? get callModalData;
  PHXDataModalEntity? get dataModal;
  String? get titlePage;
  String? get subTitlePage;
  bool? get showDivider;
  bool? get isItalics;
  String? get studentCode;
  String? get serviceCode;
  String? get shiftCode;
  BodyCancelEntity? get bodyCancel;
  List<MonthCalendar>? get listCalendar;
  double? get totalDayOff;
  MessCancelFood? get messCancelFood;
  String? get title;
  String? get content;
  String? get banner;
  List<PHXStatusLegendEntity>? get status;
  String? get endCusor;
  String? get infoBanner;
  String? get statusCode;
  int? get studentId;
  int? get schoolYearId;
  int? get requestId;
  int? get schoolId;
  List<PHXMonth>? get listMonthRegister;
  bool? get isCancelRequest;
  String? get educationalCode;
  int? get foodSectionId;
  String? get startDate;
  String? get endDate;
  String? get menuName;
  bool? get isImageDefault;
  bool? get isViewRequestCancel;
  int? get requestCancelId;
  bool? get hasNextPage;
  int? get page;
  int? get pageSize;
  int? get total;
  int? get totalPage;
  int? get remaining;
  int? get schoolTermId;
  int? get monthId;
  String? get registerLink;
  String? get navigatorButtonName;
  int? get subjectId;
  String? get subLable;

  /// Create a copy of PHXExtraEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXExtraEntityCopyWith<PHXExtraEntity> get copyWith =>
      _$PHXExtraEntityCopyWithImpl<PHXExtraEntity>(
          this as PHXExtraEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXExtraEntity &&
            (identical(other.teacherId, teacherId) ||
                other.teacherId == teacherId) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.callModalData, callModalData) ||
                other.callModalData == callModalData) &&
            (identical(other.dataModal, dataModal) ||
                other.dataModal == dataModal) &&
            (identical(other.titlePage, titlePage) ||
                other.titlePage == titlePage) &&
            (identical(other.subTitlePage, subTitlePage) ||
                other.subTitlePage == subTitlePage) &&
            (identical(other.showDivider, showDivider) ||
                other.showDivider == showDivider) &&
            (identical(other.isItalics, isItalics) ||
                other.isItalics == isItalics) &&
            (identical(other.studentCode, studentCode) ||
                other.studentCode == studentCode) &&
            (identical(other.serviceCode, serviceCode) ||
                other.serviceCode == serviceCode) &&
            (identical(other.shiftCode, shiftCode) ||
                other.shiftCode == shiftCode) &&
            (identical(other.bodyCancel, bodyCancel) ||
                other.bodyCancel == bodyCancel) &&
            const DeepCollectionEquality()
                .equals(other.listCalendar, listCalendar) &&
            (identical(other.totalDayOff, totalDayOff) ||
                other.totalDayOff == totalDayOff) &&
            (identical(other.messCancelFood, messCancelFood) ||
                other.messCancelFood == messCancelFood) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.banner, banner) || other.banner == banner) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            (identical(other.endCusor, endCusor) ||
                other.endCusor == endCusor) &&
            (identical(other.infoBanner, infoBanner) ||
                other.infoBanner == infoBanner) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.schoolYearId, schoolYearId) ||
                other.schoolYearId == schoolYearId) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.schoolId, schoolId) ||
                other.schoolId == schoolId) &&
            const DeepCollectionEquality()
                .equals(other.listMonthRegister, listMonthRegister) &&
            (identical(other.isCancelRequest, isCancelRequest) ||
                other.isCancelRequest == isCancelRequest) &&
            (identical(other.educationalCode, educationalCode) ||
                other.educationalCode == educationalCode) &&
            (identical(other.foodSectionId, foodSectionId) ||
                other.foodSectionId == foodSectionId) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.menuName, menuName) ||
                other.menuName == menuName) &&
            (identical(other.isImageDefault, isImageDefault) ||
                other.isImageDefault == isImageDefault) &&
            (identical(other.isViewRequestCancel, isViewRequestCancel) ||
                other.isViewRequestCancel == isViewRequestCancel) &&
            (identical(other.requestCancelId, requestCancelId) ||
                other.requestCancelId == requestCancelId) &&
            (identical(other.hasNextPage, hasNextPage) ||
                other.hasNextPage == hasNextPage) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage) &&
            (identical(other.remaining, remaining) ||
                other.remaining == remaining) &&
            (identical(other.schoolTermId, schoolTermId) ||
                other.schoolTermId == schoolTermId) &&
            (identical(other.monthId, monthId) || other.monthId == monthId) &&
            (identical(other.registerLink, registerLink) ||
                other.registerLink == registerLink) &&
            (identical(other.navigatorButtonName, navigatorButtonName) ||
                other.navigatorButtonName == navigatorButtonName) &&
            (identical(other.subjectId, subjectId) ||
                other.subjectId == subjectId) &&
            (identical(other.subLable, subLable) ||
                other.subLable == subLable));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        teacherId,
        phoneNumber,
        groupId,
        callModalData,
        dataModal,
        titlePage,
        subTitlePage,
        showDivider,
        isItalics,
        studentCode,
        serviceCode,
        shiftCode,
        bodyCancel,
        const DeepCollectionEquality().hash(listCalendar),
        totalDayOff,
        messCancelFood,
        title,
        content,
        banner,
        const DeepCollectionEquality().hash(status),
        endCusor,
        infoBanner,
        statusCode,
        studentId,
        schoolYearId,
        requestId,
        schoolId,
        const DeepCollectionEquality().hash(listMonthRegister),
        isCancelRequest,
        educationalCode,
        foodSectionId,
        startDate,
        endDate,
        menuName,
        isImageDefault,
        isViewRequestCancel,
        requestCancelId,
        hasNextPage,
        page,
        pageSize,
        total,
        totalPage,
        remaining,
        schoolTermId,
        monthId,
        registerLink,
        navigatorButtonName,
        subjectId,
        subLable
      ]);

  @override
  String toString() {
    return 'PHXExtraEntity(teacherId: $teacherId, phoneNumber: $phoneNumber, groupId: $groupId, callModalData: $callModalData, dataModal: $dataModal, titlePage: $titlePage, subTitlePage: $subTitlePage, showDivider: $showDivider, isItalics: $isItalics, studentCode: $studentCode, serviceCode: $serviceCode, shiftCode: $shiftCode, bodyCancel: $bodyCancel, listCalendar: $listCalendar, totalDayOff: $totalDayOff, messCancelFood: $messCancelFood, title: $title, content: $content, banner: $banner, status: $status, endCusor: $endCusor, infoBanner: $infoBanner, statusCode: $statusCode, studentId: $studentId, schoolYearId: $schoolYearId, requestId: $requestId, schoolId: $schoolId, listMonthRegister: $listMonthRegister, isCancelRequest: $isCancelRequest, educationalCode: $educationalCode, foodSectionId: $foodSectionId, startDate: $startDate, endDate: $endDate, menuName: $menuName, isImageDefault: $isImageDefault, isViewRequestCancel: $isViewRequestCancel, requestCancelId: $requestCancelId, hasNextPage: $hasNextPage, page: $page, pageSize: $pageSize, total: $total, totalPage: $totalPage, remaining: $remaining, schoolTermId: $schoolTermId, monthId: $monthId, registerLink: $registerLink, navigatorButtonName: $navigatorButtonName, subjectId: $subjectId, subLable: $subLable)';
  }
}

/// @nodoc
abstract mixin class $PHXExtraEntityCopyWith<$Res> {
  factory $PHXExtraEntityCopyWith(
          PHXExtraEntity value, $Res Function(PHXExtraEntity) _then) =
      _$PHXExtraEntityCopyWithImpl;
  @useResult
  $Res call(
      {int? teacherId,
      String? phoneNumber,
      int? groupId,
      bool? callModalData,
      PHXDataModalEntity? dataModal,
      String? titlePage,
      String? subTitlePage,
      bool? showDivider,
      bool? isItalics,
      String? studentCode,
      String? serviceCode,
      String? shiftCode,
      BodyCancelEntity? bodyCancel,
      List<MonthCalendar>? listCalendar,
      double? totalDayOff,
      MessCancelFood? messCancelFood,
      String? title,
      String? content,
      String? banner,
      List<PHXStatusLegendEntity>? status,
      String? endCusor,
      String? infoBanner,
      String? statusCode,
      int? studentId,
      int? schoolYearId,
      int? requestId,
      int? schoolId,
      List<PHXMonth>? listMonthRegister,
      bool? isCancelRequest,
      String? educationalCode,
      int? foodSectionId,
      String? startDate,
      String? endDate,
      String? menuName,
      bool? isImageDefault,
      bool? isViewRequestCancel,
      int? requestCancelId,
      bool? hasNextPage,
      int? page,
      int? pageSize,
      int? total,
      int? totalPage,
      int? remaining,
      int? schoolTermId,
      int? monthId,
      String? registerLink,
      String? navigatorButtonName,
      int? subjectId,
      String? subLable});

  $PHXDataModalEntityCopyWith<$Res>? get dataModal;
  $BodyCancelEntityCopyWith<$Res>? get bodyCancel;
  $MessCancelFoodCopyWith<$Res>? get messCancelFood;
}

/// @nodoc
class _$PHXExtraEntityCopyWithImpl<$Res>
    implements $PHXExtraEntityCopyWith<$Res> {
  _$PHXExtraEntityCopyWithImpl(this._self, this._then);

  final PHXExtraEntity _self;
  final $Res Function(PHXExtraEntity) _then;

  /// Create a copy of PHXExtraEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teacherId = freezed,
    Object? phoneNumber = freezed,
    Object? groupId = freezed,
    Object? callModalData = freezed,
    Object? dataModal = freezed,
    Object? titlePage = freezed,
    Object? subTitlePage = freezed,
    Object? showDivider = freezed,
    Object? isItalics = freezed,
    Object? studentCode = freezed,
    Object? serviceCode = freezed,
    Object? shiftCode = freezed,
    Object? bodyCancel = freezed,
    Object? listCalendar = freezed,
    Object? totalDayOff = freezed,
    Object? messCancelFood = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? banner = freezed,
    Object? status = freezed,
    Object? endCusor = freezed,
    Object? infoBanner = freezed,
    Object? statusCode = freezed,
    Object? studentId = freezed,
    Object? schoolYearId = freezed,
    Object? requestId = freezed,
    Object? schoolId = freezed,
    Object? listMonthRegister = freezed,
    Object? isCancelRequest = freezed,
    Object? educationalCode = freezed,
    Object? foodSectionId = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? menuName = freezed,
    Object? isImageDefault = freezed,
    Object? isViewRequestCancel = freezed,
    Object? requestCancelId = freezed,
    Object? hasNextPage = freezed,
    Object? page = freezed,
    Object? pageSize = freezed,
    Object? total = freezed,
    Object? totalPage = freezed,
    Object? remaining = freezed,
    Object? schoolTermId = freezed,
    Object? monthId = freezed,
    Object? registerLink = freezed,
    Object? navigatorButtonName = freezed,
    Object? subjectId = freezed,
    Object? subLable = freezed,
  }) {
    return _then(_self.copyWith(
      teacherId: freezed == teacherId
          ? _self.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as int?,
      phoneNumber: freezed == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      groupId: freezed == groupId
          ? _self.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int?,
      callModalData: freezed == callModalData
          ? _self.callModalData
          : callModalData // ignore: cast_nullable_to_non_nullable
              as bool?,
      dataModal: freezed == dataModal
          ? _self.dataModal
          : dataModal // ignore: cast_nullable_to_non_nullable
              as PHXDataModalEntity?,
      titlePage: freezed == titlePage
          ? _self.titlePage
          : titlePage // ignore: cast_nullable_to_non_nullable
              as String?,
      subTitlePage: freezed == subTitlePage
          ? _self.subTitlePage
          : subTitlePage // ignore: cast_nullable_to_non_nullable
              as String?,
      showDivider: freezed == showDivider
          ? _self.showDivider
          : showDivider // ignore: cast_nullable_to_non_nullable
              as bool?,
      isItalics: freezed == isItalics
          ? _self.isItalics
          : isItalics // ignore: cast_nullable_to_non_nullable
              as bool?,
      studentCode: freezed == studentCode
          ? _self.studentCode
          : studentCode // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceCode: freezed == serviceCode
          ? _self.serviceCode
          : serviceCode // ignore: cast_nullable_to_non_nullable
              as String?,
      shiftCode: freezed == shiftCode
          ? _self.shiftCode
          : shiftCode // ignore: cast_nullable_to_non_nullable
              as String?,
      bodyCancel: freezed == bodyCancel
          ? _self.bodyCancel
          : bodyCancel // ignore: cast_nullable_to_non_nullable
              as BodyCancelEntity?,
      listCalendar: freezed == listCalendar
          ? _self.listCalendar
          : listCalendar // ignore: cast_nullable_to_non_nullable
              as List<MonthCalendar>?,
      totalDayOff: freezed == totalDayOff
          ? _self.totalDayOff
          : totalDayOff // ignore: cast_nullable_to_non_nullable
              as double?,
      messCancelFood: freezed == messCancelFood
          ? _self.messCancelFood
          : messCancelFood // ignore: cast_nullable_to_non_nullable
              as MessCancelFood?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      banner: freezed == banner
          ? _self.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as List<PHXStatusLegendEntity>?,
      endCusor: freezed == endCusor
          ? _self.endCusor
          : endCusor // ignore: cast_nullable_to_non_nullable
              as String?,
      infoBanner: freezed == infoBanner
          ? _self.infoBanner
          : infoBanner // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String?,
      studentId: freezed == studentId
          ? _self.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int?,
      schoolYearId: freezed == schoolYearId
          ? _self.schoolYearId
          : schoolYearId // ignore: cast_nullable_to_non_nullable
              as int?,
      requestId: freezed == requestId
          ? _self.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as int?,
      schoolId: freezed == schoolId
          ? _self.schoolId
          : schoolId // ignore: cast_nullable_to_non_nullable
              as int?,
      listMonthRegister: freezed == listMonthRegister
          ? _self.listMonthRegister
          : listMonthRegister // ignore: cast_nullable_to_non_nullable
              as List<PHXMonth>?,
      isCancelRequest: freezed == isCancelRequest
          ? _self.isCancelRequest
          : isCancelRequest // ignore: cast_nullable_to_non_nullable
              as bool?,
      educationalCode: freezed == educationalCode
          ? _self.educationalCode
          : educationalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      foodSectionId: freezed == foodSectionId
          ? _self.foodSectionId
          : foodSectionId // ignore: cast_nullable_to_non_nullable
              as int?,
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      menuName: freezed == menuName
          ? _self.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String?,
      isImageDefault: freezed == isImageDefault
          ? _self.isImageDefault
          : isImageDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
      isViewRequestCancel: freezed == isViewRequestCancel
          ? _self.isViewRequestCancel
          : isViewRequestCancel // ignore: cast_nullable_to_non_nullable
              as bool?,
      requestCancelId: freezed == requestCancelId
          ? _self.requestCancelId
          : requestCancelId // ignore: cast_nullable_to_non_nullable
              as int?,
      hasNextPage: freezed == hasNextPage
          ? _self.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool?,
      page: freezed == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSize: freezed == pageSize
          ? _self.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPage: freezed == totalPage
          ? _self.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int?,
      remaining: freezed == remaining
          ? _self.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as int?,
      schoolTermId: freezed == schoolTermId
          ? _self.schoolTermId
          : schoolTermId // ignore: cast_nullable_to_non_nullable
              as int?,
      monthId: freezed == monthId
          ? _self.monthId
          : monthId // ignore: cast_nullable_to_non_nullable
              as int?,
      registerLink: freezed == registerLink
          ? _self.registerLink
          : registerLink // ignore: cast_nullable_to_non_nullable
              as String?,
      navigatorButtonName: freezed == navigatorButtonName
          ? _self.navigatorButtonName
          : navigatorButtonName // ignore: cast_nullable_to_non_nullable
              as String?,
      subjectId: freezed == subjectId
          ? _self.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as int?,
      subLable: freezed == subLable
          ? _self.subLable
          : subLable // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of PHXExtraEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXDataModalEntityCopyWith<$Res>? get dataModal {
    if (_self.dataModal == null) {
      return null;
    }

    return $PHXDataModalEntityCopyWith<$Res>(_self.dataModal!, (value) {
      return _then(_self.copyWith(dataModal: value));
    });
  }

  /// Create a copy of PHXExtraEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BodyCancelEntityCopyWith<$Res>? get bodyCancel {
    if (_self.bodyCancel == null) {
      return null;
    }

    return $BodyCancelEntityCopyWith<$Res>(_self.bodyCancel!, (value) {
      return _then(_self.copyWith(bodyCancel: value));
    });
  }

  /// Create a copy of PHXExtraEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessCancelFoodCopyWith<$Res>? get messCancelFood {
    if (_self.messCancelFood == null) {
      return null;
    }

    return $MessCancelFoodCopyWith<$Res>(_self.messCancelFood!, (value) {
      return _then(_self.copyWith(messCancelFood: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PHXExtraEntity].
extension PHXExtraEntityPatterns on PHXExtraEntity {
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
    TResult Function(_PHXExtraEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXExtraEntity() when $default != null:
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
    TResult Function(_PHXExtraEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXExtraEntity():
        return $default(_that);
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
    TResult? Function(_PHXExtraEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXExtraEntity() when $default != null:
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
            int? teacherId,
            String? phoneNumber,
            int? groupId,
            bool? callModalData,
            PHXDataModalEntity? dataModal,
            String? titlePage,
            String? subTitlePage,
            bool? showDivider,
            bool? isItalics,
            String? studentCode,
            String? serviceCode,
            String? shiftCode,
            BodyCancelEntity? bodyCancel,
            List<MonthCalendar>? listCalendar,
            double? totalDayOff,
            MessCancelFood? messCancelFood,
            String? title,
            String? content,
            String? banner,
            List<PHXStatusLegendEntity>? status,
            String? endCusor,
            String? infoBanner,
            String? statusCode,
            int? studentId,
            int? schoolYearId,
            int? requestId,
            int? schoolId,
            List<PHXMonth>? listMonthRegister,
            bool? isCancelRequest,
            String? educationalCode,
            int? foodSectionId,
            String? startDate,
            String? endDate,
            String? menuName,
            bool? isImageDefault,
            bool? isViewRequestCancel,
            int? requestCancelId,
            bool? hasNextPage,
            int? page,
            int? pageSize,
            int? total,
            int? totalPage,
            int? remaining,
            int? schoolTermId,
            int? monthId,
            String? registerLink,
            String? navigatorButtonName,
            int? subjectId,
            String? subLable)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXExtraEntity() when $default != null:
        return $default(
            _that.teacherId,
            _that.phoneNumber,
            _that.groupId,
            _that.callModalData,
            _that.dataModal,
            _that.titlePage,
            _that.subTitlePage,
            _that.showDivider,
            _that.isItalics,
            _that.studentCode,
            _that.serviceCode,
            _that.shiftCode,
            _that.bodyCancel,
            _that.listCalendar,
            _that.totalDayOff,
            _that.messCancelFood,
            _that.title,
            _that.content,
            _that.banner,
            _that.status,
            _that.endCusor,
            _that.infoBanner,
            _that.statusCode,
            _that.studentId,
            _that.schoolYearId,
            _that.requestId,
            _that.schoolId,
            _that.listMonthRegister,
            _that.isCancelRequest,
            _that.educationalCode,
            _that.foodSectionId,
            _that.startDate,
            _that.endDate,
            _that.menuName,
            _that.isImageDefault,
            _that.isViewRequestCancel,
            _that.requestCancelId,
            _that.hasNextPage,
            _that.page,
            _that.pageSize,
            _that.total,
            _that.totalPage,
            _that.remaining,
            _that.schoolTermId,
            _that.monthId,
            _that.registerLink,
            _that.navigatorButtonName,
            _that.subjectId,
            _that.subLable);
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
            int? teacherId,
            String? phoneNumber,
            int? groupId,
            bool? callModalData,
            PHXDataModalEntity? dataModal,
            String? titlePage,
            String? subTitlePage,
            bool? showDivider,
            bool? isItalics,
            String? studentCode,
            String? serviceCode,
            String? shiftCode,
            BodyCancelEntity? bodyCancel,
            List<MonthCalendar>? listCalendar,
            double? totalDayOff,
            MessCancelFood? messCancelFood,
            String? title,
            String? content,
            String? banner,
            List<PHXStatusLegendEntity>? status,
            String? endCusor,
            String? infoBanner,
            String? statusCode,
            int? studentId,
            int? schoolYearId,
            int? requestId,
            int? schoolId,
            List<PHXMonth>? listMonthRegister,
            bool? isCancelRequest,
            String? educationalCode,
            int? foodSectionId,
            String? startDate,
            String? endDate,
            String? menuName,
            bool? isImageDefault,
            bool? isViewRequestCancel,
            int? requestCancelId,
            bool? hasNextPage,
            int? page,
            int? pageSize,
            int? total,
            int? totalPage,
            int? remaining,
            int? schoolTermId,
            int? monthId,
            String? registerLink,
            String? navigatorButtonName,
            int? subjectId,
            String? subLable)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXExtraEntity():
        return $default(
            _that.teacherId,
            _that.phoneNumber,
            _that.groupId,
            _that.callModalData,
            _that.dataModal,
            _that.titlePage,
            _that.subTitlePage,
            _that.showDivider,
            _that.isItalics,
            _that.studentCode,
            _that.serviceCode,
            _that.shiftCode,
            _that.bodyCancel,
            _that.listCalendar,
            _that.totalDayOff,
            _that.messCancelFood,
            _that.title,
            _that.content,
            _that.banner,
            _that.status,
            _that.endCusor,
            _that.infoBanner,
            _that.statusCode,
            _that.studentId,
            _that.schoolYearId,
            _that.requestId,
            _that.schoolId,
            _that.listMonthRegister,
            _that.isCancelRequest,
            _that.educationalCode,
            _that.foodSectionId,
            _that.startDate,
            _that.endDate,
            _that.menuName,
            _that.isImageDefault,
            _that.isViewRequestCancel,
            _that.requestCancelId,
            _that.hasNextPage,
            _that.page,
            _that.pageSize,
            _that.total,
            _that.totalPage,
            _that.remaining,
            _that.schoolTermId,
            _that.monthId,
            _that.registerLink,
            _that.navigatorButtonName,
            _that.subjectId,
            _that.subLable);
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
            int? teacherId,
            String? phoneNumber,
            int? groupId,
            bool? callModalData,
            PHXDataModalEntity? dataModal,
            String? titlePage,
            String? subTitlePage,
            bool? showDivider,
            bool? isItalics,
            String? studentCode,
            String? serviceCode,
            String? shiftCode,
            BodyCancelEntity? bodyCancel,
            List<MonthCalendar>? listCalendar,
            double? totalDayOff,
            MessCancelFood? messCancelFood,
            String? title,
            String? content,
            String? banner,
            List<PHXStatusLegendEntity>? status,
            String? endCusor,
            String? infoBanner,
            String? statusCode,
            int? studentId,
            int? schoolYearId,
            int? requestId,
            int? schoolId,
            List<PHXMonth>? listMonthRegister,
            bool? isCancelRequest,
            String? educationalCode,
            int? foodSectionId,
            String? startDate,
            String? endDate,
            String? menuName,
            bool? isImageDefault,
            bool? isViewRequestCancel,
            int? requestCancelId,
            bool? hasNextPage,
            int? page,
            int? pageSize,
            int? total,
            int? totalPage,
            int? remaining,
            int? schoolTermId,
            int? monthId,
            String? registerLink,
            String? navigatorButtonName,
            int? subjectId,
            String? subLable)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXExtraEntity() when $default != null:
        return $default(
            _that.teacherId,
            _that.phoneNumber,
            _that.groupId,
            _that.callModalData,
            _that.dataModal,
            _that.titlePage,
            _that.subTitlePage,
            _that.showDivider,
            _that.isItalics,
            _that.studentCode,
            _that.serviceCode,
            _that.shiftCode,
            _that.bodyCancel,
            _that.listCalendar,
            _that.totalDayOff,
            _that.messCancelFood,
            _that.title,
            _that.content,
            _that.banner,
            _that.status,
            _that.endCusor,
            _that.infoBanner,
            _that.statusCode,
            _that.studentId,
            _that.schoolYearId,
            _that.requestId,
            _that.schoolId,
            _that.listMonthRegister,
            _that.isCancelRequest,
            _that.educationalCode,
            _that.foodSectionId,
            _that.startDate,
            _that.endDate,
            _that.menuName,
            _that.isImageDefault,
            _that.isViewRequestCancel,
            _that.requestCancelId,
            _that.hasNextPage,
            _that.page,
            _that.pageSize,
            _that.total,
            _that.totalPage,
            _that.remaining,
            _that.schoolTermId,
            _that.monthId,
            _that.registerLink,
            _that.navigatorButtonName,
            _that.subjectId,
            _that.subLable);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PHXExtraEntity extends PHXExtraEntity {
  const _PHXExtraEntity(
      {this.teacherId = null,
      this.phoneNumber = '',
      this.groupId = 0,
      this.callModalData = false,
      this.dataModal = null,
      this.titlePage = '',
      this.subTitlePage = '',
      this.showDivider = false,
      this.isItalics = false,
      this.studentCode = '',
      this.serviceCode = '',
      this.shiftCode = '',
      this.bodyCancel = null,
      final List<MonthCalendar>? listCalendar = null,
      this.totalDayOff = null,
      this.messCancelFood = null,
      this.title = '',
      this.content = '',
      this.banner = '',
      final List<PHXStatusLegendEntity>? status = const [],
      this.endCusor = '',
      this.infoBanner,
      this.statusCode,
      this.studentId,
      this.schoolYearId,
      this.requestId,
      this.schoolId,
      final List<PHXMonth>? listMonthRegister,
      this.isCancelRequest,
      this.educationalCode,
      this.foodSectionId,
      this.startDate,
      this.endDate,
      this.menuName,
      this.isImageDefault,
      this.isViewRequestCancel,
      this.requestCancelId,
      this.hasNextPage,
      this.page,
      this.pageSize,
      this.total,
      this.totalPage,
      this.remaining,
      this.schoolTermId,
      this.monthId,
      this.registerLink,
      this.navigatorButtonName,
      this.subjectId,
      this.subLable = ''})
      : _listCalendar = listCalendar,
        _status = status,
        _listMonthRegister = listMonthRegister,
        super._();

  @override
  @JsonKey()
  final int? teacherId;
  @override
  @JsonKey()
  final String? phoneNumber;
  @override
  @JsonKey()
  final int? groupId;
  @override
  @JsonKey()
  final bool? callModalData;
  @override
  @JsonKey()
  final PHXDataModalEntity? dataModal;
  @override
  @JsonKey()
  final String? titlePage;
  @override
  @JsonKey()
  final String? subTitlePage;
  @override
  @JsonKey()
  final bool? showDivider;
  @override
  @JsonKey()
  final bool? isItalics;
  @override
  @JsonKey()
  final String? studentCode;
  @override
  @JsonKey()
  final String? serviceCode;
  @override
  @JsonKey()
  final String? shiftCode;
  @override
  @JsonKey()
  final BodyCancelEntity? bodyCancel;
  final List<MonthCalendar>? _listCalendar;
  @override
  @JsonKey()
  List<MonthCalendar>? get listCalendar {
    final value = _listCalendar;
    if (value == null) return null;
    if (_listCalendar is EqualUnmodifiableListView) return _listCalendar;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final double? totalDayOff;
  @override
  @JsonKey()
  final MessCancelFood? messCancelFood;
  @override
  @JsonKey()
  final String? title;
  @override
  @JsonKey()
  final String? content;
  @override
  @JsonKey()
  final String? banner;
  final List<PHXStatusLegendEntity>? _status;
  @override
  @JsonKey()
  List<PHXStatusLegendEntity>? get status {
    final value = _status;
    if (value == null) return null;
    if (_status is EqualUnmodifiableListView) return _status;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final String? endCusor;
  @override
  final String? infoBanner;
  @override
  final String? statusCode;
  @override
  final int? studentId;
  @override
  final int? schoolYearId;
  @override
  final int? requestId;
  @override
  final int? schoolId;
  final List<PHXMonth>? _listMonthRegister;
  @override
  List<PHXMonth>? get listMonthRegister {
    final value = _listMonthRegister;
    if (value == null) return null;
    if (_listMonthRegister is EqualUnmodifiableListView)
      return _listMonthRegister;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isCancelRequest;
  @override
  final String? educationalCode;
  @override
  final int? foodSectionId;
  @override
  final String? startDate;
  @override
  final String? endDate;
  @override
  final String? menuName;
  @override
  final bool? isImageDefault;
  @override
  final bool? isViewRequestCancel;
  @override
  final int? requestCancelId;
  @override
  final bool? hasNextPage;
  @override
  final int? page;
  @override
  final int? pageSize;
  @override
  final int? total;
  @override
  final int? totalPage;
  @override
  final int? remaining;
  @override
  final int? schoolTermId;
  @override
  final int? monthId;
  @override
  final String? registerLink;
  @override
  final String? navigatorButtonName;
  @override
  final int? subjectId;
  @override
  @JsonKey()
  final String? subLable;

  /// Create a copy of PHXExtraEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXExtraEntityCopyWith<_PHXExtraEntity> get copyWith =>
      __$PHXExtraEntityCopyWithImpl<_PHXExtraEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXExtraEntity &&
            (identical(other.teacherId, teacherId) ||
                other.teacherId == teacherId) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.callModalData, callModalData) ||
                other.callModalData == callModalData) &&
            (identical(other.dataModal, dataModal) ||
                other.dataModal == dataModal) &&
            (identical(other.titlePage, titlePage) ||
                other.titlePage == titlePage) &&
            (identical(other.subTitlePage, subTitlePage) ||
                other.subTitlePage == subTitlePage) &&
            (identical(other.showDivider, showDivider) ||
                other.showDivider == showDivider) &&
            (identical(other.isItalics, isItalics) ||
                other.isItalics == isItalics) &&
            (identical(other.studentCode, studentCode) ||
                other.studentCode == studentCode) &&
            (identical(other.serviceCode, serviceCode) ||
                other.serviceCode == serviceCode) &&
            (identical(other.shiftCode, shiftCode) ||
                other.shiftCode == shiftCode) &&
            (identical(other.bodyCancel, bodyCancel) ||
                other.bodyCancel == bodyCancel) &&
            const DeepCollectionEquality()
                .equals(other._listCalendar, _listCalendar) &&
            (identical(other.totalDayOff, totalDayOff) ||
                other.totalDayOff == totalDayOff) &&
            (identical(other.messCancelFood, messCancelFood) ||
                other.messCancelFood == messCancelFood) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.banner, banner) || other.banner == banner) &&
            const DeepCollectionEquality().equals(other._status, _status) &&
            (identical(other.endCusor, endCusor) ||
                other.endCusor == endCusor) &&
            (identical(other.infoBanner, infoBanner) ||
                other.infoBanner == infoBanner) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.schoolYearId, schoolYearId) ||
                other.schoolYearId == schoolYearId) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.schoolId, schoolId) ||
                other.schoolId == schoolId) &&
            const DeepCollectionEquality()
                .equals(other._listMonthRegister, _listMonthRegister) &&
            (identical(other.isCancelRequest, isCancelRequest) ||
                other.isCancelRequest == isCancelRequest) &&
            (identical(other.educationalCode, educationalCode) ||
                other.educationalCode == educationalCode) &&
            (identical(other.foodSectionId, foodSectionId) ||
                other.foodSectionId == foodSectionId) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.menuName, menuName) ||
                other.menuName == menuName) &&
            (identical(other.isImageDefault, isImageDefault) ||
                other.isImageDefault == isImageDefault) &&
            (identical(other.isViewRequestCancel, isViewRequestCancel) ||
                other.isViewRequestCancel == isViewRequestCancel) &&
            (identical(other.requestCancelId, requestCancelId) ||
                other.requestCancelId == requestCancelId) &&
            (identical(other.hasNextPage, hasNextPage) ||
                other.hasNextPage == hasNextPage) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage) &&
            (identical(other.remaining, remaining) ||
                other.remaining == remaining) &&
            (identical(other.schoolTermId, schoolTermId) ||
                other.schoolTermId == schoolTermId) &&
            (identical(other.monthId, monthId) || other.monthId == monthId) &&
            (identical(other.registerLink, registerLink) ||
                other.registerLink == registerLink) &&
            (identical(other.navigatorButtonName, navigatorButtonName) ||
                other.navigatorButtonName == navigatorButtonName) &&
            (identical(other.subjectId, subjectId) ||
                other.subjectId == subjectId) &&
            (identical(other.subLable, subLable) ||
                other.subLable == subLable));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        teacherId,
        phoneNumber,
        groupId,
        callModalData,
        dataModal,
        titlePage,
        subTitlePage,
        showDivider,
        isItalics,
        studentCode,
        serviceCode,
        shiftCode,
        bodyCancel,
        const DeepCollectionEquality().hash(_listCalendar),
        totalDayOff,
        messCancelFood,
        title,
        content,
        banner,
        const DeepCollectionEquality().hash(_status),
        endCusor,
        infoBanner,
        statusCode,
        studentId,
        schoolYearId,
        requestId,
        schoolId,
        const DeepCollectionEquality().hash(_listMonthRegister),
        isCancelRequest,
        educationalCode,
        foodSectionId,
        startDate,
        endDate,
        menuName,
        isImageDefault,
        isViewRequestCancel,
        requestCancelId,
        hasNextPage,
        page,
        pageSize,
        total,
        totalPage,
        remaining,
        schoolTermId,
        monthId,
        registerLink,
        navigatorButtonName,
        subjectId,
        subLable
      ]);

  @override
  String toString() {
    return 'PHXExtraEntity(teacherId: $teacherId, phoneNumber: $phoneNumber, groupId: $groupId, callModalData: $callModalData, dataModal: $dataModal, titlePage: $titlePage, subTitlePage: $subTitlePage, showDivider: $showDivider, isItalics: $isItalics, studentCode: $studentCode, serviceCode: $serviceCode, shiftCode: $shiftCode, bodyCancel: $bodyCancel, listCalendar: $listCalendar, totalDayOff: $totalDayOff, messCancelFood: $messCancelFood, title: $title, content: $content, banner: $banner, status: $status, endCusor: $endCusor, infoBanner: $infoBanner, statusCode: $statusCode, studentId: $studentId, schoolYearId: $schoolYearId, requestId: $requestId, schoolId: $schoolId, listMonthRegister: $listMonthRegister, isCancelRequest: $isCancelRequest, educationalCode: $educationalCode, foodSectionId: $foodSectionId, startDate: $startDate, endDate: $endDate, menuName: $menuName, isImageDefault: $isImageDefault, isViewRequestCancel: $isViewRequestCancel, requestCancelId: $requestCancelId, hasNextPage: $hasNextPage, page: $page, pageSize: $pageSize, total: $total, totalPage: $totalPage, remaining: $remaining, schoolTermId: $schoolTermId, monthId: $monthId, registerLink: $registerLink, navigatorButtonName: $navigatorButtonName, subjectId: $subjectId, subLable: $subLable)';
  }
}

/// @nodoc
abstract mixin class _$PHXExtraEntityCopyWith<$Res>
    implements $PHXExtraEntityCopyWith<$Res> {
  factory _$PHXExtraEntityCopyWith(
          _PHXExtraEntity value, $Res Function(_PHXExtraEntity) _then) =
      __$PHXExtraEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? teacherId,
      String? phoneNumber,
      int? groupId,
      bool? callModalData,
      PHXDataModalEntity? dataModal,
      String? titlePage,
      String? subTitlePage,
      bool? showDivider,
      bool? isItalics,
      String? studentCode,
      String? serviceCode,
      String? shiftCode,
      BodyCancelEntity? bodyCancel,
      List<MonthCalendar>? listCalendar,
      double? totalDayOff,
      MessCancelFood? messCancelFood,
      String? title,
      String? content,
      String? banner,
      List<PHXStatusLegendEntity>? status,
      String? endCusor,
      String? infoBanner,
      String? statusCode,
      int? studentId,
      int? schoolYearId,
      int? requestId,
      int? schoolId,
      List<PHXMonth>? listMonthRegister,
      bool? isCancelRequest,
      String? educationalCode,
      int? foodSectionId,
      String? startDate,
      String? endDate,
      String? menuName,
      bool? isImageDefault,
      bool? isViewRequestCancel,
      int? requestCancelId,
      bool? hasNextPage,
      int? page,
      int? pageSize,
      int? total,
      int? totalPage,
      int? remaining,
      int? schoolTermId,
      int? monthId,
      String? registerLink,
      String? navigatorButtonName,
      int? subjectId,
      String? subLable});

  @override
  $PHXDataModalEntityCopyWith<$Res>? get dataModal;
  @override
  $BodyCancelEntityCopyWith<$Res>? get bodyCancel;
  @override
  $MessCancelFoodCopyWith<$Res>? get messCancelFood;
}

/// @nodoc
class __$PHXExtraEntityCopyWithImpl<$Res>
    implements _$PHXExtraEntityCopyWith<$Res> {
  __$PHXExtraEntityCopyWithImpl(this._self, this._then);

  final _PHXExtraEntity _self;
  final $Res Function(_PHXExtraEntity) _then;

  /// Create a copy of PHXExtraEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? teacherId = freezed,
    Object? phoneNumber = freezed,
    Object? groupId = freezed,
    Object? callModalData = freezed,
    Object? dataModal = freezed,
    Object? titlePage = freezed,
    Object? subTitlePage = freezed,
    Object? showDivider = freezed,
    Object? isItalics = freezed,
    Object? studentCode = freezed,
    Object? serviceCode = freezed,
    Object? shiftCode = freezed,
    Object? bodyCancel = freezed,
    Object? listCalendar = freezed,
    Object? totalDayOff = freezed,
    Object? messCancelFood = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? banner = freezed,
    Object? status = freezed,
    Object? endCusor = freezed,
    Object? infoBanner = freezed,
    Object? statusCode = freezed,
    Object? studentId = freezed,
    Object? schoolYearId = freezed,
    Object? requestId = freezed,
    Object? schoolId = freezed,
    Object? listMonthRegister = freezed,
    Object? isCancelRequest = freezed,
    Object? educationalCode = freezed,
    Object? foodSectionId = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? menuName = freezed,
    Object? isImageDefault = freezed,
    Object? isViewRequestCancel = freezed,
    Object? requestCancelId = freezed,
    Object? hasNextPage = freezed,
    Object? page = freezed,
    Object? pageSize = freezed,
    Object? total = freezed,
    Object? totalPage = freezed,
    Object? remaining = freezed,
    Object? schoolTermId = freezed,
    Object? monthId = freezed,
    Object? registerLink = freezed,
    Object? navigatorButtonName = freezed,
    Object? subjectId = freezed,
    Object? subLable = freezed,
  }) {
    return _then(_PHXExtraEntity(
      teacherId: freezed == teacherId
          ? _self.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as int?,
      phoneNumber: freezed == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      groupId: freezed == groupId
          ? _self.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int?,
      callModalData: freezed == callModalData
          ? _self.callModalData
          : callModalData // ignore: cast_nullable_to_non_nullable
              as bool?,
      dataModal: freezed == dataModal
          ? _self.dataModal
          : dataModal // ignore: cast_nullable_to_non_nullable
              as PHXDataModalEntity?,
      titlePage: freezed == titlePage
          ? _self.titlePage
          : titlePage // ignore: cast_nullable_to_non_nullable
              as String?,
      subTitlePage: freezed == subTitlePage
          ? _self.subTitlePage
          : subTitlePage // ignore: cast_nullable_to_non_nullable
              as String?,
      showDivider: freezed == showDivider
          ? _self.showDivider
          : showDivider // ignore: cast_nullable_to_non_nullable
              as bool?,
      isItalics: freezed == isItalics
          ? _self.isItalics
          : isItalics // ignore: cast_nullable_to_non_nullable
              as bool?,
      studentCode: freezed == studentCode
          ? _self.studentCode
          : studentCode // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceCode: freezed == serviceCode
          ? _self.serviceCode
          : serviceCode // ignore: cast_nullable_to_non_nullable
              as String?,
      shiftCode: freezed == shiftCode
          ? _self.shiftCode
          : shiftCode // ignore: cast_nullable_to_non_nullable
              as String?,
      bodyCancel: freezed == bodyCancel
          ? _self.bodyCancel
          : bodyCancel // ignore: cast_nullable_to_non_nullable
              as BodyCancelEntity?,
      listCalendar: freezed == listCalendar
          ? _self._listCalendar
          : listCalendar // ignore: cast_nullable_to_non_nullable
              as List<MonthCalendar>?,
      totalDayOff: freezed == totalDayOff
          ? _self.totalDayOff
          : totalDayOff // ignore: cast_nullable_to_non_nullable
              as double?,
      messCancelFood: freezed == messCancelFood
          ? _self.messCancelFood
          : messCancelFood // ignore: cast_nullable_to_non_nullable
              as MessCancelFood?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      banner: freezed == banner
          ? _self.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self._status
          : status // ignore: cast_nullable_to_non_nullable
              as List<PHXStatusLegendEntity>?,
      endCusor: freezed == endCusor
          ? _self.endCusor
          : endCusor // ignore: cast_nullable_to_non_nullable
              as String?,
      infoBanner: freezed == infoBanner
          ? _self.infoBanner
          : infoBanner // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String?,
      studentId: freezed == studentId
          ? _self.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int?,
      schoolYearId: freezed == schoolYearId
          ? _self.schoolYearId
          : schoolYearId // ignore: cast_nullable_to_non_nullable
              as int?,
      requestId: freezed == requestId
          ? _self.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as int?,
      schoolId: freezed == schoolId
          ? _self.schoolId
          : schoolId // ignore: cast_nullable_to_non_nullable
              as int?,
      listMonthRegister: freezed == listMonthRegister
          ? _self._listMonthRegister
          : listMonthRegister // ignore: cast_nullable_to_non_nullable
              as List<PHXMonth>?,
      isCancelRequest: freezed == isCancelRequest
          ? _self.isCancelRequest
          : isCancelRequest // ignore: cast_nullable_to_non_nullable
              as bool?,
      educationalCode: freezed == educationalCode
          ? _self.educationalCode
          : educationalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      foodSectionId: freezed == foodSectionId
          ? _self.foodSectionId
          : foodSectionId // ignore: cast_nullable_to_non_nullable
              as int?,
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      menuName: freezed == menuName
          ? _self.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String?,
      isImageDefault: freezed == isImageDefault
          ? _self.isImageDefault
          : isImageDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
      isViewRequestCancel: freezed == isViewRequestCancel
          ? _self.isViewRequestCancel
          : isViewRequestCancel // ignore: cast_nullable_to_non_nullable
              as bool?,
      requestCancelId: freezed == requestCancelId
          ? _self.requestCancelId
          : requestCancelId // ignore: cast_nullable_to_non_nullable
              as int?,
      hasNextPage: freezed == hasNextPage
          ? _self.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool?,
      page: freezed == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSize: freezed == pageSize
          ? _self.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPage: freezed == totalPage
          ? _self.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int?,
      remaining: freezed == remaining
          ? _self.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as int?,
      schoolTermId: freezed == schoolTermId
          ? _self.schoolTermId
          : schoolTermId // ignore: cast_nullable_to_non_nullable
              as int?,
      monthId: freezed == monthId
          ? _self.monthId
          : monthId // ignore: cast_nullable_to_non_nullable
              as int?,
      registerLink: freezed == registerLink
          ? _self.registerLink
          : registerLink // ignore: cast_nullable_to_non_nullable
              as String?,
      navigatorButtonName: freezed == navigatorButtonName
          ? _self.navigatorButtonName
          : navigatorButtonName // ignore: cast_nullable_to_non_nullable
              as String?,
      subjectId: freezed == subjectId
          ? _self.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as int?,
      subLable: freezed == subLable
          ? _self.subLable
          : subLable // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of PHXExtraEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXDataModalEntityCopyWith<$Res>? get dataModal {
    if (_self.dataModal == null) {
      return null;
    }

    return $PHXDataModalEntityCopyWith<$Res>(_self.dataModal!, (value) {
      return _then(_self.copyWith(dataModal: value));
    });
  }

  /// Create a copy of PHXExtraEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BodyCancelEntityCopyWith<$Res>? get bodyCancel {
    if (_self.bodyCancel == null) {
      return null;
    }

    return $BodyCancelEntityCopyWith<$Res>(_self.bodyCancel!, (value) {
      return _then(_self.copyWith(bodyCancel: value));
    });
  }

  /// Create a copy of PHXExtraEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessCancelFoodCopyWith<$Res>? get messCancelFood {
    if (_self.messCancelFood == null) {
      return null;
    }

    return $MessCancelFoodCopyWith<$Res>(_self.messCancelFood!, (value) {
      return _then(_self.copyWith(messCancelFood: value));
    });
  }
}

/// @nodoc
mixin _$CalendarItem {
  String get content;
  String get date;
  String get dateToCallApi;
  String get dayOfWeek;
  bool get isCurrentMonth;
  bool get isToday;
  bool get active;
  bool get isPast;
  bool get isWeekend;
  String get type;
  String get scheduleSetting;
  bool? get isHalfDay;
  bool? get isFullDay;
  String? get status;

  /// Create a copy of CalendarItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CalendarItemCopyWith<CalendarItem> get copyWith =>
      _$CalendarItemCopyWithImpl<CalendarItem>(
          this as CalendarItem, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CalendarItem &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.dateToCallApi, dateToCallApi) ||
                other.dateToCallApi == dateToCallApi) &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.isCurrentMonth, isCurrentMonth) ||
                other.isCurrentMonth == isCurrentMonth) &&
            (identical(other.isToday, isToday) || other.isToday == isToday) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.isPast, isPast) || other.isPast == isPast) &&
            (identical(other.isWeekend, isWeekend) ||
                other.isWeekend == isWeekend) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.scheduleSetting, scheduleSetting) ||
                other.scheduleSetting == scheduleSetting) &&
            (identical(other.isHalfDay, isHalfDay) ||
                other.isHalfDay == isHalfDay) &&
            (identical(other.isFullDay, isFullDay) ||
                other.isFullDay == isFullDay) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      content,
      date,
      dateToCallApi,
      dayOfWeek,
      isCurrentMonth,
      isToday,
      active,
      isPast,
      isWeekend,
      type,
      scheduleSetting,
      isHalfDay,
      isFullDay,
      status);

  @override
  String toString() {
    return 'CalendarItem(content: $content, date: $date, dateToCallApi: $dateToCallApi, dayOfWeek: $dayOfWeek, isCurrentMonth: $isCurrentMonth, isToday: $isToday, active: $active, isPast: $isPast, isWeekend: $isWeekend, type: $type, scheduleSetting: $scheduleSetting, isHalfDay: $isHalfDay, isFullDay: $isFullDay, status: $status)';
  }
}

/// @nodoc
abstract mixin class $CalendarItemCopyWith<$Res> {
  factory $CalendarItemCopyWith(
          CalendarItem value, $Res Function(CalendarItem) _then) =
      _$CalendarItemCopyWithImpl;
  @useResult
  $Res call(
      {String content,
      String date,
      String dateToCallApi,
      String dayOfWeek,
      bool isCurrentMonth,
      bool isToday,
      bool active,
      bool isPast,
      bool isWeekend,
      String type,
      String scheduleSetting,
      bool? isHalfDay,
      bool? isFullDay,
      String? status});
}

/// @nodoc
class _$CalendarItemCopyWithImpl<$Res> implements $CalendarItemCopyWith<$Res> {
  _$CalendarItemCopyWithImpl(this._self, this._then);

  final CalendarItem _self;
  final $Res Function(CalendarItem) _then;

  /// Create a copy of CalendarItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? date = null,
    Object? dateToCallApi = null,
    Object? dayOfWeek = null,
    Object? isCurrentMonth = null,
    Object? isToday = null,
    Object? active = null,
    Object? isPast = null,
    Object? isWeekend = null,
    Object? type = null,
    Object? scheduleSetting = null,
    Object? isHalfDay = freezed,
    Object? isFullDay = freezed,
    Object? status = freezed,
  }) {
    return _then(_self.copyWith(
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      dateToCallApi: null == dateToCallApi
          ? _self.dateToCallApi
          : dateToCallApi // ignore: cast_nullable_to_non_nullable
              as String,
      dayOfWeek: null == dayOfWeek
          ? _self.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as String,
      isCurrentMonth: null == isCurrentMonth
          ? _self.isCurrentMonth
          : isCurrentMonth // ignore: cast_nullable_to_non_nullable
              as bool,
      isToday: null == isToday
          ? _self.isToday
          : isToday // ignore: cast_nullable_to_non_nullable
              as bool,
      active: null == active
          ? _self.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      isPast: null == isPast
          ? _self.isPast
          : isPast // ignore: cast_nullable_to_non_nullable
              as bool,
      isWeekend: null == isWeekend
          ? _self.isWeekend
          : isWeekend // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      scheduleSetting: null == scheduleSetting
          ? _self.scheduleSetting
          : scheduleSetting // ignore: cast_nullable_to_non_nullable
              as String,
      isHalfDay: freezed == isHalfDay
          ? _self.isHalfDay
          : isHalfDay // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFullDay: freezed == isFullDay
          ? _self.isFullDay
          : isFullDay // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CalendarItem].
extension CalendarItemPatterns on CalendarItem {
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
    TResult Function(_CalendarItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CalendarItem() when $default != null:
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
    TResult Function(_CalendarItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CalendarItem():
        return $default(_that);
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
    TResult? Function(_CalendarItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CalendarItem() when $default != null:
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
            String content,
            String date,
            String dateToCallApi,
            String dayOfWeek,
            bool isCurrentMonth,
            bool isToday,
            bool active,
            bool isPast,
            bool isWeekend,
            String type,
            String scheduleSetting,
            bool? isHalfDay,
            bool? isFullDay,
            String? status)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CalendarItem() when $default != null:
        return $default(
            _that.content,
            _that.date,
            _that.dateToCallApi,
            _that.dayOfWeek,
            _that.isCurrentMonth,
            _that.isToday,
            _that.active,
            _that.isPast,
            _that.isWeekend,
            _that.type,
            _that.scheduleSetting,
            _that.isHalfDay,
            _that.isFullDay,
            _that.status);
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
            String content,
            String date,
            String dateToCallApi,
            String dayOfWeek,
            bool isCurrentMonth,
            bool isToday,
            bool active,
            bool isPast,
            bool isWeekend,
            String type,
            String scheduleSetting,
            bool? isHalfDay,
            bool? isFullDay,
            String? status)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CalendarItem():
        return $default(
            _that.content,
            _that.date,
            _that.dateToCallApi,
            _that.dayOfWeek,
            _that.isCurrentMonth,
            _that.isToday,
            _that.active,
            _that.isPast,
            _that.isWeekend,
            _that.type,
            _that.scheduleSetting,
            _that.isHalfDay,
            _that.isFullDay,
            _that.status);
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
            String content,
            String date,
            String dateToCallApi,
            String dayOfWeek,
            bool isCurrentMonth,
            bool isToday,
            bool active,
            bool isPast,
            bool isWeekend,
            String type,
            String scheduleSetting,
            bool? isHalfDay,
            bool? isFullDay,
            String? status)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CalendarItem() when $default != null:
        return $default(
            _that.content,
            _that.date,
            _that.dateToCallApi,
            _that.dayOfWeek,
            _that.isCurrentMonth,
            _that.isToday,
            _that.active,
            _that.isPast,
            _that.isWeekend,
            _that.type,
            _that.scheduleSetting,
            _that.isHalfDay,
            _that.isFullDay,
            _that.status);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CalendarItem implements CalendarItem {
  const _CalendarItem(
      {this.content = '',
      this.date = '',
      this.dateToCallApi = '',
      this.dayOfWeek = '',
      this.isCurrentMonth = false,
      this.isToday = false,
      this.active = false,
      this.isPast = false,
      this.isWeekend = false,
      this.type = '',
      this.scheduleSetting = '',
      this.isHalfDay = false,
      this.isFullDay = false,
      this.status = ''});

  @override
  @JsonKey()
  final String content;
  @override
  @JsonKey()
  final String date;
  @override
  @JsonKey()
  final String dateToCallApi;
  @override
  @JsonKey()
  final String dayOfWeek;
  @override
  @JsonKey()
  final bool isCurrentMonth;
  @override
  @JsonKey()
  final bool isToday;
  @override
  @JsonKey()
  final bool active;
  @override
  @JsonKey()
  final bool isPast;
  @override
  @JsonKey()
  final bool isWeekend;
  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final String scheduleSetting;
  @override
  @JsonKey()
  final bool? isHalfDay;
  @override
  @JsonKey()
  final bool? isFullDay;
  @override
  @JsonKey()
  final String? status;

  /// Create a copy of CalendarItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CalendarItemCopyWith<_CalendarItem> get copyWith =>
      __$CalendarItemCopyWithImpl<_CalendarItem>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CalendarItem &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.dateToCallApi, dateToCallApi) ||
                other.dateToCallApi == dateToCallApi) &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.isCurrentMonth, isCurrentMonth) ||
                other.isCurrentMonth == isCurrentMonth) &&
            (identical(other.isToday, isToday) || other.isToday == isToday) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.isPast, isPast) || other.isPast == isPast) &&
            (identical(other.isWeekend, isWeekend) ||
                other.isWeekend == isWeekend) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.scheduleSetting, scheduleSetting) ||
                other.scheduleSetting == scheduleSetting) &&
            (identical(other.isHalfDay, isHalfDay) ||
                other.isHalfDay == isHalfDay) &&
            (identical(other.isFullDay, isFullDay) ||
                other.isFullDay == isFullDay) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      content,
      date,
      dateToCallApi,
      dayOfWeek,
      isCurrentMonth,
      isToday,
      active,
      isPast,
      isWeekend,
      type,
      scheduleSetting,
      isHalfDay,
      isFullDay,
      status);

  @override
  String toString() {
    return 'CalendarItem(content: $content, date: $date, dateToCallApi: $dateToCallApi, dayOfWeek: $dayOfWeek, isCurrentMonth: $isCurrentMonth, isToday: $isToday, active: $active, isPast: $isPast, isWeekend: $isWeekend, type: $type, scheduleSetting: $scheduleSetting, isHalfDay: $isHalfDay, isFullDay: $isFullDay, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$CalendarItemCopyWith<$Res>
    implements $CalendarItemCopyWith<$Res> {
  factory _$CalendarItemCopyWith(
          _CalendarItem value, $Res Function(_CalendarItem) _then) =
      __$CalendarItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String content,
      String date,
      String dateToCallApi,
      String dayOfWeek,
      bool isCurrentMonth,
      bool isToday,
      bool active,
      bool isPast,
      bool isWeekend,
      String type,
      String scheduleSetting,
      bool? isHalfDay,
      bool? isFullDay,
      String? status});
}

/// @nodoc
class __$CalendarItemCopyWithImpl<$Res>
    implements _$CalendarItemCopyWith<$Res> {
  __$CalendarItemCopyWithImpl(this._self, this._then);

  final _CalendarItem _self;
  final $Res Function(_CalendarItem) _then;

  /// Create a copy of CalendarItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? content = null,
    Object? date = null,
    Object? dateToCallApi = null,
    Object? dayOfWeek = null,
    Object? isCurrentMonth = null,
    Object? isToday = null,
    Object? active = null,
    Object? isPast = null,
    Object? isWeekend = null,
    Object? type = null,
    Object? scheduleSetting = null,
    Object? isHalfDay = freezed,
    Object? isFullDay = freezed,
    Object? status = freezed,
  }) {
    return _then(_CalendarItem(
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      dateToCallApi: null == dateToCallApi
          ? _self.dateToCallApi
          : dateToCallApi // ignore: cast_nullable_to_non_nullable
              as String,
      dayOfWeek: null == dayOfWeek
          ? _self.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as String,
      isCurrentMonth: null == isCurrentMonth
          ? _self.isCurrentMonth
          : isCurrentMonth // ignore: cast_nullable_to_non_nullable
              as bool,
      isToday: null == isToday
          ? _self.isToday
          : isToday // ignore: cast_nullable_to_non_nullable
              as bool,
      active: null == active
          ? _self.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      isPast: null == isPast
          ? _self.isPast
          : isPast // ignore: cast_nullable_to_non_nullable
              as bool,
      isWeekend: null == isWeekend
          ? _self.isWeekend
          : isWeekend // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      scheduleSetting: null == scheduleSetting
          ? _self.scheduleSetting
          : scheduleSetting // ignore: cast_nullable_to_non_nullable
              as String,
      isHalfDay: freezed == isHalfDay
          ? _self.isHalfDay
          : isHalfDay // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFullDay: freezed == isFullDay
          ? _self.isFullDay
          : isFullDay // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$MonthCalendar {
  String get month;
  bool get current;
  List<CalendarItem> get dayOfMonth;

  /// Create a copy of MonthCalendar
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MonthCalendarCopyWith<MonthCalendar> get copyWith =>
      _$MonthCalendarCopyWithImpl<MonthCalendar>(
          this as MonthCalendar, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MonthCalendar &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.current, current) || other.current == current) &&
            const DeepCollectionEquality()
                .equals(other.dayOfMonth, dayOfMonth));
  }

  @override
  int get hashCode => Object.hash(runtimeType, month, current,
      const DeepCollectionEquality().hash(dayOfMonth));

  @override
  String toString() {
    return 'MonthCalendar(month: $month, current: $current, dayOfMonth: $dayOfMonth)';
  }
}

/// @nodoc
abstract mixin class $MonthCalendarCopyWith<$Res> {
  factory $MonthCalendarCopyWith(
          MonthCalendar value, $Res Function(MonthCalendar) _then) =
      _$MonthCalendarCopyWithImpl;
  @useResult
  $Res call({String month, bool current, List<CalendarItem> dayOfMonth});
}

/// @nodoc
class _$MonthCalendarCopyWithImpl<$Res>
    implements $MonthCalendarCopyWith<$Res> {
  _$MonthCalendarCopyWithImpl(this._self, this._then);

  final MonthCalendar _self;
  final $Res Function(MonthCalendar) _then;

  /// Create a copy of MonthCalendar
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? current = null,
    Object? dayOfMonth = null,
  }) {
    return _then(_self.copyWith(
      month: null == month
          ? _self.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      current: null == current
          ? _self.current
          : current // ignore: cast_nullable_to_non_nullable
              as bool,
      dayOfMonth: null == dayOfMonth
          ? _self.dayOfMonth
          : dayOfMonth // ignore: cast_nullable_to_non_nullable
              as List<CalendarItem>,
    ));
  }
}

/// Adds pattern-matching-related methods to [MonthCalendar].
extension MonthCalendarPatterns on MonthCalendar {
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
    TResult Function(_MonthCalendar value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MonthCalendar() when $default != null:
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
    TResult Function(_MonthCalendar value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MonthCalendar():
        return $default(_that);
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
    TResult? Function(_MonthCalendar value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MonthCalendar() when $default != null:
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
    TResult Function(String month, bool current, List<CalendarItem> dayOfMonth)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MonthCalendar() when $default != null:
        return $default(_that.month, _that.current, _that.dayOfMonth);
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
    TResult Function(String month, bool current, List<CalendarItem> dayOfMonth)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MonthCalendar():
        return $default(_that.month, _that.current, _that.dayOfMonth);
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
            String month, bool current, List<CalendarItem> dayOfMonth)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MonthCalendar() when $default != null:
        return $default(_that.month, _that.current, _that.dayOfMonth);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MonthCalendar implements MonthCalendar {
  const _MonthCalendar(
      {this.month = '',
      this.current = false,
      final List<CalendarItem> dayOfMonth = const []})
      : _dayOfMonth = dayOfMonth;

  @override
  @JsonKey()
  final String month;
  @override
  @JsonKey()
  final bool current;
  final List<CalendarItem> _dayOfMonth;
  @override
  @JsonKey()
  List<CalendarItem> get dayOfMonth {
    if (_dayOfMonth is EqualUnmodifiableListView) return _dayOfMonth;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dayOfMonth);
  }

  /// Create a copy of MonthCalendar
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MonthCalendarCopyWith<_MonthCalendar> get copyWith =>
      __$MonthCalendarCopyWithImpl<_MonthCalendar>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MonthCalendar &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.current, current) || other.current == current) &&
            const DeepCollectionEquality()
                .equals(other._dayOfMonth, _dayOfMonth));
  }

  @override
  int get hashCode => Object.hash(runtimeType, month, current,
      const DeepCollectionEquality().hash(_dayOfMonth));

  @override
  String toString() {
    return 'MonthCalendar(month: $month, current: $current, dayOfMonth: $dayOfMonth)';
  }
}

/// @nodoc
abstract mixin class _$MonthCalendarCopyWith<$Res>
    implements $MonthCalendarCopyWith<$Res> {
  factory _$MonthCalendarCopyWith(
          _MonthCalendar value, $Res Function(_MonthCalendar) _then) =
      __$MonthCalendarCopyWithImpl;
  @override
  @useResult
  $Res call({String month, bool current, List<CalendarItem> dayOfMonth});
}

/// @nodoc
class __$MonthCalendarCopyWithImpl<$Res>
    implements _$MonthCalendarCopyWith<$Res> {
  __$MonthCalendarCopyWithImpl(this._self, this._then);

  final _MonthCalendar _self;
  final $Res Function(_MonthCalendar) _then;

  /// Create a copy of MonthCalendar
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? month = null,
    Object? current = null,
    Object? dayOfMonth = null,
  }) {
    return _then(_MonthCalendar(
      month: null == month
          ? _self.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      current: null == current
          ? _self.current
          : current // ignore: cast_nullable_to_non_nullable
              as bool,
      dayOfMonth: null == dayOfMonth
          ? _self._dayOfMonth
          : dayOfMonth // ignore: cast_nullable_to_non_nullable
              as List<CalendarItem>,
    ));
  }
}

/// @nodoc
mixin _$MessCancelFood {
  String? get title;
  String? get content;

  /// Create a copy of MessCancelFood
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MessCancelFoodCopyWith<MessCancelFood> get copyWith =>
      _$MessCancelFoodCopyWithImpl<MessCancelFood>(
          this as MessCancelFood, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MessCancelFood &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, content);

  @override
  String toString() {
    return 'MessCancelFood(title: $title, content: $content)';
  }
}

/// @nodoc
abstract mixin class $MessCancelFoodCopyWith<$Res> {
  factory $MessCancelFoodCopyWith(
          MessCancelFood value, $Res Function(MessCancelFood) _then) =
      _$MessCancelFoodCopyWithImpl;
  @useResult
  $Res call({String? title, String? content});
}

/// @nodoc
class _$MessCancelFoodCopyWithImpl<$Res>
    implements $MessCancelFoodCopyWith<$Res> {
  _$MessCancelFoodCopyWithImpl(this._self, this._then);

  final MessCancelFood _self;
  final $Res Function(MessCancelFood) _then;

  /// Create a copy of MessCancelFood
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
  }) {
    return _then(_self.copyWith(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [MessCancelFood].
extension MessCancelFoodPatterns on MessCancelFood {
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
    TResult Function(_MessCancelFood value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MessCancelFood() when $default != null:
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
    TResult Function(_MessCancelFood value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessCancelFood():
        return $default(_that);
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
    TResult? Function(_MessCancelFood value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessCancelFood() when $default != null:
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
    TResult Function(String? title, String? content)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MessCancelFood() when $default != null:
        return $default(_that.title, _that.content);
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
    TResult Function(String? title, String? content) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessCancelFood():
        return $default(_that.title, _that.content);
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
    TResult? Function(String? title, String? content)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessCancelFood() when $default != null:
        return $default(_that.title, _that.content);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MessCancelFood implements MessCancelFood {
  const _MessCancelFood({this.title = '', this.content = ''});

  @override
  @JsonKey()
  final String? title;
  @override
  @JsonKey()
  final String? content;

  /// Create a copy of MessCancelFood
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MessCancelFoodCopyWith<_MessCancelFood> get copyWith =>
      __$MessCancelFoodCopyWithImpl<_MessCancelFood>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MessCancelFood &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, content);

  @override
  String toString() {
    return 'MessCancelFood(title: $title, content: $content)';
  }
}

/// @nodoc
abstract mixin class _$MessCancelFoodCopyWith<$Res>
    implements $MessCancelFoodCopyWith<$Res> {
  factory _$MessCancelFoodCopyWith(
          _MessCancelFood value, $Res Function(_MessCancelFood) _then) =
      __$MessCancelFoodCopyWithImpl;
  @override
  @useResult
  $Res call({String? title, String? content});
}

/// @nodoc
class __$MessCancelFoodCopyWithImpl<$Res>
    implements _$MessCancelFoodCopyWith<$Res> {
  __$MessCancelFoodCopyWithImpl(this._self, this._then);

  final _MessCancelFood _self;
  final $Res Function(_MessCancelFood) _then;

  /// Create a copy of MessCancelFood
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
  }) {
    return _then(_MessCancelFood(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$BodyCancelEntity {
  List<int> get registerId;
  String get type;

  /// Create a copy of BodyCancelEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BodyCancelEntityCopyWith<BodyCancelEntity> get copyWith =>
      _$BodyCancelEntityCopyWithImpl<BodyCancelEntity>(
          this as BodyCancelEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BodyCancelEntity &&
            const DeepCollectionEquality()
                .equals(other.registerId, registerId) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(registerId), type);

  @override
  String toString() {
    return 'BodyCancelEntity(registerId: $registerId, type: $type)';
  }
}

/// @nodoc
abstract mixin class $BodyCancelEntityCopyWith<$Res> {
  factory $BodyCancelEntityCopyWith(
          BodyCancelEntity value, $Res Function(BodyCancelEntity) _then) =
      _$BodyCancelEntityCopyWithImpl;
  @useResult
  $Res call({List<int> registerId, String type});
}

/// @nodoc
class _$BodyCancelEntityCopyWithImpl<$Res>
    implements $BodyCancelEntityCopyWith<$Res> {
  _$BodyCancelEntityCopyWithImpl(this._self, this._then);

  final BodyCancelEntity _self;
  final $Res Function(BodyCancelEntity) _then;

  /// Create a copy of BodyCancelEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registerId = null,
    Object? type = null,
  }) {
    return _then(_self.copyWith(
      registerId: null == registerId
          ? _self.registerId
          : registerId // ignore: cast_nullable_to_non_nullable
              as List<int>,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [BodyCancelEntity].
extension BodyCancelEntityPatterns on BodyCancelEntity {
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
    TResult Function(_BodyCancelEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BodyCancelEntity() when $default != null:
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
    TResult Function(_BodyCancelEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BodyCancelEntity():
        return $default(_that);
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
    TResult? Function(_BodyCancelEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BodyCancelEntity() when $default != null:
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
    TResult Function(List<int> registerId, String type)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BodyCancelEntity() when $default != null:
        return $default(_that.registerId, _that.type);
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
    TResult Function(List<int> registerId, String type) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BodyCancelEntity():
        return $default(_that.registerId, _that.type);
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
    TResult? Function(List<int> registerId, String type)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BodyCancelEntity() when $default != null:
        return $default(_that.registerId, _that.type);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _BodyCancelEntity implements BodyCancelEntity {
  const _BodyCancelEntity(
      {final List<int> registerId = const [], this.type = ''})
      : _registerId = registerId;

  final List<int> _registerId;
  @override
  @JsonKey()
  List<int> get registerId {
    if (_registerId is EqualUnmodifiableListView) return _registerId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_registerId);
  }

  @override
  @JsonKey()
  final String type;

  /// Create a copy of BodyCancelEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BodyCancelEntityCopyWith<_BodyCancelEntity> get copyWith =>
      __$BodyCancelEntityCopyWithImpl<_BodyCancelEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BodyCancelEntity &&
            const DeepCollectionEquality()
                .equals(other._registerId, _registerId) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_registerId), type);

  @override
  String toString() {
    return 'BodyCancelEntity(registerId: $registerId, type: $type)';
  }
}

/// @nodoc
abstract mixin class _$BodyCancelEntityCopyWith<$Res>
    implements $BodyCancelEntityCopyWith<$Res> {
  factory _$BodyCancelEntityCopyWith(
          _BodyCancelEntity value, $Res Function(_BodyCancelEntity) _then) =
      __$BodyCancelEntityCopyWithImpl;
  @override
  @useResult
  $Res call({List<int> registerId, String type});
}

/// @nodoc
class __$BodyCancelEntityCopyWithImpl<$Res>
    implements _$BodyCancelEntityCopyWith<$Res> {
  __$BodyCancelEntityCopyWithImpl(this._self, this._then);

  final _BodyCancelEntity _self;
  final $Res Function(_BodyCancelEntity) _then;

  /// Create a copy of BodyCancelEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? registerId = null,
    Object? type = null,
  }) {
    return _then(_BodyCancelEntity(
      registerId: null == registerId
          ? _self._registerId
          : registerId // ignore: cast_nullable_to_non_nullable
              as List<int>,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$PHXMonth {
  int? get id;
  String? get name;
  bool? get isActive;
  String? get code;

  /// Create a copy of PHXMonth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXMonthCopyWith<PHXMonth> get copyWith =>
      _$PHXMonthCopyWithImpl<PHXMonth>(this as PHXMonth, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXMonth &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, isActive, code);

  @override
  String toString() {
    return 'PHXMonth(id: $id, name: $name, isActive: $isActive, code: $code)';
  }
}

/// @nodoc
abstract mixin class $PHXMonthCopyWith<$Res> {
  factory $PHXMonthCopyWith(PHXMonth value, $Res Function(PHXMonth) _then) =
      _$PHXMonthCopyWithImpl;
  @useResult
  $Res call({int? id, String? name, bool? isActive, String? code});
}

/// @nodoc
class _$PHXMonthCopyWithImpl<$Res> implements $PHXMonthCopyWith<$Res> {
  _$PHXMonthCopyWithImpl(this._self, this._then);

  final PHXMonth _self;
  final $Res Function(PHXMonth) _then;

  /// Create a copy of PHXMonth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? isActive = freezed,
    Object? code = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PHXMonth].
extension PHXMonthPatterns on PHXMonth {
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
    TResult Function(_PHXMonth value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXMonth() when $default != null:
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
    TResult Function(_PHXMonth value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXMonth():
        return $default(_that);
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
    TResult? Function(_PHXMonth value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXMonth() when $default != null:
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
    TResult Function(int? id, String? name, bool? isActive, String? code)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXMonth() when $default != null:
        return $default(_that.id, _that.name, _that.isActive, _that.code);
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
    TResult Function(int? id, String? name, bool? isActive, String? code)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXMonth():
        return $default(_that.id, _that.name, _that.isActive, _that.code);
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
    TResult? Function(int? id, String? name, bool? isActive, String? code)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXMonth() when $default != null:
        return $default(_that.id, _that.name, _that.isActive, _that.code);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PHXMonth implements PHXMonth {
  const _PHXMonth(
      {this.id = 0, this.name = '-', this.isActive = false, this.code = ''});

  @override
  @JsonKey()
  final int? id;
  @override
  @JsonKey()
  final String? name;
  @override
  @JsonKey()
  final bool? isActive;
  @override
  @JsonKey()
  final String? code;

  /// Create a copy of PHXMonth
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXMonthCopyWith<_PHXMonth> get copyWith =>
      __$PHXMonthCopyWithImpl<_PHXMonth>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXMonth &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, isActive, code);

  @override
  String toString() {
    return 'PHXMonth(id: $id, name: $name, isActive: $isActive, code: $code)';
  }
}

/// @nodoc
abstract mixin class _$PHXMonthCopyWith<$Res>
    implements $PHXMonthCopyWith<$Res> {
  factory _$PHXMonthCopyWith(_PHXMonth value, $Res Function(_PHXMonth) _then) =
      __$PHXMonthCopyWithImpl;
  @override
  @useResult
  $Res call({int? id, String? name, bool? isActive, String? code});
}

/// @nodoc
class __$PHXMonthCopyWithImpl<$Res> implements _$PHXMonthCopyWith<$Res> {
  __$PHXMonthCopyWithImpl(this._self, this._then);

  final _PHXMonth _self;
  final $Res Function(_PHXMonth) _then;

  /// Create a copy of PHXMonth
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? isActive = freezed,
    Object? code = freezed,
  }) {
    return _then(_PHXMonth(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$PHXDataModalTabEntity {
  String? get title;
  bool? get isActive;
  int? get id;

  /// Create a copy of PHXDataModalTabEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXDataModalTabEntityCopyWith<PHXDataModalTabEntity> get copyWith =>
      _$PHXDataModalTabEntityCopyWithImpl<PHXDataModalTabEntity>(
          this as PHXDataModalTabEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXDataModalTabEntity &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, isActive, id);

  @override
  String toString() {
    return 'PHXDataModalTabEntity(title: $title, isActive: $isActive, id: $id)';
  }
}

/// @nodoc
abstract mixin class $PHXDataModalTabEntityCopyWith<$Res> {
  factory $PHXDataModalTabEntityCopyWith(PHXDataModalTabEntity value,
          $Res Function(PHXDataModalTabEntity) _then) =
      _$PHXDataModalTabEntityCopyWithImpl;
  @useResult
  $Res call({String? title, bool? isActive, int? id});
}

/// @nodoc
class _$PHXDataModalTabEntityCopyWithImpl<$Res>
    implements $PHXDataModalTabEntityCopyWith<$Res> {
  _$PHXDataModalTabEntityCopyWithImpl(this._self, this._then);

  final PHXDataModalTabEntity _self;
  final $Res Function(PHXDataModalTabEntity) _then;

  /// Create a copy of PHXDataModalTabEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? isActive = freezed,
    Object? id = freezed,
  }) {
    return _then(_self.copyWith(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PHXDataModalTabEntity].
extension PHXDataModalTabEntityPatterns on PHXDataModalTabEntity {
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
    TResult Function(_PHXDataModalTabEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalTabEntity() when $default != null:
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
    TResult Function(_PHXDataModalTabEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalTabEntity():
        return $default(_that);
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
    TResult? Function(_PHXDataModalTabEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalTabEntity() when $default != null:
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
    TResult Function(String? title, bool? isActive, int? id)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalTabEntity() when $default != null:
        return $default(_that.title, _that.isActive, _that.id);
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
    TResult Function(String? title, bool? isActive, int? id) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalTabEntity():
        return $default(_that.title, _that.isActive, _that.id);
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
    TResult? Function(String? title, bool? isActive, int? id)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalTabEntity() when $default != null:
        return $default(_that.title, _that.isActive, _that.id);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PHXDataModalTabEntity implements PHXDataModalTabEntity {
  const _PHXDataModalTabEntity({this.title, this.isActive, this.id});

  @override
  final String? title;
  @override
  final bool? isActive;
  @override
  final int? id;

  /// Create a copy of PHXDataModalTabEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXDataModalTabEntityCopyWith<_PHXDataModalTabEntity> get copyWith =>
      __$PHXDataModalTabEntityCopyWithImpl<_PHXDataModalTabEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXDataModalTabEntity &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, isActive, id);

  @override
  String toString() {
    return 'PHXDataModalTabEntity(title: $title, isActive: $isActive, id: $id)';
  }
}

/// @nodoc
abstract mixin class _$PHXDataModalTabEntityCopyWith<$Res>
    implements $PHXDataModalTabEntityCopyWith<$Res> {
  factory _$PHXDataModalTabEntityCopyWith(_PHXDataModalTabEntity value,
          $Res Function(_PHXDataModalTabEntity) _then) =
      __$PHXDataModalTabEntityCopyWithImpl;
  @override
  @useResult
  $Res call({String? title, bool? isActive, int? id});
}

/// @nodoc
class __$PHXDataModalTabEntityCopyWithImpl<$Res>
    implements _$PHXDataModalTabEntityCopyWith<$Res> {
  __$PHXDataModalTabEntityCopyWithImpl(this._self, this._then);

  final _PHXDataModalTabEntity _self;
  final $Res Function(_PHXDataModalTabEntity) _then;

  /// Create a copy of PHXDataModalTabEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? isActive = freezed,
    Object? id = freezed,
  }) {
    return _then(_PHXDataModalTabEntity(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$PHXEmptyStateEntity {
  String? get title;
  String? get subTitle;
  bool? get isShowButton;
  String? get buttonLabel;

  /// Create a copy of PHXEmptyStateEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXEmptyStateEntityCopyWith<PHXEmptyStateEntity> get copyWith =>
      _$PHXEmptyStateEntityCopyWithImpl<PHXEmptyStateEntity>(
          this as PHXEmptyStateEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXEmptyStateEntity &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.isShowButton, isShowButton) ||
                other.isShowButton == isShowButton) &&
            (identical(other.buttonLabel, buttonLabel) ||
                other.buttonLabel == buttonLabel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, subTitle, isShowButton, buttonLabel);

  @override
  String toString() {
    return 'PHXEmptyStateEntity(title: $title, subTitle: $subTitle, isShowButton: $isShowButton, buttonLabel: $buttonLabel)';
  }
}

/// @nodoc
abstract mixin class $PHXEmptyStateEntityCopyWith<$Res> {
  factory $PHXEmptyStateEntityCopyWith(
          PHXEmptyStateEntity value, $Res Function(PHXEmptyStateEntity) _then) =
      _$PHXEmptyStateEntityCopyWithImpl;
  @useResult
  $Res call(
      {String? title,
      String? subTitle,
      bool? isShowButton,
      String? buttonLabel});
}

/// @nodoc
class _$PHXEmptyStateEntityCopyWithImpl<$Res>
    implements $PHXEmptyStateEntityCopyWith<$Res> {
  _$PHXEmptyStateEntityCopyWithImpl(this._self, this._then);

  final PHXEmptyStateEntity _self;
  final $Res Function(PHXEmptyStateEntity) _then;

  /// Create a copy of PHXEmptyStateEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? subTitle = freezed,
    Object? isShowButton = freezed,
    Object? buttonLabel = freezed,
  }) {
    return _then(_self.copyWith(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subTitle: freezed == subTitle
          ? _self.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      isShowButton: freezed == isShowButton
          ? _self.isShowButton
          : isShowButton // ignore: cast_nullable_to_non_nullable
              as bool?,
      buttonLabel: freezed == buttonLabel
          ? _self.buttonLabel
          : buttonLabel // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PHXEmptyStateEntity].
extension PHXEmptyStateEntityPatterns on PHXEmptyStateEntity {
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
    TResult Function(_PHXEmptyStateEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXEmptyStateEntity() when $default != null:
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
    TResult Function(_PHXEmptyStateEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXEmptyStateEntity():
        return $default(_that);
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
    TResult? Function(_PHXEmptyStateEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXEmptyStateEntity() when $default != null:
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
    TResult Function(String? title, String? subTitle, bool? isShowButton,
            String? buttonLabel)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXEmptyStateEntity() when $default != null:
        return $default(
            _that.title, _that.subTitle, _that.isShowButton, _that.buttonLabel);
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
    TResult Function(String? title, String? subTitle, bool? isShowButton,
            String? buttonLabel)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXEmptyStateEntity():
        return $default(
            _that.title, _that.subTitle, _that.isShowButton, _that.buttonLabel);
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
    TResult? Function(String? title, String? subTitle, bool? isShowButton,
            String? buttonLabel)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXEmptyStateEntity() when $default != null:
        return $default(
            _that.title, _that.subTitle, _that.isShowButton, _that.buttonLabel);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PHXEmptyStateEntity extends PHXEmptyStateEntity {
  const _PHXEmptyStateEntity(
      {this.title = '',
      this.subTitle = '',
      this.isShowButton = false,
      this.buttonLabel = ''})
      : super._();

  @override
  @JsonKey()
  final String? title;
  @override
  @JsonKey()
  final String? subTitle;
  @override
  @JsonKey()
  final bool? isShowButton;
  @override
  @JsonKey()
  final String? buttonLabel;

  /// Create a copy of PHXEmptyStateEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXEmptyStateEntityCopyWith<_PHXEmptyStateEntity> get copyWith =>
      __$PHXEmptyStateEntityCopyWithImpl<_PHXEmptyStateEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXEmptyStateEntity &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.isShowButton, isShowButton) ||
                other.isShowButton == isShowButton) &&
            (identical(other.buttonLabel, buttonLabel) ||
                other.buttonLabel == buttonLabel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, subTitle, isShowButton, buttonLabel);

  @override
  String toString() {
    return 'PHXEmptyStateEntity(title: $title, subTitle: $subTitle, isShowButton: $isShowButton, buttonLabel: $buttonLabel)';
  }
}

/// @nodoc
abstract mixin class _$PHXEmptyStateEntityCopyWith<$Res>
    implements $PHXEmptyStateEntityCopyWith<$Res> {
  factory _$PHXEmptyStateEntityCopyWith(_PHXEmptyStateEntity value,
          $Res Function(_PHXEmptyStateEntity) _then) =
      __$PHXEmptyStateEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? title,
      String? subTitle,
      bool? isShowButton,
      String? buttonLabel});
}

/// @nodoc
class __$PHXEmptyStateEntityCopyWithImpl<$Res>
    implements _$PHXEmptyStateEntityCopyWith<$Res> {
  __$PHXEmptyStateEntityCopyWithImpl(this._self, this._then);

  final _PHXEmptyStateEntity _self;
  final $Res Function(_PHXEmptyStateEntity) _then;

  /// Create a copy of PHXEmptyStateEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? subTitle = freezed,
    Object? isShowButton = freezed,
    Object? buttonLabel = freezed,
  }) {
    return _then(_PHXEmptyStateEntity(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subTitle: freezed == subTitle
          ? _self.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      isShowButton: freezed == isShowButton
          ? _self.isShowButton
          : isShowButton // ignore: cast_nullable_to_non_nullable
              as bool?,
      buttonLabel: freezed == buttonLabel
          ? _self.buttonLabel
          : buttonLabel // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$PHXTableEntity {
  String? get title;
  PHXTableContentEntity? get content;

  /// Create a copy of PHXTableEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXTableEntityCopyWith<PHXTableEntity> get copyWith =>
      _$PHXTableEntityCopyWithImpl<PHXTableEntity>(
          this as PHXTableEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXTableEntity &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, content);

  @override
  String toString() {
    return 'PHXTableEntity(title: $title, content: $content)';
  }
}

/// @nodoc
abstract mixin class $PHXTableEntityCopyWith<$Res> {
  factory $PHXTableEntityCopyWith(
          PHXTableEntity value, $Res Function(PHXTableEntity) _then) =
      _$PHXTableEntityCopyWithImpl;
  @useResult
  $Res call({String? title, PHXTableContentEntity? content});

  $PHXTableContentEntityCopyWith<$Res>? get content;
}

/// @nodoc
class _$PHXTableEntityCopyWithImpl<$Res>
    implements $PHXTableEntityCopyWith<$Res> {
  _$PHXTableEntityCopyWithImpl(this._self, this._then);

  final PHXTableEntity _self;
  final $Res Function(PHXTableEntity) _then;

  /// Create a copy of PHXTableEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
  }) {
    return _then(_self.copyWith(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as PHXTableContentEntity?,
    ));
  }

  /// Create a copy of PHXTableEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXTableContentEntityCopyWith<$Res>? get content {
    if (_self.content == null) {
      return null;
    }

    return $PHXTableContentEntityCopyWith<$Res>(_self.content!, (value) {
      return _then(_self.copyWith(content: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PHXTableEntity].
extension PHXTableEntityPatterns on PHXTableEntity {
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
    TResult Function(_PHXTableEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXTableEntity() when $default != null:
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
    TResult Function(_PHXTableEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXTableEntity():
        return $default(_that);
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
    TResult? Function(_PHXTableEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXTableEntity() when $default != null:
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
    TResult Function(String? title, PHXTableContentEntity? content)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXTableEntity() when $default != null:
        return $default(_that.title, _that.content);
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
    TResult Function(String? title, PHXTableContentEntity? content) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXTableEntity():
        return $default(_that.title, _that.content);
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
    TResult? Function(String? title, PHXTableContentEntity? content)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXTableEntity() when $default != null:
        return $default(_that.title, _that.content);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PHXTableEntity extends PHXTableEntity {
  const _PHXTableEntity({this.title = '', this.content = null}) : super._();

  @override
  @JsonKey()
  final String? title;
  @override
  @JsonKey()
  final PHXTableContentEntity? content;

  /// Create a copy of PHXTableEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXTableEntityCopyWith<_PHXTableEntity> get copyWith =>
      __$PHXTableEntityCopyWithImpl<_PHXTableEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXTableEntity &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, content);

  @override
  String toString() {
    return 'PHXTableEntity(title: $title, content: $content)';
  }
}

/// @nodoc
abstract mixin class _$PHXTableEntityCopyWith<$Res>
    implements $PHXTableEntityCopyWith<$Res> {
  factory _$PHXTableEntityCopyWith(
          _PHXTableEntity value, $Res Function(_PHXTableEntity) _then) =
      __$PHXTableEntityCopyWithImpl;
  @override
  @useResult
  $Res call({String? title, PHXTableContentEntity? content});

  @override
  $PHXTableContentEntityCopyWith<$Res>? get content;
}

/// @nodoc
class __$PHXTableEntityCopyWithImpl<$Res>
    implements _$PHXTableEntityCopyWith<$Res> {
  __$PHXTableEntityCopyWithImpl(this._self, this._then);

  final _PHXTableEntity _self;
  final $Res Function(_PHXTableEntity) _then;

  /// Create a copy of PHXTableEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
  }) {
    return _then(_PHXTableEntity(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as PHXTableContentEntity?,
    ));
  }

  /// Create a copy of PHXTableEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXTableContentEntityCopyWith<$Res>? get content {
    if (_self.content == null) {
      return null;
    }

    return $PHXTableContentEntityCopyWith<$Res>(_self.content!, (value) {
      return _then(_self.copyWith(content: value));
    });
  }
}

/// @nodoc
mixin _$PHXTableContentEntity {
  List<String>? get headers;
  List<List<String>>? get rows;

  /// Create a copy of PHXTableContentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXTableContentEntityCopyWith<PHXTableContentEntity> get copyWith =>
      _$PHXTableContentEntityCopyWithImpl<PHXTableContentEntity>(
          this as PHXTableContentEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXTableContentEntity &&
            const DeepCollectionEquality().equals(other.headers, headers) &&
            const DeepCollectionEquality().equals(other.rows, rows));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(headers),
      const DeepCollectionEquality().hash(rows));

  @override
  String toString() {
    return 'PHXTableContentEntity(headers: $headers, rows: $rows)';
  }
}

/// @nodoc
abstract mixin class $PHXTableContentEntityCopyWith<$Res> {
  factory $PHXTableContentEntityCopyWith(PHXTableContentEntity value,
          $Res Function(PHXTableContentEntity) _then) =
      _$PHXTableContentEntityCopyWithImpl;
  @useResult
  $Res call({List<String>? headers, List<List<String>>? rows});
}

/// @nodoc
class _$PHXTableContentEntityCopyWithImpl<$Res>
    implements $PHXTableContentEntityCopyWith<$Res> {
  _$PHXTableContentEntityCopyWithImpl(this._self, this._then);

  final PHXTableContentEntity _self;
  final $Res Function(PHXTableContentEntity) _then;

  /// Create a copy of PHXTableContentEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? headers = freezed,
    Object? rows = freezed,
  }) {
    return _then(_self.copyWith(
      headers: freezed == headers
          ? _self.headers
          : headers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      rows: freezed == rows
          ? _self.rows
          : rows // ignore: cast_nullable_to_non_nullable
              as List<List<String>>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PHXTableContentEntity].
extension PHXTableContentEntityPatterns on PHXTableContentEntity {
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
    TResult Function(_PHXTableContentEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXTableContentEntity() when $default != null:
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
    TResult Function(_PHXTableContentEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXTableContentEntity():
        return $default(_that);
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
    TResult? Function(_PHXTableContentEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXTableContentEntity() when $default != null:
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
    TResult Function(List<String>? headers, List<List<String>>? rows)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXTableContentEntity() when $default != null:
        return $default(_that.headers, _that.rows);
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
    TResult Function(List<String>? headers, List<List<String>>? rows) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXTableContentEntity():
        return $default(_that.headers, _that.rows);
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
    TResult? Function(List<String>? headers, List<List<String>>? rows)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXTableContentEntity() when $default != null:
        return $default(_that.headers, _that.rows);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PHXTableContentEntity extends PHXTableContentEntity {
  const _PHXTableContentEntity(
      {final List<String>? headers = const [],
      final List<List<String>>? rows = const []})
      : _headers = headers,
        _rows = rows,
        super._();

  final List<String>? _headers;
  @override
  @JsonKey()
  List<String>? get headers {
    final value = _headers;
    if (value == null) return null;
    if (_headers is EqualUnmodifiableListView) return _headers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<List<String>>? _rows;
  @override
  @JsonKey()
  List<List<String>>? get rows {
    final value = _rows;
    if (value == null) return null;
    if (_rows is EqualUnmodifiableListView) return _rows;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of PHXTableContentEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXTableContentEntityCopyWith<_PHXTableContentEntity> get copyWith =>
      __$PHXTableContentEntityCopyWithImpl<_PHXTableContentEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXTableContentEntity &&
            const DeepCollectionEquality().equals(other._headers, _headers) &&
            const DeepCollectionEquality().equals(other._rows, _rows));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_headers),
      const DeepCollectionEquality().hash(_rows));

  @override
  String toString() {
    return 'PHXTableContentEntity(headers: $headers, rows: $rows)';
  }
}

/// @nodoc
abstract mixin class _$PHXTableContentEntityCopyWith<$Res>
    implements $PHXTableContentEntityCopyWith<$Res> {
  factory _$PHXTableContentEntityCopyWith(_PHXTableContentEntity value,
          $Res Function(_PHXTableContentEntity) _then) =
      __$PHXTableContentEntityCopyWithImpl;
  @override
  @useResult
  $Res call({List<String>? headers, List<List<String>>? rows});
}

/// @nodoc
class __$PHXTableContentEntityCopyWithImpl<$Res>
    implements _$PHXTableContentEntityCopyWith<$Res> {
  __$PHXTableContentEntityCopyWithImpl(this._self, this._then);

  final _PHXTableContentEntity _self;
  final $Res Function(_PHXTableContentEntity) _then;

  /// Create a copy of PHXTableContentEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? headers = freezed,
    Object? rows = freezed,
  }) {
    return _then(_PHXTableContentEntity(
      headers: freezed == headers
          ? _self._headers
          : headers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      rows: freezed == rows
          ? _self._rows
          : rows // ignore: cast_nullable_to_non_nullable
              as List<List<String>>?,
    ));
  }
}

/// @nodoc
mixin _$PHXStatusLegendEntity {
  String? get title;
  String? get status;

  /// Create a copy of PHXStatusLegendEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXStatusLegendEntityCopyWith<PHXStatusLegendEntity> get copyWith =>
      _$PHXStatusLegendEntityCopyWithImpl<PHXStatusLegendEntity>(
          this as PHXStatusLegendEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXStatusLegendEntity &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, status);

  @override
  String toString() {
    return 'PHXStatusLegendEntity(title: $title, status: $status)';
  }
}

/// @nodoc
abstract mixin class $PHXStatusLegendEntityCopyWith<$Res> {
  factory $PHXStatusLegendEntityCopyWith(PHXStatusLegendEntity value,
          $Res Function(PHXStatusLegendEntity) _then) =
      _$PHXStatusLegendEntityCopyWithImpl;
  @useResult
  $Res call({String? title, String? status});
}

/// @nodoc
class _$PHXStatusLegendEntityCopyWithImpl<$Res>
    implements $PHXStatusLegendEntityCopyWith<$Res> {
  _$PHXStatusLegendEntityCopyWithImpl(this._self, this._then);

  final PHXStatusLegendEntity _self;
  final $Res Function(PHXStatusLegendEntity) _then;

  /// Create a copy of PHXStatusLegendEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? status = freezed,
  }) {
    return _then(_self.copyWith(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PHXStatusLegendEntity].
extension PHXStatusLegendEntityPatterns on PHXStatusLegendEntity {
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
    TResult Function(_PHXStatusLegendEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXStatusLegendEntity() when $default != null:
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
    TResult Function(_PHXStatusLegendEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXStatusLegendEntity():
        return $default(_that);
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
    TResult? Function(_PHXStatusLegendEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXStatusLegendEntity() when $default != null:
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
    TResult Function(String? title, String? status)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXStatusLegendEntity() when $default != null:
        return $default(_that.title, _that.status);
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
    TResult Function(String? title, String? status) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXStatusLegendEntity():
        return $default(_that.title, _that.status);
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
    TResult? Function(String? title, String? status)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXStatusLegendEntity() when $default != null:
        return $default(_that.title, _that.status);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PHXStatusLegendEntity implements PHXStatusLegendEntity {
  const _PHXStatusLegendEntity({this.title = '', this.status = ''});

  @override
  @JsonKey()
  final String? title;
  @override
  @JsonKey()
  final String? status;

  /// Create a copy of PHXStatusLegendEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXStatusLegendEntityCopyWith<_PHXStatusLegendEntity> get copyWith =>
      __$PHXStatusLegendEntityCopyWithImpl<_PHXStatusLegendEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXStatusLegendEntity &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, status);

  @override
  String toString() {
    return 'PHXStatusLegendEntity(title: $title, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$PHXStatusLegendEntityCopyWith<$Res>
    implements $PHXStatusLegendEntityCopyWith<$Res> {
  factory _$PHXStatusLegendEntityCopyWith(_PHXStatusLegendEntity value,
          $Res Function(_PHXStatusLegendEntity) _then) =
      __$PHXStatusLegendEntityCopyWithImpl;
  @override
  @useResult
  $Res call({String? title, String? status});
}

/// @nodoc
class __$PHXStatusLegendEntityCopyWithImpl<$Res>
    implements _$PHXStatusLegendEntityCopyWith<$Res> {
  __$PHXStatusLegendEntityCopyWithImpl(this._self, this._then);

  final _PHXStatusLegendEntity _self;
  final $Res Function(_PHXStatusLegendEntity) _then;

  /// Create a copy of PHXStatusLegendEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? status = freezed,
  }) {
    return _then(_PHXStatusLegendEntity(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
