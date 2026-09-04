// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phx_screen_response_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PHXScreenResponseData {
  @JsonKey(name: 'data')
  PHXScreenDataData? get data;

  /// Create a copy of PHXScreenResponseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXScreenResponseDataCopyWith<PHXScreenResponseData> get copyWith =>
      _$PHXScreenResponseDataCopyWithImpl<PHXScreenResponseData>(
          this as PHXScreenResponseData, _$identity);

  /// Serializes this PHXScreenResponseData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXScreenResponseData &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @override
  String toString() {
    return 'PHXScreenResponseData(data: $data)';
  }
}

/// @nodoc
abstract mixin class $PHXScreenResponseDataCopyWith<$Res> {
  factory $PHXScreenResponseDataCopyWith(PHXScreenResponseData value,
          $Res Function(PHXScreenResponseData) _then) =
      _$PHXScreenResponseDataCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'data') PHXScreenDataData? data});

  $PHXScreenDataDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$PHXScreenResponseDataCopyWithImpl<$Res>
    implements $PHXScreenResponseDataCopyWith<$Res> {
  _$PHXScreenResponseDataCopyWithImpl(this._self, this._then);

  final PHXScreenResponseData _self;
  final $Res Function(PHXScreenResponseData) _then;

  /// Create a copy of PHXScreenResponseData
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
              as PHXScreenDataData?,
    ));
  }

  /// Create a copy of PHXScreenResponseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXScreenDataDataCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $PHXScreenDataDataCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PHXScreenResponseData].
extension PHXScreenResponseDataPatterns on PHXScreenResponseData {
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
    TResult Function(_PHXScreenResponseData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXScreenResponseData() when $default != null:
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
    TResult Function(_PHXScreenResponseData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXScreenResponseData():
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
    TResult? Function(_PHXScreenResponseData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXScreenResponseData() when $default != null:
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
    TResult Function(@JsonKey(name: 'data') PHXScreenDataData? data)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXScreenResponseData() when $default != null:
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
    TResult Function(@JsonKey(name: 'data') PHXScreenDataData? data) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXScreenResponseData():
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
    TResult? Function(@JsonKey(name: 'data') PHXScreenDataData? data)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXScreenResponseData() when $default != null:
        return $default(_that.data);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _PHXScreenResponseData implements PHXScreenResponseData {
  const _PHXScreenResponseData({@JsonKey(name: 'data') this.data});
  factory _PHXScreenResponseData.fromJson(Map<String, dynamic> json) =>
      _$PHXScreenResponseDataFromJson(json);

  @override
  @JsonKey(name: 'data')
  final PHXScreenDataData? data;

  /// Create a copy of PHXScreenResponseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXScreenResponseDataCopyWith<_PHXScreenResponseData> get copyWith =>
      __$PHXScreenResponseDataCopyWithImpl<_PHXScreenResponseData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PHXScreenResponseDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXScreenResponseData &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @override
  String toString() {
    return 'PHXScreenResponseData(data: $data)';
  }
}

/// @nodoc
abstract mixin class _$PHXScreenResponseDataCopyWith<$Res>
    implements $PHXScreenResponseDataCopyWith<$Res> {
  factory _$PHXScreenResponseDataCopyWith(_PHXScreenResponseData value,
          $Res Function(_PHXScreenResponseData) _then) =
      __$PHXScreenResponseDataCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'data') PHXScreenDataData? data});

  @override
  $PHXScreenDataDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$PHXScreenResponseDataCopyWithImpl<$Res>
    implements _$PHXScreenResponseDataCopyWith<$Res> {
  __$PHXScreenResponseDataCopyWithImpl(this._self, this._then);

  final _PHXScreenResponseData _self;
  final $Res Function(_PHXScreenResponseData) _then;

  /// Create a copy of PHXScreenResponseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_PHXScreenResponseData(
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as PHXScreenDataData?,
    ));
  }

  /// Create a copy of PHXScreenResponseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXScreenDataDataCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $PHXScreenDataDataCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc
mixin _$PHXScreenDataData {
  @JsonKey(name: 'app_bar')
  PHXAppBarData? get appBar;
  @JsonKey(name: 'header_info')
  PHXHeaderInfoData? get headerInfo;
  @JsonKey(name: 'tabs')
  List<PHXTabData>? get tabs;
  @JsonKey(name: 'sections')
  List<PHXSectionData>? get sections;
  @JsonKey(name: 'sections_bottom_sheet')
  List<PHXSectionData>? get sectionsBottomSheet;
  @JsonKey(name: 'list_options')
  List<PHXListOptionData>? get listOptions;
  @JsonKey(name: 'bottom_actions')
  List<PHXBottomActionData>? get bottomActions;
  @JsonKey(name: 'table')
  PHXTableData? get table;
  @JsonKey(name: 'empty_state')
  PHXEmptyStateData? get emptyState;

  /// Create a copy of PHXScreenDataData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXScreenDataDataCopyWith<PHXScreenDataData> get copyWith =>
      _$PHXScreenDataDataCopyWithImpl<PHXScreenDataData>(
          this as PHXScreenDataData, _$identity);

  /// Serializes this PHXScreenDataData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXScreenDataData &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'PHXScreenDataData(appBar: $appBar, headerInfo: $headerInfo, tabs: $tabs, sections: $sections, sectionsBottomSheet: $sectionsBottomSheet, listOptions: $listOptions, bottomActions: $bottomActions, table: $table, emptyState: $emptyState)';
  }
}

/// @nodoc
abstract mixin class $PHXScreenDataDataCopyWith<$Res> {
  factory $PHXScreenDataDataCopyWith(
          PHXScreenDataData value, $Res Function(PHXScreenDataData) _then) =
      _$PHXScreenDataDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'app_bar') PHXAppBarData? appBar,
      @JsonKey(name: 'header_info') PHXHeaderInfoData? headerInfo,
      @JsonKey(name: 'tabs') List<PHXTabData>? tabs,
      @JsonKey(name: 'sections') List<PHXSectionData>? sections,
      @JsonKey(name: 'sections_bottom_sheet')
      List<PHXSectionData>? sectionsBottomSheet,
      @JsonKey(name: 'list_options') List<PHXListOptionData>? listOptions,
      @JsonKey(name: 'bottom_actions') List<PHXBottomActionData>? bottomActions,
      @JsonKey(name: 'table') PHXTableData? table,
      @JsonKey(name: 'empty_state') PHXEmptyStateData? emptyState});

  $PHXAppBarDataCopyWith<$Res>? get appBar;
  $PHXHeaderInfoDataCopyWith<$Res>? get headerInfo;
  $PHXTableDataCopyWith<$Res>? get table;
  $PHXEmptyStateDataCopyWith<$Res>? get emptyState;
}

/// @nodoc
class _$PHXScreenDataDataCopyWithImpl<$Res>
    implements $PHXScreenDataDataCopyWith<$Res> {
  _$PHXScreenDataDataCopyWithImpl(this._self, this._then);

  final PHXScreenDataData _self;
  final $Res Function(PHXScreenDataData) _then;

  /// Create a copy of PHXScreenDataData
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
              as PHXAppBarData?,
      headerInfo: freezed == headerInfo
          ? _self.headerInfo
          : headerInfo // ignore: cast_nullable_to_non_nullable
              as PHXHeaderInfoData?,
      tabs: freezed == tabs
          ? _self.tabs
          : tabs // ignore: cast_nullable_to_non_nullable
              as List<PHXTabData>?,
      sections: freezed == sections
          ? _self.sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<PHXSectionData>?,
      sectionsBottomSheet: freezed == sectionsBottomSheet
          ? _self.sectionsBottomSheet
          : sectionsBottomSheet // ignore: cast_nullable_to_non_nullable
              as List<PHXSectionData>?,
      listOptions: freezed == listOptions
          ? _self.listOptions
          : listOptions // ignore: cast_nullable_to_non_nullable
              as List<PHXListOptionData>?,
      bottomActions: freezed == bottomActions
          ? _self.bottomActions
          : bottomActions // ignore: cast_nullable_to_non_nullable
              as List<PHXBottomActionData>?,
      table: freezed == table
          ? _self.table
          : table // ignore: cast_nullable_to_non_nullable
              as PHXTableData?,
      emptyState: freezed == emptyState
          ? _self.emptyState
          : emptyState // ignore: cast_nullable_to_non_nullable
              as PHXEmptyStateData?,
    ));
  }

  /// Create a copy of PHXScreenDataData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXAppBarDataCopyWith<$Res>? get appBar {
    if (_self.appBar == null) {
      return null;
    }

    return $PHXAppBarDataCopyWith<$Res>(_self.appBar!, (value) {
      return _then(_self.copyWith(appBar: value));
    });
  }

  /// Create a copy of PHXScreenDataData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXHeaderInfoDataCopyWith<$Res>? get headerInfo {
    if (_self.headerInfo == null) {
      return null;
    }

    return $PHXHeaderInfoDataCopyWith<$Res>(_self.headerInfo!, (value) {
      return _then(_self.copyWith(headerInfo: value));
    });
  }

  /// Create a copy of PHXScreenDataData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXTableDataCopyWith<$Res>? get table {
    if (_self.table == null) {
      return null;
    }

    return $PHXTableDataCopyWith<$Res>(_self.table!, (value) {
      return _then(_self.copyWith(table: value));
    });
  }

  /// Create a copy of PHXScreenDataData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXEmptyStateDataCopyWith<$Res>? get emptyState {
    if (_self.emptyState == null) {
      return null;
    }

    return $PHXEmptyStateDataCopyWith<$Res>(_self.emptyState!, (value) {
      return _then(_self.copyWith(emptyState: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PHXScreenDataData].
extension PHXScreenDataDataPatterns on PHXScreenDataData {
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
    TResult Function(_PHXScreenDataData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXScreenDataData() when $default != null:
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
    TResult Function(_PHXScreenDataData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXScreenDataData():
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
    TResult? Function(_PHXScreenDataData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXScreenDataData() when $default != null:
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
            @JsonKey(name: 'app_bar') PHXAppBarData? appBar,
            @JsonKey(name: 'header_info') PHXHeaderInfoData? headerInfo,
            @JsonKey(name: 'tabs') List<PHXTabData>? tabs,
            @JsonKey(name: 'sections') List<PHXSectionData>? sections,
            @JsonKey(name: 'sections_bottom_sheet')
            List<PHXSectionData>? sectionsBottomSheet,
            @JsonKey(name: 'list_options') List<PHXListOptionData>? listOptions,
            @JsonKey(name: 'bottom_actions')
            List<PHXBottomActionData>? bottomActions,
            @JsonKey(name: 'table') PHXTableData? table,
            @JsonKey(name: 'empty_state') PHXEmptyStateData? emptyState)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXScreenDataData() when $default != null:
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
            @JsonKey(name: 'app_bar') PHXAppBarData? appBar,
            @JsonKey(name: 'header_info') PHXHeaderInfoData? headerInfo,
            @JsonKey(name: 'tabs') List<PHXTabData>? tabs,
            @JsonKey(name: 'sections') List<PHXSectionData>? sections,
            @JsonKey(name: 'sections_bottom_sheet')
            List<PHXSectionData>? sectionsBottomSheet,
            @JsonKey(name: 'list_options') List<PHXListOptionData>? listOptions,
            @JsonKey(name: 'bottom_actions')
            List<PHXBottomActionData>? bottomActions,
            @JsonKey(name: 'table') PHXTableData? table,
            @JsonKey(name: 'empty_state') PHXEmptyStateData? emptyState)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXScreenDataData():
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
            @JsonKey(name: 'app_bar') PHXAppBarData? appBar,
            @JsonKey(name: 'header_info') PHXHeaderInfoData? headerInfo,
            @JsonKey(name: 'tabs') List<PHXTabData>? tabs,
            @JsonKey(name: 'sections') List<PHXSectionData>? sections,
            @JsonKey(name: 'sections_bottom_sheet')
            List<PHXSectionData>? sectionsBottomSheet,
            @JsonKey(name: 'list_options') List<PHXListOptionData>? listOptions,
            @JsonKey(name: 'bottom_actions')
            List<PHXBottomActionData>? bottomActions,
            @JsonKey(name: 'table') PHXTableData? table,
            @JsonKey(name: 'empty_state') PHXEmptyStateData? emptyState)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXScreenDataData() when $default != null:
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

@JsonSerializable(explicitToJson: true)
class _PHXScreenDataData implements PHXScreenDataData {
  const _PHXScreenDataData(
      {@JsonKey(name: 'app_bar') this.appBar,
      @JsonKey(name: 'header_info') this.headerInfo,
      @JsonKey(name: 'tabs') final List<PHXTabData>? tabs,
      @JsonKey(name: 'sections') final List<PHXSectionData>? sections,
      @JsonKey(name: 'sections_bottom_sheet')
      final List<PHXSectionData>? sectionsBottomSheet,
      @JsonKey(name: 'list_options') final List<PHXListOptionData>? listOptions,
      @JsonKey(name: 'bottom_actions')
      final List<PHXBottomActionData>? bottomActions,
      @JsonKey(name: 'table') this.table,
      @JsonKey(name: 'empty_state') this.emptyState})
      : _tabs = tabs,
        _sections = sections,
        _sectionsBottomSheet = sectionsBottomSheet,
        _listOptions = listOptions,
        _bottomActions = bottomActions;
  factory _PHXScreenDataData.fromJson(Map<String, dynamic> json) =>
      _$PHXScreenDataDataFromJson(json);

  @override
  @JsonKey(name: 'app_bar')
  final PHXAppBarData? appBar;
  @override
  @JsonKey(name: 'header_info')
  final PHXHeaderInfoData? headerInfo;
  final List<PHXTabData>? _tabs;
  @override
  @JsonKey(name: 'tabs')
  List<PHXTabData>? get tabs {
    final value = _tabs;
    if (value == null) return null;
    if (_tabs is EqualUnmodifiableListView) return _tabs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<PHXSectionData>? _sections;
  @override
  @JsonKey(name: 'sections')
  List<PHXSectionData>? get sections {
    final value = _sections;
    if (value == null) return null;
    if (_sections is EqualUnmodifiableListView) return _sections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<PHXSectionData>? _sectionsBottomSheet;
  @override
  @JsonKey(name: 'sections_bottom_sheet')
  List<PHXSectionData>? get sectionsBottomSheet {
    final value = _sectionsBottomSheet;
    if (value == null) return null;
    if (_sectionsBottomSheet is EqualUnmodifiableListView)
      return _sectionsBottomSheet;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<PHXListOptionData>? _listOptions;
  @override
  @JsonKey(name: 'list_options')
  List<PHXListOptionData>? get listOptions {
    final value = _listOptions;
    if (value == null) return null;
    if (_listOptions is EqualUnmodifiableListView) return _listOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<PHXBottomActionData>? _bottomActions;
  @override
  @JsonKey(name: 'bottom_actions')
  List<PHXBottomActionData>? get bottomActions {
    final value = _bottomActions;
    if (value == null) return null;
    if (_bottomActions is EqualUnmodifiableListView) return _bottomActions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'table')
  final PHXTableData? table;
  @override
  @JsonKey(name: 'empty_state')
  final PHXEmptyStateData? emptyState;

  /// Create a copy of PHXScreenDataData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXScreenDataDataCopyWith<_PHXScreenDataData> get copyWith =>
      __$PHXScreenDataDataCopyWithImpl<_PHXScreenDataData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PHXScreenDataDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXScreenDataData &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'PHXScreenDataData(appBar: $appBar, headerInfo: $headerInfo, tabs: $tabs, sections: $sections, sectionsBottomSheet: $sectionsBottomSheet, listOptions: $listOptions, bottomActions: $bottomActions, table: $table, emptyState: $emptyState)';
  }
}

/// @nodoc
abstract mixin class _$PHXScreenDataDataCopyWith<$Res>
    implements $PHXScreenDataDataCopyWith<$Res> {
  factory _$PHXScreenDataDataCopyWith(
          _PHXScreenDataData value, $Res Function(_PHXScreenDataData) _then) =
      __$PHXScreenDataDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'app_bar') PHXAppBarData? appBar,
      @JsonKey(name: 'header_info') PHXHeaderInfoData? headerInfo,
      @JsonKey(name: 'tabs') List<PHXTabData>? tabs,
      @JsonKey(name: 'sections') List<PHXSectionData>? sections,
      @JsonKey(name: 'sections_bottom_sheet')
      List<PHXSectionData>? sectionsBottomSheet,
      @JsonKey(name: 'list_options') List<PHXListOptionData>? listOptions,
      @JsonKey(name: 'bottom_actions') List<PHXBottomActionData>? bottomActions,
      @JsonKey(name: 'table') PHXTableData? table,
      @JsonKey(name: 'empty_state') PHXEmptyStateData? emptyState});

  @override
  $PHXAppBarDataCopyWith<$Res>? get appBar;
  @override
  $PHXHeaderInfoDataCopyWith<$Res>? get headerInfo;
  @override
  $PHXTableDataCopyWith<$Res>? get table;
  @override
  $PHXEmptyStateDataCopyWith<$Res>? get emptyState;
}

/// @nodoc
class __$PHXScreenDataDataCopyWithImpl<$Res>
    implements _$PHXScreenDataDataCopyWith<$Res> {
  __$PHXScreenDataDataCopyWithImpl(this._self, this._then);

  final _PHXScreenDataData _self;
  final $Res Function(_PHXScreenDataData) _then;

  /// Create a copy of PHXScreenDataData
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
    return _then(_PHXScreenDataData(
      appBar: freezed == appBar
          ? _self.appBar
          : appBar // ignore: cast_nullable_to_non_nullable
              as PHXAppBarData?,
      headerInfo: freezed == headerInfo
          ? _self.headerInfo
          : headerInfo // ignore: cast_nullable_to_non_nullable
              as PHXHeaderInfoData?,
      tabs: freezed == tabs
          ? _self._tabs
          : tabs // ignore: cast_nullable_to_non_nullable
              as List<PHXTabData>?,
      sections: freezed == sections
          ? _self._sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<PHXSectionData>?,
      sectionsBottomSheet: freezed == sectionsBottomSheet
          ? _self._sectionsBottomSheet
          : sectionsBottomSheet // ignore: cast_nullable_to_non_nullable
              as List<PHXSectionData>?,
      listOptions: freezed == listOptions
          ? _self._listOptions
          : listOptions // ignore: cast_nullable_to_non_nullable
              as List<PHXListOptionData>?,
      bottomActions: freezed == bottomActions
          ? _self._bottomActions
          : bottomActions // ignore: cast_nullable_to_non_nullable
              as List<PHXBottomActionData>?,
      table: freezed == table
          ? _self.table
          : table // ignore: cast_nullable_to_non_nullable
              as PHXTableData?,
      emptyState: freezed == emptyState
          ? _self.emptyState
          : emptyState // ignore: cast_nullable_to_non_nullable
              as PHXEmptyStateData?,
    ));
  }

  /// Create a copy of PHXScreenDataData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXAppBarDataCopyWith<$Res>? get appBar {
    if (_self.appBar == null) {
      return null;
    }

    return $PHXAppBarDataCopyWith<$Res>(_self.appBar!, (value) {
      return _then(_self.copyWith(appBar: value));
    });
  }

  /// Create a copy of PHXScreenDataData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXHeaderInfoDataCopyWith<$Res>? get headerInfo {
    if (_self.headerInfo == null) {
      return null;
    }

    return $PHXHeaderInfoDataCopyWith<$Res>(_self.headerInfo!, (value) {
      return _then(_self.copyWith(headerInfo: value));
    });
  }

  /// Create a copy of PHXScreenDataData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXTableDataCopyWith<$Res>? get table {
    if (_self.table == null) {
      return null;
    }

    return $PHXTableDataCopyWith<$Res>(_self.table!, (value) {
      return _then(_self.copyWith(table: value));
    });
  }

  /// Create a copy of PHXScreenDataData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXEmptyStateDataCopyWith<$Res>? get emptyState {
    if (_self.emptyState == null) {
      return null;
    }

    return $PHXEmptyStateDataCopyWith<$Res>(_self.emptyState!, (value) {
      return _then(_self.copyWith(emptyState: value));
    });
  }
}

/// @nodoc
mixin _$PHXHeaderInfoData {
  @JsonKey(name: 'title')
  String? get title;
  @JsonKey(name: 'content')
  String? get content;
  @JsonKey(name: 'avatar')
  String? get avatar;

  /// Create a copy of PHXHeaderInfoData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXHeaderInfoDataCopyWith<PHXHeaderInfoData> get copyWith =>
      _$PHXHeaderInfoDataCopyWithImpl<PHXHeaderInfoData>(
          this as PHXHeaderInfoData, _$identity);

  /// Serializes this PHXHeaderInfoData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXHeaderInfoData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, content, avatar);

  @override
  String toString() {
    return 'PHXHeaderInfoData(title: $title, content: $content, avatar: $avatar)';
  }
}

/// @nodoc
abstract mixin class $PHXHeaderInfoDataCopyWith<$Res> {
  factory $PHXHeaderInfoDataCopyWith(
          PHXHeaderInfoData value, $Res Function(PHXHeaderInfoData) _then) =
      _$PHXHeaderInfoDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'avatar') String? avatar});
}

/// @nodoc
class _$PHXHeaderInfoDataCopyWithImpl<$Res>
    implements $PHXHeaderInfoDataCopyWith<$Res> {
  _$PHXHeaderInfoDataCopyWithImpl(this._self, this._then);

  final PHXHeaderInfoData _self;
  final $Res Function(PHXHeaderInfoData) _then;

  /// Create a copy of PHXHeaderInfoData
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

/// Adds pattern-matching-related methods to [PHXHeaderInfoData].
extension PHXHeaderInfoDataPatterns on PHXHeaderInfoData {
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
    TResult Function(_PHXHeaderInfoData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXHeaderInfoData() when $default != null:
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
    TResult Function(_PHXHeaderInfoData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXHeaderInfoData():
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
    TResult? Function(_PHXHeaderInfoData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXHeaderInfoData() when $default != null:
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
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'avatar') String? avatar)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXHeaderInfoData() when $default != null:
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
    TResult Function(
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'avatar') String? avatar)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXHeaderInfoData():
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
    TResult? Function(
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'avatar') String? avatar)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXHeaderInfoData() when $default != null:
        return $default(_that.title, _that.content, _that.avatar);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PHXHeaderInfoData implements PHXHeaderInfoData {
  const _PHXHeaderInfoData(
      {@JsonKey(name: 'title') this.title,
      @JsonKey(name: 'content') this.content,
      @JsonKey(name: 'avatar') this.avatar});
  factory _PHXHeaderInfoData.fromJson(Map<String, dynamic> json) =>
      _$PHXHeaderInfoDataFromJson(json);

  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'content')
  final String? content;
  @override
  @JsonKey(name: 'avatar')
  final String? avatar;

  /// Create a copy of PHXHeaderInfoData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXHeaderInfoDataCopyWith<_PHXHeaderInfoData> get copyWith =>
      __$PHXHeaderInfoDataCopyWithImpl<_PHXHeaderInfoData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PHXHeaderInfoDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXHeaderInfoData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, content, avatar);

  @override
  String toString() {
    return 'PHXHeaderInfoData(title: $title, content: $content, avatar: $avatar)';
  }
}

/// @nodoc
abstract mixin class _$PHXHeaderInfoDataCopyWith<$Res>
    implements $PHXHeaderInfoDataCopyWith<$Res> {
  factory _$PHXHeaderInfoDataCopyWith(
          _PHXHeaderInfoData value, $Res Function(_PHXHeaderInfoData) _then) =
      __$PHXHeaderInfoDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'avatar') String? avatar});
}

/// @nodoc
class __$PHXHeaderInfoDataCopyWithImpl<$Res>
    implements _$PHXHeaderInfoDataCopyWith<$Res> {
  __$PHXHeaderInfoDataCopyWithImpl(this._self, this._then);

  final _PHXHeaderInfoData _self;
  final $Res Function(_PHXHeaderInfoData) _then;

  /// Create a copy of PHXHeaderInfoData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_PHXHeaderInfoData(
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
mixin _$PHXAppBarData {
  @JsonKey(name: 'title')
  String? get title;
  @JsonKey(name: 'sub_title')
  String? get subTitle;

  /// Create a copy of PHXAppBarData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXAppBarDataCopyWith<PHXAppBarData> get copyWith =>
      _$PHXAppBarDataCopyWithImpl<PHXAppBarData>(
          this as PHXAppBarData, _$identity);

  /// Serializes this PHXAppBarData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXAppBarData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, subTitle);

  @override
  String toString() {
    return 'PHXAppBarData(title: $title, subTitle: $subTitle)';
  }
}

/// @nodoc
abstract mixin class $PHXAppBarDataCopyWith<$Res> {
  factory $PHXAppBarDataCopyWith(
          PHXAppBarData value, $Res Function(PHXAppBarData) _then) =
      _$PHXAppBarDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'sub_title') String? subTitle});
}

/// @nodoc
class _$PHXAppBarDataCopyWithImpl<$Res>
    implements $PHXAppBarDataCopyWith<$Res> {
  _$PHXAppBarDataCopyWithImpl(this._self, this._then);

  final PHXAppBarData _self;
  final $Res Function(PHXAppBarData) _then;

  /// Create a copy of PHXAppBarData
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

/// Adds pattern-matching-related methods to [PHXAppBarData].
extension PHXAppBarDataPatterns on PHXAppBarData {
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
    TResult Function(_PHXAppBarData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXAppBarData() when $default != null:
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
    TResult Function(_PHXAppBarData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXAppBarData():
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
    TResult? Function(_PHXAppBarData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXAppBarData() when $default != null:
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
    TResult Function(@JsonKey(name: 'title') String? title,
            @JsonKey(name: 'sub_title') String? subTitle)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXAppBarData() when $default != null:
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
    TResult Function(@JsonKey(name: 'title') String? title,
            @JsonKey(name: 'sub_title') String? subTitle)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXAppBarData():
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
    TResult? Function(@JsonKey(name: 'title') String? title,
            @JsonKey(name: 'sub_title') String? subTitle)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXAppBarData() when $default != null:
        return $default(_that.title, _that.subTitle);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PHXAppBarData implements PHXAppBarData {
  const _PHXAppBarData(
      {@JsonKey(name: 'title') this.title,
      @JsonKey(name: 'sub_title') this.subTitle});
  factory _PHXAppBarData.fromJson(Map<String, dynamic> json) =>
      _$PHXAppBarDataFromJson(json);

  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'sub_title')
  final String? subTitle;

  /// Create a copy of PHXAppBarData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXAppBarDataCopyWith<_PHXAppBarData> get copyWith =>
      __$PHXAppBarDataCopyWithImpl<_PHXAppBarData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PHXAppBarDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXAppBarData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, subTitle);

  @override
  String toString() {
    return 'PHXAppBarData(title: $title, subTitle: $subTitle)';
  }
}

/// @nodoc
abstract mixin class _$PHXAppBarDataCopyWith<$Res>
    implements $PHXAppBarDataCopyWith<$Res> {
  factory _$PHXAppBarDataCopyWith(
          _PHXAppBarData value, $Res Function(_PHXAppBarData) _then) =
      __$PHXAppBarDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'sub_title') String? subTitle});
}

/// @nodoc
class __$PHXAppBarDataCopyWithImpl<$Res>
    implements _$PHXAppBarDataCopyWith<$Res> {
  __$PHXAppBarDataCopyWithImpl(this._self, this._then);

  final _PHXAppBarData _self;
  final $Res Function(_PHXAppBarData) _then;

  /// Create a copy of PHXAppBarData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? subTitle = freezed,
  }) {
    return _then(_PHXAppBarData(
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
mixin _$PHXTabData {
  @JsonKey(name: 'title')
  String? get title;
  @JsonKey(name: 'id')
  int? get id;
  @JsonKey(name: 'code')
  String? get code;
  @JsonKey(name: 'content')
  String? get content;
  @JsonKey(name: 'is_target')
  bool? get isTarget;
  @JsonKey(name: 'is_active')
  bool? get isActive;
  @JsonKey(name: 'count')
  int? get count;
  @JsonKey(name: 'extra')
  PHXExtraData? get extra;

  /// Create a copy of PHXTabData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXTabDataCopyWith<PHXTabData> get copyWith =>
      _$PHXTabDataCopyWithImpl<PHXTabData>(this as PHXTabData, _$identity);

  /// Serializes this PHXTabData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXTabData &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, id, code, content, isTarget, isActive, count, extra);

  @override
  String toString() {
    return 'PHXTabData(title: $title, id: $id, code: $code, content: $content, isTarget: $isTarget, isActive: $isActive, count: $count, extra: $extra)';
  }
}

/// @nodoc
abstract mixin class $PHXTabDataCopyWith<$Res> {
  factory $PHXTabDataCopyWith(
          PHXTabData value, $Res Function(PHXTabData) _then) =
      _$PHXTabDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'id') int? id,
      @JsonKey(name: 'code') String? code,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'is_target') bool? isTarget,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'count') int? count,
      @JsonKey(name: 'extra') PHXExtraData? extra});

  $PHXExtraDataCopyWith<$Res>? get extra;
}

/// @nodoc
class _$PHXTabDataCopyWithImpl<$Res> implements $PHXTabDataCopyWith<$Res> {
  _$PHXTabDataCopyWithImpl(this._self, this._then);

  final PHXTabData _self;
  final $Res Function(PHXTabData) _then;

  /// Create a copy of PHXTabData
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
              as PHXExtraData?,
    ));
  }

  /// Create a copy of PHXTabData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXExtraDataCopyWith<$Res>? get extra {
    if (_self.extra == null) {
      return null;
    }

    return $PHXExtraDataCopyWith<$Res>(_self.extra!, (value) {
      return _then(_self.copyWith(extra: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PHXTabData].
extension PHXTabDataPatterns on PHXTabData {
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
    TResult Function(_PHXTabData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXTabData() when $default != null:
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
    TResult Function(_PHXTabData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXTabData():
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
    TResult? Function(_PHXTabData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXTabData() when $default != null:
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
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'id') int? id,
            @JsonKey(name: 'code') String? code,
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'is_target') bool? isTarget,
            @JsonKey(name: 'is_active') bool? isActive,
            @JsonKey(name: 'count') int? count,
            @JsonKey(name: 'extra') PHXExtraData? extra)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXTabData() when $default != null:
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
    TResult Function(
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'id') int? id,
            @JsonKey(name: 'code') String? code,
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'is_target') bool? isTarget,
            @JsonKey(name: 'is_active') bool? isActive,
            @JsonKey(name: 'count') int? count,
            @JsonKey(name: 'extra') PHXExtraData? extra)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXTabData():
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
    TResult? Function(
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'id') int? id,
            @JsonKey(name: 'code') String? code,
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'is_target') bool? isTarget,
            @JsonKey(name: 'is_active') bool? isActive,
            @JsonKey(name: 'count') int? count,
            @JsonKey(name: 'extra') PHXExtraData? extra)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXTabData() when $default != null:
        return $default(_that.title, _that.id, _that.code, _that.content,
            _that.isTarget, _that.isActive, _that.count, _that.extra);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PHXTabData implements PHXTabData {
  const _PHXTabData(
      {@JsonKey(name: 'title') this.title,
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'code') this.code,
      @JsonKey(name: 'content') this.content,
      @JsonKey(name: 'is_target') this.isTarget,
      @JsonKey(name: 'is_active') this.isActive,
      @JsonKey(name: 'count') this.count,
      @JsonKey(name: 'extra') this.extra});
  factory _PHXTabData.fromJson(Map<String, dynamic> json) =>
      _$PHXTabDataFromJson(json);

  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'code')
  final String? code;
  @override
  @JsonKey(name: 'content')
  final String? content;
  @override
  @JsonKey(name: 'is_target')
  final bool? isTarget;
  @override
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @override
  @JsonKey(name: 'count')
  final int? count;
  @override
  @JsonKey(name: 'extra')
  final PHXExtraData? extra;

  /// Create a copy of PHXTabData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXTabDataCopyWith<_PHXTabData> get copyWith =>
      __$PHXTabDataCopyWithImpl<_PHXTabData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PHXTabDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXTabData &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, id, code, content, isTarget, isActive, count, extra);

  @override
  String toString() {
    return 'PHXTabData(title: $title, id: $id, code: $code, content: $content, isTarget: $isTarget, isActive: $isActive, count: $count, extra: $extra)';
  }
}

/// @nodoc
abstract mixin class _$PHXTabDataCopyWith<$Res>
    implements $PHXTabDataCopyWith<$Res> {
  factory _$PHXTabDataCopyWith(
          _PHXTabData value, $Res Function(_PHXTabData) _then) =
      __$PHXTabDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'id') int? id,
      @JsonKey(name: 'code') String? code,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'is_target') bool? isTarget,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'count') int? count,
      @JsonKey(name: 'extra') PHXExtraData? extra});

  @override
  $PHXExtraDataCopyWith<$Res>? get extra;
}

/// @nodoc
class __$PHXTabDataCopyWithImpl<$Res> implements _$PHXTabDataCopyWith<$Res> {
  __$PHXTabDataCopyWithImpl(this._self, this._then);

  final _PHXTabData _self;
  final $Res Function(_PHXTabData) _then;

  /// Create a copy of PHXTabData
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
    return _then(_PHXTabData(
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
              as PHXExtraData?,
    ));
  }

  /// Create a copy of PHXTabData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXExtraDataCopyWith<$Res>? get extra {
    if (_self.extra == null) {
      return null;
    }

    return $PHXExtraDataCopyWith<$Res>(_self.extra!, (value) {
      return _then(_self.copyWith(extra: value));
    });
  }
}

/// @nodoc
mixin _$PHXSectionData {
  @JsonKey(name: 'title')
  String? get title;
  @JsonKey(name: 'heading')
  String? get heading;
  @JsonKey(name: 'icon_url')
  String? get iconUrl;
  @JsonKey(name: 'bottom_sheet')
  List<PHXSectionData>? get bottomSheet;
  @JsonKey(name: 'items')
  List<PHXSectionItemData>? get items;
  @JsonKey(name: 'extra')
  PHXExtraData? get extra;

  /// Create a copy of PHXSectionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXSectionDataCopyWith<PHXSectionData> get copyWith =>
      _$PHXSectionDataCopyWithImpl<PHXSectionData>(
          this as PHXSectionData, _$identity);

  /// Serializes this PHXSectionData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXSectionData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.heading, heading) || other.heading == heading) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            const DeepCollectionEquality()
                .equals(other.bottomSheet, bottomSheet) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.extra, extra) || other.extra == extra));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'PHXSectionData(title: $title, heading: $heading, iconUrl: $iconUrl, bottomSheet: $bottomSheet, items: $items, extra: $extra)';
  }
}

/// @nodoc
abstract mixin class $PHXSectionDataCopyWith<$Res> {
  factory $PHXSectionDataCopyWith(
          PHXSectionData value, $Res Function(PHXSectionData) _then) =
      _$PHXSectionDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'heading') String? heading,
      @JsonKey(name: 'icon_url') String? iconUrl,
      @JsonKey(name: 'bottom_sheet') List<PHXSectionData>? bottomSheet,
      @JsonKey(name: 'items') List<PHXSectionItemData>? items,
      @JsonKey(name: 'extra') PHXExtraData? extra});

  $PHXExtraDataCopyWith<$Res>? get extra;
}

/// @nodoc
class _$PHXSectionDataCopyWithImpl<$Res>
    implements $PHXSectionDataCopyWith<$Res> {
  _$PHXSectionDataCopyWithImpl(this._self, this._then);

  final PHXSectionData _self;
  final $Res Function(PHXSectionData) _then;

  /// Create a copy of PHXSectionData
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
              as List<PHXSectionData>?,
      items: freezed == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PHXSectionItemData>?,
      extra: freezed == extra
          ? _self.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as PHXExtraData?,
    ));
  }

  /// Create a copy of PHXSectionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXExtraDataCopyWith<$Res>? get extra {
    if (_self.extra == null) {
      return null;
    }

    return $PHXExtraDataCopyWith<$Res>(_self.extra!, (value) {
      return _then(_self.copyWith(extra: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PHXSectionData].
extension PHXSectionDataPatterns on PHXSectionData {
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
    TResult Function(_PHXSectionData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXSectionData() when $default != null:
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
    TResult Function(_PHXSectionData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionData():
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
    TResult? Function(_PHXSectionData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionData() when $default != null:
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
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'heading') String? heading,
            @JsonKey(name: 'icon_url') String? iconUrl,
            @JsonKey(name: 'bottom_sheet') List<PHXSectionData>? bottomSheet,
            @JsonKey(name: 'items') List<PHXSectionItemData>? items,
            @JsonKey(name: 'extra') PHXExtraData? extra)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXSectionData() when $default != null:
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
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'heading') String? heading,
            @JsonKey(name: 'icon_url') String? iconUrl,
            @JsonKey(name: 'bottom_sheet') List<PHXSectionData>? bottomSheet,
            @JsonKey(name: 'items') List<PHXSectionItemData>? items,
            @JsonKey(name: 'extra') PHXExtraData? extra)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionData():
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
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'heading') String? heading,
            @JsonKey(name: 'icon_url') String? iconUrl,
            @JsonKey(name: 'bottom_sheet') List<PHXSectionData>? bottomSheet,
            @JsonKey(name: 'items') List<PHXSectionItemData>? items,
            @JsonKey(name: 'extra') PHXExtraData? extra)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionData() when $default != null:
        return $default(_that.title, _that.heading, _that.iconUrl,
            _that.bottomSheet, _that.items, _that.extra);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _PHXSectionData implements PHXSectionData {
  const _PHXSectionData(
      {@JsonKey(name: 'title') this.title,
      @JsonKey(name: 'heading') this.heading,
      @JsonKey(name: 'icon_url') this.iconUrl,
      @JsonKey(name: 'bottom_sheet') final List<PHXSectionData>? bottomSheet,
      @JsonKey(name: 'items') final List<PHXSectionItemData>? items,
      @JsonKey(name: 'extra') this.extra})
      : _bottomSheet = bottomSheet,
        _items = items;
  factory _PHXSectionData.fromJson(Map<String, dynamic> json) =>
      _$PHXSectionDataFromJson(json);

  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'heading')
  final String? heading;
  @override
  @JsonKey(name: 'icon_url')
  final String? iconUrl;
  final List<PHXSectionData>? _bottomSheet;
  @override
  @JsonKey(name: 'bottom_sheet')
  List<PHXSectionData>? get bottomSheet {
    final value = _bottomSheet;
    if (value == null) return null;
    if (_bottomSheet is EqualUnmodifiableListView) return _bottomSheet;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<PHXSectionItemData>? _items;
  @override
  @JsonKey(name: 'items')
  List<PHXSectionItemData>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'extra')
  final PHXExtraData? extra;

  /// Create a copy of PHXSectionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXSectionDataCopyWith<_PHXSectionData> get copyWith =>
      __$PHXSectionDataCopyWithImpl<_PHXSectionData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PHXSectionDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXSectionData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.heading, heading) || other.heading == heading) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            const DeepCollectionEquality()
                .equals(other._bottomSheet, _bottomSheet) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.extra, extra) || other.extra == extra));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'PHXSectionData(title: $title, heading: $heading, iconUrl: $iconUrl, bottomSheet: $bottomSheet, items: $items, extra: $extra)';
  }
}

/// @nodoc
abstract mixin class _$PHXSectionDataCopyWith<$Res>
    implements $PHXSectionDataCopyWith<$Res> {
  factory _$PHXSectionDataCopyWith(
          _PHXSectionData value, $Res Function(_PHXSectionData) _then) =
      __$PHXSectionDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'heading') String? heading,
      @JsonKey(name: 'icon_url') String? iconUrl,
      @JsonKey(name: 'bottom_sheet') List<PHXSectionData>? bottomSheet,
      @JsonKey(name: 'items') List<PHXSectionItemData>? items,
      @JsonKey(name: 'extra') PHXExtraData? extra});

  @override
  $PHXExtraDataCopyWith<$Res>? get extra;
}

/// @nodoc
class __$PHXSectionDataCopyWithImpl<$Res>
    implements _$PHXSectionDataCopyWith<$Res> {
  __$PHXSectionDataCopyWithImpl(this._self, this._then);

  final _PHXSectionData _self;
  final $Res Function(_PHXSectionData) _then;

  /// Create a copy of PHXSectionData
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
    return _then(_PHXSectionData(
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
              as List<PHXSectionData>?,
      items: freezed == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PHXSectionItemData>?,
      extra: freezed == extra
          ? _self.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as PHXExtraData?,
    ));
  }

  /// Create a copy of PHXSectionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXExtraDataCopyWith<$Res>? get extra {
    if (_self.extra == null) {
      return null;
    }

    return $PHXExtraDataCopyWith<$Res>(_self.extra!, (value) {
      return _then(_self.copyWith(extra: value));
    });
  }
}

/// @nodoc
mixin _$PHXSectionItemData {
  @JsonKey(name: 'id', readValue: _readIdOrGroupId)
  int? get id;
  @JsonKey(name: 'title')
  String? get title;
  @JsonKey(name: 'content')
  String? get content;
  @JsonKey(name: 'sub_title')
  String? get subTitle;
  @JsonKey(name: 'description')
  List<String>? get description;
  @JsonKey(name: 'image_url', readValue: _readImageUrlOrIconUrl)
  String? get imageUrl;
  @JsonKey(name: 'is_next')
  bool? get isNext;
  @JsonKey(name: 'show_divider')
  bool? get showDivider;
  @JsonKey(name: 'has_avatar')
  bool? get hasAvatar;
  @JsonKey(name: 'details')
  List<PHXSectionItemDetailData>? get details;
  @JsonKey(name: 'badge')
  PHXSectionItemBadgeData? get badge;
  @JsonKey(name: 'bottom_info')
  PHXSectionItemBottomInfoData? get bottomInfo;
  @JsonKey(name: 'extra')
  PHXExtraData? get extra;
  @JsonKey(name: 'avatar_name')
  String? get avatarName;
  @JsonKey(name: 'avatar_subtitle')
  String? get avatarSubtitle;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @JsonKey(name: 'students')
  List<PHXStudentData>? get students;
  @JsonKey(name: 'student_id')
  int? get studentId;
  @JsonKey(name: 'red_dot')
  bool? get redDot;
  @JsonKey(name: 'uuid')
  String? get uuid;
  @JsonKey(name: 'multi_badge')
  List<PHXMultiBadgeData>? get multiBadge;
  @JsonKey(name: 'payload')
  PHXPayloadData? get payload;

  /// Create a copy of PHXSectionItemData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXSectionItemDataCopyWith<PHXSectionItemData> get copyWith =>
      _$PHXSectionItemDataCopyWithImpl<PHXSectionItemData>(
          this as PHXSectionItemData, _$identity);

  /// Serializes this PHXSectionItemData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXSectionItemData &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'PHXSectionItemData(id: $id, title: $title, content: $content, subTitle: $subTitle, description: $description, imageUrl: $imageUrl, isNext: $isNext, showDivider: $showDivider, hasAvatar: $hasAvatar, details: $details, badge: $badge, bottomInfo: $bottomInfo, extra: $extra, avatarName: $avatarName, avatarSubtitle: $avatarSubtitle, avatarUrl: $avatarUrl, students: $students, studentId: $studentId, redDot: $redDot, uuid: $uuid, multiBadge: $multiBadge, payload: $payload)';
  }
}

/// @nodoc
abstract mixin class $PHXSectionItemDataCopyWith<$Res> {
  factory $PHXSectionItemDataCopyWith(
          PHXSectionItemData value, $Res Function(PHXSectionItemData) _then) =
      _$PHXSectionItemDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', readValue: _readIdOrGroupId) int? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'sub_title') String? subTitle,
      @JsonKey(name: 'description') List<String>? description,
      @JsonKey(name: 'image_url', readValue: _readImageUrlOrIconUrl)
      String? imageUrl,
      @JsonKey(name: 'is_next') bool? isNext,
      @JsonKey(name: 'show_divider') bool? showDivider,
      @JsonKey(name: 'has_avatar') bool? hasAvatar,
      @JsonKey(name: 'details') List<PHXSectionItemDetailData>? details,
      @JsonKey(name: 'badge') PHXSectionItemBadgeData? badge,
      @JsonKey(name: 'bottom_info') PHXSectionItemBottomInfoData? bottomInfo,
      @JsonKey(name: 'extra') PHXExtraData? extra,
      @JsonKey(name: 'avatar_name') String? avatarName,
      @JsonKey(name: 'avatar_subtitle') String? avatarSubtitle,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'students') List<PHXStudentData>? students,
      @JsonKey(name: 'student_id') int? studentId,
      @JsonKey(name: 'red_dot') bool? redDot,
      @JsonKey(name: 'uuid') String? uuid,
      @JsonKey(name: 'multi_badge') List<PHXMultiBadgeData>? multiBadge,
      @JsonKey(name: 'payload') PHXPayloadData? payload});

  $PHXSectionItemBadgeDataCopyWith<$Res>? get badge;
  $PHXSectionItemBottomInfoDataCopyWith<$Res>? get bottomInfo;
  $PHXExtraDataCopyWith<$Res>? get extra;
  $PHXPayloadDataCopyWith<$Res>? get payload;
}

/// @nodoc
class _$PHXSectionItemDataCopyWithImpl<$Res>
    implements $PHXSectionItemDataCopyWith<$Res> {
  _$PHXSectionItemDataCopyWithImpl(this._self, this._then);

  final PHXSectionItemData _self;
  final $Res Function(PHXSectionItemData) _then;

  /// Create a copy of PHXSectionItemData
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
              as List<PHXSectionItemDetailData>?,
      badge: freezed == badge
          ? _self.badge
          : badge // ignore: cast_nullable_to_non_nullable
              as PHXSectionItemBadgeData?,
      bottomInfo: freezed == bottomInfo
          ? _self.bottomInfo
          : bottomInfo // ignore: cast_nullable_to_non_nullable
              as PHXSectionItemBottomInfoData?,
      extra: freezed == extra
          ? _self.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as PHXExtraData?,
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
              as List<PHXStudentData>?,
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
              as List<PHXMultiBadgeData>?,
      payload: freezed == payload
          ? _self.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as PHXPayloadData?,
    ));
  }

  /// Create a copy of PHXSectionItemData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXSectionItemBadgeDataCopyWith<$Res>? get badge {
    if (_self.badge == null) {
      return null;
    }

    return $PHXSectionItemBadgeDataCopyWith<$Res>(_self.badge!, (value) {
      return _then(_self.copyWith(badge: value));
    });
  }

  /// Create a copy of PHXSectionItemData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXSectionItemBottomInfoDataCopyWith<$Res>? get bottomInfo {
    if (_self.bottomInfo == null) {
      return null;
    }

    return $PHXSectionItemBottomInfoDataCopyWith<$Res>(_self.bottomInfo!,
        (value) {
      return _then(_self.copyWith(bottomInfo: value));
    });
  }

  /// Create a copy of PHXSectionItemData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXExtraDataCopyWith<$Res>? get extra {
    if (_self.extra == null) {
      return null;
    }

    return $PHXExtraDataCopyWith<$Res>(_self.extra!, (value) {
      return _then(_self.copyWith(extra: value));
    });
  }

  /// Create a copy of PHXSectionItemData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXPayloadDataCopyWith<$Res>? get payload {
    if (_self.payload == null) {
      return null;
    }

    return $PHXPayloadDataCopyWith<$Res>(_self.payload!, (value) {
      return _then(_self.copyWith(payload: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PHXSectionItemData].
extension PHXSectionItemDataPatterns on PHXSectionItemData {
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
    TResult Function(_PHXSectionItemData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemData() when $default != null:
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
    TResult Function(_PHXSectionItemData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemData():
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
    TResult? Function(_PHXSectionItemData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemData() when $default != null:
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
            @JsonKey(name: 'id', readValue: _readIdOrGroupId) int? id,
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'sub_title') String? subTitle,
            @JsonKey(name: 'description') List<String>? description,
            @JsonKey(name: 'image_url', readValue: _readImageUrlOrIconUrl)
            String? imageUrl,
            @JsonKey(name: 'is_next') bool? isNext,
            @JsonKey(name: 'show_divider') bool? showDivider,
            @JsonKey(name: 'has_avatar') bool? hasAvatar,
            @JsonKey(name: 'details') List<PHXSectionItemDetailData>? details,
            @JsonKey(name: 'badge') PHXSectionItemBadgeData? badge,
            @JsonKey(name: 'bottom_info')
            PHXSectionItemBottomInfoData? bottomInfo,
            @JsonKey(name: 'extra') PHXExtraData? extra,
            @JsonKey(name: 'avatar_name') String? avatarName,
            @JsonKey(name: 'avatar_subtitle') String? avatarSubtitle,
            @JsonKey(name: 'avatar_url') String? avatarUrl,
            @JsonKey(name: 'students') List<PHXStudentData>? students,
            @JsonKey(name: 'student_id') int? studentId,
            @JsonKey(name: 'red_dot') bool? redDot,
            @JsonKey(name: 'uuid') String? uuid,
            @JsonKey(name: 'multi_badge') List<PHXMultiBadgeData>? multiBadge,
            @JsonKey(name: 'payload') PHXPayloadData? payload)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemData() when $default != null:
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
            @JsonKey(name: 'id', readValue: _readIdOrGroupId) int? id,
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'sub_title') String? subTitle,
            @JsonKey(name: 'description') List<String>? description,
            @JsonKey(name: 'image_url', readValue: _readImageUrlOrIconUrl)
            String? imageUrl,
            @JsonKey(name: 'is_next') bool? isNext,
            @JsonKey(name: 'show_divider') bool? showDivider,
            @JsonKey(name: 'has_avatar') bool? hasAvatar,
            @JsonKey(name: 'details') List<PHXSectionItemDetailData>? details,
            @JsonKey(name: 'badge') PHXSectionItemBadgeData? badge,
            @JsonKey(name: 'bottom_info')
            PHXSectionItemBottomInfoData? bottomInfo,
            @JsonKey(name: 'extra') PHXExtraData? extra,
            @JsonKey(name: 'avatar_name') String? avatarName,
            @JsonKey(name: 'avatar_subtitle') String? avatarSubtitle,
            @JsonKey(name: 'avatar_url') String? avatarUrl,
            @JsonKey(name: 'students') List<PHXStudentData>? students,
            @JsonKey(name: 'student_id') int? studentId,
            @JsonKey(name: 'red_dot') bool? redDot,
            @JsonKey(name: 'uuid') String? uuid,
            @JsonKey(name: 'multi_badge') List<PHXMultiBadgeData>? multiBadge,
            @JsonKey(name: 'payload') PHXPayloadData? payload)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemData():
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
            @JsonKey(name: 'id', readValue: _readIdOrGroupId) int? id,
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'sub_title') String? subTitle,
            @JsonKey(name: 'description') List<String>? description,
            @JsonKey(name: 'image_url', readValue: _readImageUrlOrIconUrl)
            String? imageUrl,
            @JsonKey(name: 'is_next') bool? isNext,
            @JsonKey(name: 'show_divider') bool? showDivider,
            @JsonKey(name: 'has_avatar') bool? hasAvatar,
            @JsonKey(name: 'details') List<PHXSectionItemDetailData>? details,
            @JsonKey(name: 'badge') PHXSectionItemBadgeData? badge,
            @JsonKey(name: 'bottom_info')
            PHXSectionItemBottomInfoData? bottomInfo,
            @JsonKey(name: 'extra') PHXExtraData? extra,
            @JsonKey(name: 'avatar_name') String? avatarName,
            @JsonKey(name: 'avatar_subtitle') String? avatarSubtitle,
            @JsonKey(name: 'avatar_url') String? avatarUrl,
            @JsonKey(name: 'students') List<PHXStudentData>? students,
            @JsonKey(name: 'student_id') int? studentId,
            @JsonKey(name: 'red_dot') bool? redDot,
            @JsonKey(name: 'uuid') String? uuid,
            @JsonKey(name: 'multi_badge') List<PHXMultiBadgeData>? multiBadge,
            @JsonKey(name: 'payload') PHXPayloadData? payload)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemData() when $default != null:
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

@JsonSerializable(explicitToJson: true)
class _PHXSectionItemData implements PHXSectionItemData {
  const _PHXSectionItemData(
      {@JsonKey(name: 'id', readValue: _readIdOrGroupId) this.id,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'content') this.content,
      @JsonKey(name: 'sub_title') this.subTitle,
      @JsonKey(name: 'description') final List<String>? description,
      @JsonKey(name: 'image_url', readValue: _readImageUrlOrIconUrl)
      this.imageUrl,
      @JsonKey(name: 'is_next') this.isNext,
      @JsonKey(name: 'show_divider') this.showDivider,
      @JsonKey(name: 'has_avatar') this.hasAvatar,
      @JsonKey(name: 'details') final List<PHXSectionItemDetailData>? details,
      @JsonKey(name: 'badge') this.badge,
      @JsonKey(name: 'bottom_info') this.bottomInfo,
      @JsonKey(name: 'extra') this.extra,
      @JsonKey(name: 'avatar_name') this.avatarName,
      @JsonKey(name: 'avatar_subtitle') this.avatarSubtitle,
      @JsonKey(name: 'avatar_url') this.avatarUrl,
      @JsonKey(name: 'students') final List<PHXStudentData>? students,
      @JsonKey(name: 'student_id') this.studentId,
      @JsonKey(name: 'red_dot') this.redDot,
      @JsonKey(name: 'uuid') this.uuid,
      @JsonKey(name: 'multi_badge') final List<PHXMultiBadgeData>? multiBadge,
      @JsonKey(name: 'payload') this.payload})
      : _description = description,
        _details = details,
        _students = students,
        _multiBadge = multiBadge;
  factory _PHXSectionItemData.fromJson(Map<String, dynamic> json) =>
      _$PHXSectionItemDataFromJson(json);

  @override
  @JsonKey(name: 'id', readValue: _readIdOrGroupId)
  final int? id;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'content')
  final String? content;
  @override
  @JsonKey(name: 'sub_title')
  final String? subTitle;
  final List<String>? _description;
  @override
  @JsonKey(name: 'description')
  List<String>? get description {
    final value = _description;
    if (value == null) return null;
    if (_description is EqualUnmodifiableListView) return _description;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'image_url', readValue: _readImageUrlOrIconUrl)
  final String? imageUrl;
  @override
  @JsonKey(name: 'is_next')
  final bool? isNext;
  @override
  @JsonKey(name: 'show_divider')
  final bool? showDivider;
  @override
  @JsonKey(name: 'has_avatar')
  final bool? hasAvatar;
  final List<PHXSectionItemDetailData>? _details;
  @override
  @JsonKey(name: 'details')
  List<PHXSectionItemDetailData>? get details {
    final value = _details;
    if (value == null) return null;
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'badge')
  final PHXSectionItemBadgeData? badge;
  @override
  @JsonKey(name: 'bottom_info')
  final PHXSectionItemBottomInfoData? bottomInfo;
  @override
  @JsonKey(name: 'extra')
  final PHXExtraData? extra;
  @override
  @JsonKey(name: 'avatar_name')
  final String? avatarName;
  @override
  @JsonKey(name: 'avatar_subtitle')
  final String? avatarSubtitle;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  final List<PHXStudentData>? _students;
  @override
  @JsonKey(name: 'students')
  List<PHXStudentData>? get students {
    final value = _students;
    if (value == null) return null;
    if (_students is EqualUnmodifiableListView) return _students;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'student_id')
  final int? studentId;
  @override
  @JsonKey(name: 'red_dot')
  final bool? redDot;
  @override
  @JsonKey(name: 'uuid')
  final String? uuid;
  final List<PHXMultiBadgeData>? _multiBadge;
  @override
  @JsonKey(name: 'multi_badge')
  List<PHXMultiBadgeData>? get multiBadge {
    final value = _multiBadge;
    if (value == null) return null;
    if (_multiBadge is EqualUnmodifiableListView) return _multiBadge;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'payload')
  final PHXPayloadData? payload;

  /// Create a copy of PHXSectionItemData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXSectionItemDataCopyWith<_PHXSectionItemData> get copyWith =>
      __$PHXSectionItemDataCopyWithImpl<_PHXSectionItemData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PHXSectionItemDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXSectionItemData &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'PHXSectionItemData(id: $id, title: $title, content: $content, subTitle: $subTitle, description: $description, imageUrl: $imageUrl, isNext: $isNext, showDivider: $showDivider, hasAvatar: $hasAvatar, details: $details, badge: $badge, bottomInfo: $bottomInfo, extra: $extra, avatarName: $avatarName, avatarSubtitle: $avatarSubtitle, avatarUrl: $avatarUrl, students: $students, studentId: $studentId, redDot: $redDot, uuid: $uuid, multiBadge: $multiBadge, payload: $payload)';
  }
}

/// @nodoc
abstract mixin class _$PHXSectionItemDataCopyWith<$Res>
    implements $PHXSectionItemDataCopyWith<$Res> {
  factory _$PHXSectionItemDataCopyWith(
          _PHXSectionItemData value, $Res Function(_PHXSectionItemData) _then) =
      __$PHXSectionItemDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', readValue: _readIdOrGroupId) int? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'sub_title') String? subTitle,
      @JsonKey(name: 'description') List<String>? description,
      @JsonKey(name: 'image_url', readValue: _readImageUrlOrIconUrl)
      String? imageUrl,
      @JsonKey(name: 'is_next') bool? isNext,
      @JsonKey(name: 'show_divider') bool? showDivider,
      @JsonKey(name: 'has_avatar') bool? hasAvatar,
      @JsonKey(name: 'details') List<PHXSectionItemDetailData>? details,
      @JsonKey(name: 'badge') PHXSectionItemBadgeData? badge,
      @JsonKey(name: 'bottom_info') PHXSectionItemBottomInfoData? bottomInfo,
      @JsonKey(name: 'extra') PHXExtraData? extra,
      @JsonKey(name: 'avatar_name') String? avatarName,
      @JsonKey(name: 'avatar_subtitle') String? avatarSubtitle,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'students') List<PHXStudentData>? students,
      @JsonKey(name: 'student_id') int? studentId,
      @JsonKey(name: 'red_dot') bool? redDot,
      @JsonKey(name: 'uuid') String? uuid,
      @JsonKey(name: 'multi_badge') List<PHXMultiBadgeData>? multiBadge,
      @JsonKey(name: 'payload') PHXPayloadData? payload});

  @override
  $PHXSectionItemBadgeDataCopyWith<$Res>? get badge;
  @override
  $PHXSectionItemBottomInfoDataCopyWith<$Res>? get bottomInfo;
  @override
  $PHXExtraDataCopyWith<$Res>? get extra;
  @override
  $PHXPayloadDataCopyWith<$Res>? get payload;
}

/// @nodoc
class __$PHXSectionItemDataCopyWithImpl<$Res>
    implements _$PHXSectionItemDataCopyWith<$Res> {
  __$PHXSectionItemDataCopyWithImpl(this._self, this._then);

  final _PHXSectionItemData _self;
  final $Res Function(_PHXSectionItemData) _then;

  /// Create a copy of PHXSectionItemData
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
    return _then(_PHXSectionItemData(
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
              as List<PHXSectionItemDetailData>?,
      badge: freezed == badge
          ? _self.badge
          : badge // ignore: cast_nullable_to_non_nullable
              as PHXSectionItemBadgeData?,
      bottomInfo: freezed == bottomInfo
          ? _self.bottomInfo
          : bottomInfo // ignore: cast_nullable_to_non_nullable
              as PHXSectionItemBottomInfoData?,
      extra: freezed == extra
          ? _self.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as PHXExtraData?,
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
              as List<PHXStudentData>?,
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
              as List<PHXMultiBadgeData>?,
      payload: freezed == payload
          ? _self.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as PHXPayloadData?,
    ));
  }

  /// Create a copy of PHXSectionItemData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXSectionItemBadgeDataCopyWith<$Res>? get badge {
    if (_self.badge == null) {
      return null;
    }

    return $PHXSectionItemBadgeDataCopyWith<$Res>(_self.badge!, (value) {
      return _then(_self.copyWith(badge: value));
    });
  }

  /// Create a copy of PHXSectionItemData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXSectionItemBottomInfoDataCopyWith<$Res>? get bottomInfo {
    if (_self.bottomInfo == null) {
      return null;
    }

    return $PHXSectionItemBottomInfoDataCopyWith<$Res>(_self.bottomInfo!,
        (value) {
      return _then(_self.copyWith(bottomInfo: value));
    });
  }

  /// Create a copy of PHXSectionItemData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXExtraDataCopyWith<$Res>? get extra {
    if (_self.extra == null) {
      return null;
    }

    return $PHXExtraDataCopyWith<$Res>(_self.extra!, (value) {
      return _then(_self.copyWith(extra: value));
    });
  }

  /// Create a copy of PHXSectionItemData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXPayloadDataCopyWith<$Res>? get payload {
    if (_self.payload == null) {
      return null;
    }

    return $PHXPayloadDataCopyWith<$Res>(_self.payload!, (value) {
      return _then(_self.copyWith(payload: value));
    });
  }
}

/// @nodoc
mixin _$PHXPayloadData {
  @JsonKey(name: 'action')
  String? get action;
  @JsonKey(name: 'type')
  String? get type;
  @JsonKey(name: 'title')
  String? get title;
  @JsonKey(name: 'content')
  String? get content;
  @JsonKey(name: 'notification_id', readValue: _readString)
  String? get notificationId;
  @JsonKey(name: 'student_code')
  String? get studentCode;
  @JsonKey(name: 'attendance_lesson_id', readValue: _readString)
  String? get attendanceLessonId;
  @JsonKey(name: 'assign_id', readValue: _readString)
  String? get assignId;
  @JsonKey(name: 'subsystem')
  String? get subsystem;
  @JsonKey(name: 'status')
  String? get status;
  @JsonKey(name: 'event_type')
  String? get eventType;
  @JsonKey(name: 'classroom_name')
  String? get classroomName;
  @JsonKey(name: 'school_year_id', readValue: _readString)
  String? get schoolYearId;
  @JsonKey(name: 'borrow_ticket_state')
  String? get borrowTicketState;
  @JsonKey(name: 'id', readValue: _readString)
  String? get id;
  @JsonKey(name: 'student_id', readValue: _readString)
  String? get studentId;
  @JsonKey(name: 'quick_examination_id', readValue: _readString)
  String? get quickExaminationId;
  @JsonKey(name: 'order_id', readValue: _readString)
  String? get orderId;
  @JsonKey(name: 'feedback_id', readValue: _readString)
  String? get feedbackId;
  @JsonKey(name: 'type_detail')
  String? get typeDetail;
  @JsonKey(name: 'inapp_noti_id', readValue: _readString)
  String? get inappNotiId;
  @JsonKey(name: 'hasShareMessage')
  String? get hasShareMessage;
  @JsonKey(name: 'month_id', readValue: _readString)
  String? get monthId;
  @JsonKey(name: 'school_term_id', readValue: _readString)
  String? get schoolTermId;
  @JsonKey(name: 'code')
  String? get code;
  @JsonKey(name: 'request_id', readValue: _readString)
  String? get requestId;
  @JsonKey(name: 'school_id', readValue: _readString)
  String? get schoolId;
  @JsonKey(name: 'is_cancel_request', readValue: _readString)
  String? get isCancelRequest;

  /// Create a copy of PHXPayloadData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXPayloadDataCopyWith<PHXPayloadData> get copyWith =>
      _$PHXPayloadDataCopyWithImpl<PHXPayloadData>(
          this as PHXPayloadData, _$identity);

  /// Serializes this PHXPayloadData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXPayloadData &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'PHXPayloadData(action: $action, type: $type, title: $title, content: $content, notificationId: $notificationId, studentCode: $studentCode, attendanceLessonId: $attendanceLessonId, assignId: $assignId, subsystem: $subsystem, status: $status, eventType: $eventType, classroomName: $classroomName, schoolYearId: $schoolYearId, borrowTicketState: $borrowTicketState, id: $id, studentId: $studentId, quickExaminationId: $quickExaminationId, orderId: $orderId, feedbackId: $feedbackId, typeDetail: $typeDetail, inappNotiId: $inappNotiId, hasShareMessage: $hasShareMessage, monthId: $monthId, schoolTermId: $schoolTermId, code: $code, requestId: $requestId, schoolId: $schoolId, isCancelRequest: $isCancelRequest)';
  }
}

/// @nodoc
abstract mixin class $PHXPayloadDataCopyWith<$Res> {
  factory $PHXPayloadDataCopyWith(
          PHXPayloadData value, $Res Function(PHXPayloadData) _then) =
      _$PHXPayloadDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'action') String? action,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'notification_id', readValue: _readString)
      String? notificationId,
      @JsonKey(name: 'student_code') String? studentCode,
      @JsonKey(name: 'attendance_lesson_id', readValue: _readString)
      String? attendanceLessonId,
      @JsonKey(name: 'assign_id', readValue: _readString) String? assignId,
      @JsonKey(name: 'subsystem') String? subsystem,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'event_type') String? eventType,
      @JsonKey(name: 'classroom_name') String? classroomName,
      @JsonKey(name: 'school_year_id', readValue: _readString)
      String? schoolYearId,
      @JsonKey(name: 'borrow_ticket_state') String? borrowTicketState,
      @JsonKey(name: 'id', readValue: _readString) String? id,
      @JsonKey(name: 'student_id', readValue: _readString) String? studentId,
      @JsonKey(name: 'quick_examination_id', readValue: _readString)
      String? quickExaminationId,
      @JsonKey(name: 'order_id', readValue: _readString) String? orderId,
      @JsonKey(name: 'feedback_id', readValue: _readString) String? feedbackId,
      @JsonKey(name: 'type_detail') String? typeDetail,
      @JsonKey(name: 'inapp_noti_id', readValue: _readString)
      String? inappNotiId,
      @JsonKey(name: 'hasShareMessage') String? hasShareMessage,
      @JsonKey(name: 'month_id', readValue: _readString) String? monthId,
      @JsonKey(name: 'school_term_id', readValue: _readString)
      String? schoolTermId,
      @JsonKey(name: 'code') String? code,
      @JsonKey(name: 'request_id', readValue: _readString) String? requestId,
      @JsonKey(name: 'school_id', readValue: _readString) String? schoolId,
      @JsonKey(name: 'is_cancel_request', readValue: _readString)
      String? isCancelRequest});
}

/// @nodoc
class _$PHXPayloadDataCopyWithImpl<$Res>
    implements $PHXPayloadDataCopyWith<$Res> {
  _$PHXPayloadDataCopyWithImpl(this._self, this._then);

  final PHXPayloadData _self;
  final $Res Function(PHXPayloadData) _then;

  /// Create a copy of PHXPayloadData
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

/// Adds pattern-matching-related methods to [PHXPayloadData].
extension PHXPayloadDataPatterns on PHXPayloadData {
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
    TResult Function(_PHXPayloadData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXPayloadData() when $default != null:
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
    TResult Function(_PHXPayloadData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXPayloadData():
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
    TResult? Function(_PHXPayloadData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXPayloadData() when $default != null:
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
            @JsonKey(name: 'action') String? action,
            @JsonKey(name: 'type') String? type,
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'notification_id', readValue: _readString)
            String? notificationId,
            @JsonKey(name: 'student_code') String? studentCode,
            @JsonKey(name: 'attendance_lesson_id', readValue: _readString)
            String? attendanceLessonId,
            @JsonKey(name: 'assign_id', readValue: _readString)
            String? assignId,
            @JsonKey(name: 'subsystem') String? subsystem,
            @JsonKey(name: 'status') String? status,
            @JsonKey(name: 'event_type') String? eventType,
            @JsonKey(name: 'classroom_name') String? classroomName,
            @JsonKey(name: 'school_year_id', readValue: _readString)
            String? schoolYearId,
            @JsonKey(name: 'borrow_ticket_state') String? borrowTicketState,
            @JsonKey(name: 'id', readValue: _readString) String? id,
            @JsonKey(name: 'student_id', readValue: _readString)
            String? studentId,
            @JsonKey(name: 'quick_examination_id', readValue: _readString)
            String? quickExaminationId,
            @JsonKey(name: 'order_id', readValue: _readString) String? orderId,
            @JsonKey(name: 'feedback_id', readValue: _readString)
            String? feedbackId,
            @JsonKey(name: 'type_detail') String? typeDetail,
            @JsonKey(name: 'inapp_noti_id', readValue: _readString)
            String? inappNotiId,
            @JsonKey(name: 'hasShareMessage') String? hasShareMessage,
            @JsonKey(name: 'month_id', readValue: _readString) String? monthId,
            @JsonKey(name: 'school_term_id', readValue: _readString)
            String? schoolTermId,
            @JsonKey(name: 'code') String? code,
            @JsonKey(name: 'request_id', readValue: _readString)
            String? requestId,
            @JsonKey(name: 'school_id', readValue: _readString)
            String? schoolId,
            @JsonKey(name: 'is_cancel_request', readValue: _readString)
            String? isCancelRequest)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXPayloadData() when $default != null:
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
            @JsonKey(name: 'action') String? action,
            @JsonKey(name: 'type') String? type,
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'notification_id', readValue: _readString)
            String? notificationId,
            @JsonKey(name: 'student_code') String? studentCode,
            @JsonKey(name: 'attendance_lesson_id', readValue: _readString)
            String? attendanceLessonId,
            @JsonKey(name: 'assign_id', readValue: _readString)
            String? assignId,
            @JsonKey(name: 'subsystem') String? subsystem,
            @JsonKey(name: 'status') String? status,
            @JsonKey(name: 'event_type') String? eventType,
            @JsonKey(name: 'classroom_name') String? classroomName,
            @JsonKey(name: 'school_year_id', readValue: _readString)
            String? schoolYearId,
            @JsonKey(name: 'borrow_ticket_state') String? borrowTicketState,
            @JsonKey(name: 'id', readValue: _readString) String? id,
            @JsonKey(name: 'student_id', readValue: _readString)
            String? studentId,
            @JsonKey(name: 'quick_examination_id', readValue: _readString)
            String? quickExaminationId,
            @JsonKey(name: 'order_id', readValue: _readString) String? orderId,
            @JsonKey(name: 'feedback_id', readValue: _readString)
            String? feedbackId,
            @JsonKey(name: 'type_detail') String? typeDetail,
            @JsonKey(name: 'inapp_noti_id', readValue: _readString)
            String? inappNotiId,
            @JsonKey(name: 'hasShareMessage') String? hasShareMessage,
            @JsonKey(name: 'month_id', readValue: _readString) String? monthId,
            @JsonKey(name: 'school_term_id', readValue: _readString)
            String? schoolTermId,
            @JsonKey(name: 'code') String? code,
            @JsonKey(name: 'request_id', readValue: _readString)
            String? requestId,
            @JsonKey(name: 'school_id', readValue: _readString)
            String? schoolId,
            @JsonKey(name: 'is_cancel_request', readValue: _readString)
            String? isCancelRequest)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXPayloadData():
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
            @JsonKey(name: 'action') String? action,
            @JsonKey(name: 'type') String? type,
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'notification_id', readValue: _readString)
            String? notificationId,
            @JsonKey(name: 'student_code') String? studentCode,
            @JsonKey(name: 'attendance_lesson_id', readValue: _readString)
            String? attendanceLessonId,
            @JsonKey(name: 'assign_id', readValue: _readString)
            String? assignId,
            @JsonKey(name: 'subsystem') String? subsystem,
            @JsonKey(name: 'status') String? status,
            @JsonKey(name: 'event_type') String? eventType,
            @JsonKey(name: 'classroom_name') String? classroomName,
            @JsonKey(name: 'school_year_id', readValue: _readString)
            String? schoolYearId,
            @JsonKey(name: 'borrow_ticket_state') String? borrowTicketState,
            @JsonKey(name: 'id', readValue: _readString) String? id,
            @JsonKey(name: 'student_id', readValue: _readString)
            String? studentId,
            @JsonKey(name: 'quick_examination_id', readValue: _readString)
            String? quickExaminationId,
            @JsonKey(name: 'order_id', readValue: _readString) String? orderId,
            @JsonKey(name: 'feedback_id', readValue: _readString)
            String? feedbackId,
            @JsonKey(name: 'type_detail') String? typeDetail,
            @JsonKey(name: 'inapp_noti_id', readValue: _readString)
            String? inappNotiId,
            @JsonKey(name: 'hasShareMessage') String? hasShareMessage,
            @JsonKey(name: 'month_id', readValue: _readString) String? monthId,
            @JsonKey(name: 'school_term_id', readValue: _readString)
            String? schoolTermId,
            @JsonKey(name: 'code') String? code,
            @JsonKey(name: 'request_id', readValue: _readString)
            String? requestId,
            @JsonKey(name: 'school_id', readValue: _readString)
            String? schoolId,
            @JsonKey(name: 'is_cancel_request', readValue: _readString)
            String? isCancelRequest)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXPayloadData() when $default != null:
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

@JsonSerializable(explicitToJson: true)
class _PHXPayloadData implements PHXPayloadData {
  const _PHXPayloadData(
      {@JsonKey(name: 'action') this.action,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'content') this.content,
      @JsonKey(name: 'notification_id', readValue: _readString)
      this.notificationId,
      @JsonKey(name: 'student_code') this.studentCode,
      @JsonKey(name: 'attendance_lesson_id', readValue: _readString)
      this.attendanceLessonId,
      @JsonKey(name: 'assign_id', readValue: _readString) this.assignId,
      @JsonKey(name: 'subsystem') this.subsystem,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'event_type') this.eventType,
      @JsonKey(name: 'classroom_name') this.classroomName,
      @JsonKey(name: 'school_year_id', readValue: _readString)
      this.schoolYearId,
      @JsonKey(name: 'borrow_ticket_state') this.borrowTicketState,
      @JsonKey(name: 'id', readValue: _readString) this.id,
      @JsonKey(name: 'student_id', readValue: _readString) this.studentId,
      @JsonKey(name: 'quick_examination_id', readValue: _readString)
      this.quickExaminationId,
      @JsonKey(name: 'order_id', readValue: _readString) this.orderId,
      @JsonKey(name: 'feedback_id', readValue: _readString) this.feedbackId,
      @JsonKey(name: 'type_detail') this.typeDetail,
      @JsonKey(name: 'inapp_noti_id', readValue: _readString) this.inappNotiId,
      @JsonKey(name: 'hasShareMessage') this.hasShareMessage,
      @JsonKey(name: 'month_id', readValue: _readString) this.monthId,
      @JsonKey(name: 'school_term_id', readValue: _readString)
      this.schoolTermId,
      @JsonKey(name: 'code') this.code,
      @JsonKey(name: 'request_id', readValue: _readString) this.requestId,
      @JsonKey(name: 'school_id', readValue: _readString) this.schoolId,
      @JsonKey(name: 'is_cancel_request', readValue: _readString)
      this.isCancelRequest});
  factory _PHXPayloadData.fromJson(Map<String, dynamic> json) =>
      _$PHXPayloadDataFromJson(json);

  @override
  @JsonKey(name: 'action')
  final String? action;
  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'content')
  final String? content;
  @override
  @JsonKey(name: 'notification_id', readValue: _readString)
  final String? notificationId;
  @override
  @JsonKey(name: 'student_code')
  final String? studentCode;
  @override
  @JsonKey(name: 'attendance_lesson_id', readValue: _readString)
  final String? attendanceLessonId;
  @override
  @JsonKey(name: 'assign_id', readValue: _readString)
  final String? assignId;
  @override
  @JsonKey(name: 'subsystem')
  final String? subsystem;
  @override
  @JsonKey(name: 'status')
  final String? status;
  @override
  @JsonKey(name: 'event_type')
  final String? eventType;
  @override
  @JsonKey(name: 'classroom_name')
  final String? classroomName;
  @override
  @JsonKey(name: 'school_year_id', readValue: _readString)
  final String? schoolYearId;
  @override
  @JsonKey(name: 'borrow_ticket_state')
  final String? borrowTicketState;
  @override
  @JsonKey(name: 'id', readValue: _readString)
  final String? id;
  @override
  @JsonKey(name: 'student_id', readValue: _readString)
  final String? studentId;
  @override
  @JsonKey(name: 'quick_examination_id', readValue: _readString)
  final String? quickExaminationId;
  @override
  @JsonKey(name: 'order_id', readValue: _readString)
  final String? orderId;
  @override
  @JsonKey(name: 'feedback_id', readValue: _readString)
  final String? feedbackId;
  @override
  @JsonKey(name: 'type_detail')
  final String? typeDetail;
  @override
  @JsonKey(name: 'inapp_noti_id', readValue: _readString)
  final String? inappNotiId;
  @override
  @JsonKey(name: 'hasShareMessage')
  final String? hasShareMessage;
  @override
  @JsonKey(name: 'month_id', readValue: _readString)
  final String? monthId;
  @override
  @JsonKey(name: 'school_term_id', readValue: _readString)
  final String? schoolTermId;
  @override
  @JsonKey(name: 'code')
  final String? code;
  @override
  @JsonKey(name: 'request_id', readValue: _readString)
  final String? requestId;
  @override
  @JsonKey(name: 'school_id', readValue: _readString)
  final String? schoolId;
  @override
  @JsonKey(name: 'is_cancel_request', readValue: _readString)
  final String? isCancelRequest;

  /// Create a copy of PHXPayloadData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXPayloadDataCopyWith<_PHXPayloadData> get copyWith =>
      __$PHXPayloadDataCopyWithImpl<_PHXPayloadData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PHXPayloadDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXPayloadData &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'PHXPayloadData(action: $action, type: $type, title: $title, content: $content, notificationId: $notificationId, studentCode: $studentCode, attendanceLessonId: $attendanceLessonId, assignId: $assignId, subsystem: $subsystem, status: $status, eventType: $eventType, classroomName: $classroomName, schoolYearId: $schoolYearId, borrowTicketState: $borrowTicketState, id: $id, studentId: $studentId, quickExaminationId: $quickExaminationId, orderId: $orderId, feedbackId: $feedbackId, typeDetail: $typeDetail, inappNotiId: $inappNotiId, hasShareMessage: $hasShareMessage, monthId: $monthId, schoolTermId: $schoolTermId, code: $code, requestId: $requestId, schoolId: $schoolId, isCancelRequest: $isCancelRequest)';
  }
}

/// @nodoc
abstract mixin class _$PHXPayloadDataCopyWith<$Res>
    implements $PHXPayloadDataCopyWith<$Res> {
  factory _$PHXPayloadDataCopyWith(
          _PHXPayloadData value, $Res Function(_PHXPayloadData) _then) =
      __$PHXPayloadDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'action') String? action,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'notification_id', readValue: _readString)
      String? notificationId,
      @JsonKey(name: 'student_code') String? studentCode,
      @JsonKey(name: 'attendance_lesson_id', readValue: _readString)
      String? attendanceLessonId,
      @JsonKey(name: 'assign_id', readValue: _readString) String? assignId,
      @JsonKey(name: 'subsystem') String? subsystem,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'event_type') String? eventType,
      @JsonKey(name: 'classroom_name') String? classroomName,
      @JsonKey(name: 'school_year_id', readValue: _readString)
      String? schoolYearId,
      @JsonKey(name: 'borrow_ticket_state') String? borrowTicketState,
      @JsonKey(name: 'id', readValue: _readString) String? id,
      @JsonKey(name: 'student_id', readValue: _readString) String? studentId,
      @JsonKey(name: 'quick_examination_id', readValue: _readString)
      String? quickExaminationId,
      @JsonKey(name: 'order_id', readValue: _readString) String? orderId,
      @JsonKey(name: 'feedback_id', readValue: _readString) String? feedbackId,
      @JsonKey(name: 'type_detail') String? typeDetail,
      @JsonKey(name: 'inapp_noti_id', readValue: _readString)
      String? inappNotiId,
      @JsonKey(name: 'hasShareMessage') String? hasShareMessage,
      @JsonKey(name: 'month_id', readValue: _readString) String? monthId,
      @JsonKey(name: 'school_term_id', readValue: _readString)
      String? schoolTermId,
      @JsonKey(name: 'code') String? code,
      @JsonKey(name: 'request_id', readValue: _readString) String? requestId,
      @JsonKey(name: 'school_id', readValue: _readString) String? schoolId,
      @JsonKey(name: 'is_cancel_request', readValue: _readString)
      String? isCancelRequest});
}

/// @nodoc
class __$PHXPayloadDataCopyWithImpl<$Res>
    implements _$PHXPayloadDataCopyWith<$Res> {
  __$PHXPayloadDataCopyWithImpl(this._self, this._then);

  final _PHXPayloadData _self;
  final $Res Function(_PHXPayloadData) _then;

  /// Create a copy of PHXPayloadData
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
    return _then(_PHXPayloadData(
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
mixin _$PHXMultiBadgeData {
  @JsonKey(name: 'badgeType')
  String? get badgeType;
  @JsonKey(name: 'content')
  String? get content;
  @JsonKey(name: 'title')
  String? get title;

  /// Create a copy of PHXMultiBadgeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXMultiBadgeDataCopyWith<PHXMultiBadgeData> get copyWith =>
      _$PHXMultiBadgeDataCopyWithImpl<PHXMultiBadgeData>(
          this as PHXMultiBadgeData, _$identity);

  /// Serializes this PHXMultiBadgeData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXMultiBadgeData &&
            (identical(other.badgeType, badgeType) ||
                other.badgeType == badgeType) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, badgeType, content, title);

  @override
  String toString() {
    return 'PHXMultiBadgeData(badgeType: $badgeType, content: $content, title: $title)';
  }
}

/// @nodoc
abstract mixin class $PHXMultiBadgeDataCopyWith<$Res> {
  factory $PHXMultiBadgeDataCopyWith(
          PHXMultiBadgeData value, $Res Function(PHXMultiBadgeData) _then) =
      _$PHXMultiBadgeDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'badgeType') String? badgeType,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'title') String? title});
}

/// @nodoc
class _$PHXMultiBadgeDataCopyWithImpl<$Res>
    implements $PHXMultiBadgeDataCopyWith<$Res> {
  _$PHXMultiBadgeDataCopyWithImpl(this._self, this._then);

  final PHXMultiBadgeData _self;
  final $Res Function(PHXMultiBadgeData) _then;

  /// Create a copy of PHXMultiBadgeData
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

/// Adds pattern-matching-related methods to [PHXMultiBadgeData].
extension PHXMultiBadgeDataPatterns on PHXMultiBadgeData {
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
    TResult Function(_PHXMultiBadgeData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXMultiBadgeData() when $default != null:
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
    TResult Function(_PHXMultiBadgeData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXMultiBadgeData():
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
    TResult? Function(_PHXMultiBadgeData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXMultiBadgeData() when $default != null:
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
            @JsonKey(name: 'badgeType') String? badgeType,
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'title') String? title)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXMultiBadgeData() when $default != null:
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
    TResult Function(
            @JsonKey(name: 'badgeType') String? badgeType,
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'title') String? title)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXMultiBadgeData():
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
    TResult? Function(
            @JsonKey(name: 'badgeType') String? badgeType,
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'title') String? title)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXMultiBadgeData() when $default != null:
        return $default(_that.badgeType, _that.content, _that.title);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PHXMultiBadgeData implements PHXMultiBadgeData {
  const _PHXMultiBadgeData(
      {@JsonKey(name: 'badgeType') this.badgeType,
      @JsonKey(name: 'content') this.content,
      @JsonKey(name: 'title') this.title});
  factory _PHXMultiBadgeData.fromJson(Map<String, dynamic> json) =>
      _$PHXMultiBadgeDataFromJson(json);

  @override
  @JsonKey(name: 'badgeType')
  final String? badgeType;
  @override
  @JsonKey(name: 'content')
  final String? content;
  @override
  @JsonKey(name: 'title')
  final String? title;

  /// Create a copy of PHXMultiBadgeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXMultiBadgeDataCopyWith<_PHXMultiBadgeData> get copyWith =>
      __$PHXMultiBadgeDataCopyWithImpl<_PHXMultiBadgeData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PHXMultiBadgeDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXMultiBadgeData &&
            (identical(other.badgeType, badgeType) ||
                other.badgeType == badgeType) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, badgeType, content, title);

  @override
  String toString() {
    return 'PHXMultiBadgeData(badgeType: $badgeType, content: $content, title: $title)';
  }
}

/// @nodoc
abstract mixin class _$PHXMultiBadgeDataCopyWith<$Res>
    implements $PHXMultiBadgeDataCopyWith<$Res> {
  factory _$PHXMultiBadgeDataCopyWith(
          _PHXMultiBadgeData value, $Res Function(_PHXMultiBadgeData) _then) =
      __$PHXMultiBadgeDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'badgeType') String? badgeType,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'title') String? title});
}

/// @nodoc
class __$PHXMultiBadgeDataCopyWithImpl<$Res>
    implements _$PHXMultiBadgeDataCopyWith<$Res> {
  __$PHXMultiBadgeDataCopyWithImpl(this._self, this._then);

  final _PHXMultiBadgeData _self;
  final $Res Function(_PHXMultiBadgeData) _then;

  /// Create a copy of PHXMultiBadgeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? badgeType = freezed,
    Object? content = freezed,
    Object? title = freezed,
  }) {
    return _then(_PHXMultiBadgeData(
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
mixin _$PHXStudentData {
  @JsonKey(name: 'id')
  int? get id;
  @JsonKey(name: 'student_id')
  int? get studentId;
  @JsonKey(name: 'name')
  String? get name;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @JsonKey(name: 'sub_title')
  String? get subTitle;

  /// Create a copy of PHXStudentData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXStudentDataCopyWith<PHXStudentData> get copyWith =>
      _$PHXStudentDataCopyWithImpl<PHXStudentData>(
          this as PHXStudentData, _$identity);

  /// Serializes this PHXStudentData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXStudentData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, studentId, name, avatarUrl, subTitle);

  @override
  String toString() {
    return 'PHXStudentData(id: $id, studentId: $studentId, name: $name, avatarUrl: $avatarUrl, subTitle: $subTitle)';
  }
}

/// @nodoc
abstract mixin class $PHXStudentDataCopyWith<$Res> {
  factory $PHXStudentDataCopyWith(
          PHXStudentData value, $Res Function(PHXStudentData) _then) =
      _$PHXStudentDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'student_id') int? studentId,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'sub_title') String? subTitle});
}

/// @nodoc
class _$PHXStudentDataCopyWithImpl<$Res>
    implements $PHXStudentDataCopyWith<$Res> {
  _$PHXStudentDataCopyWithImpl(this._self, this._then);

  final PHXStudentData _self;
  final $Res Function(PHXStudentData) _then;

  /// Create a copy of PHXStudentData
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

/// Adds pattern-matching-related methods to [PHXStudentData].
extension PHXStudentDataPatterns on PHXStudentData {
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
    TResult Function(_PHXStudentData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXStudentData() when $default != null:
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
    TResult Function(_PHXStudentData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXStudentData():
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
    TResult? Function(_PHXStudentData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXStudentData() when $default != null:
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
            @JsonKey(name: 'id') int? id,
            @JsonKey(name: 'student_id') int? studentId,
            @JsonKey(name: 'name') String? name,
            @JsonKey(name: 'avatar_url') String? avatarUrl,
            @JsonKey(name: 'sub_title') String? subTitle)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXStudentData() when $default != null:
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
    TResult Function(
            @JsonKey(name: 'id') int? id,
            @JsonKey(name: 'student_id') int? studentId,
            @JsonKey(name: 'name') String? name,
            @JsonKey(name: 'avatar_url') String? avatarUrl,
            @JsonKey(name: 'sub_title') String? subTitle)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXStudentData():
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
    TResult? Function(
            @JsonKey(name: 'id') int? id,
            @JsonKey(name: 'student_id') int? studentId,
            @JsonKey(name: 'name') String? name,
            @JsonKey(name: 'avatar_url') String? avatarUrl,
            @JsonKey(name: 'sub_title') String? subTitle)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXStudentData() when $default != null:
        return $default(_that.id, _that.studentId, _that.name, _that.avatarUrl,
            _that.subTitle);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PHXStudentData implements PHXStudentData {
  const _PHXStudentData(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'student_id') this.studentId,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'avatar_url') this.avatarUrl,
      @JsonKey(name: 'sub_title') this.subTitle});
  factory _PHXStudentData.fromJson(Map<String, dynamic> json) =>
      _$PHXStudentDataFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'student_id')
  final int? studentId;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  @JsonKey(name: 'sub_title')
  final String? subTitle;

  /// Create a copy of PHXStudentData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXStudentDataCopyWith<_PHXStudentData> get copyWith =>
      __$PHXStudentDataCopyWithImpl<_PHXStudentData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PHXStudentDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXStudentData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, studentId, name, avatarUrl, subTitle);

  @override
  String toString() {
    return 'PHXStudentData(id: $id, studentId: $studentId, name: $name, avatarUrl: $avatarUrl, subTitle: $subTitle)';
  }
}

/// @nodoc
abstract mixin class _$PHXStudentDataCopyWith<$Res>
    implements $PHXStudentDataCopyWith<$Res> {
  factory _$PHXStudentDataCopyWith(
          _PHXStudentData value, $Res Function(_PHXStudentData) _then) =
      __$PHXStudentDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'student_id') int? studentId,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'sub_title') String? subTitle});
}

/// @nodoc
class __$PHXStudentDataCopyWithImpl<$Res>
    implements _$PHXStudentDataCopyWith<$Res> {
  __$PHXStudentDataCopyWithImpl(this._self, this._then);

  final _PHXStudentData _self;
  final $Res Function(_PHXStudentData) _then;

  /// Create a copy of PHXStudentData
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
    return _then(_PHXStudentData(
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
mixin _$PHXSectionItemDetailData {
  @JsonKey(name: 'id')
  int? get id;
  @JsonKey(name: 'title')
  String? get title;
  @JsonKey(name: 'content')
  String? get content;
  @JsonKey(name: 'icon')
  List<PHXSectionItemDetailIconData>? get icon;
  @JsonKey(name: 'type')
  List<PHXSectionContentTypeData>? get type;
  @JsonKey(name: 'show_divider')
  bool? get showDivider;
  @JsonKey(name: 'is_break_line')
  bool? get isBreakLine;
  @JsonKey(name: 'is_justify')
  bool? get isJustify;
  @JsonKey(name: 'badgeType')
  String? get badgeType;
  @JsonKey(name: 'badge')
  PHXSectionItemBadgeData? get badge;
  @JsonKey(name: 'is_action_item')
  bool? get isActionItem;
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @JsonKey(name: 'extra')
  PHXExtraData? get extra;

  /// Create a copy of PHXSectionItemDetailData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXSectionItemDetailDataCopyWith<PHXSectionItemDetailData> get copyWith =>
      _$PHXSectionItemDetailDataCopyWithImpl<PHXSectionItemDetailData>(
          this as PHXSectionItemDetailData, _$identity);

  /// Serializes this PHXSectionItemDetailData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXSectionItemDetailData &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'PHXSectionItemDetailData(id: $id, title: $title, content: $content, icon: $icon, type: $type, showDivider: $showDivider, isBreakLine: $isBreakLine, isJustify: $isJustify, badgeType: $badgeType, badge: $badge, isActionItem: $isActionItem, imageUrl: $imageUrl, extra: $extra)';
  }
}

/// @nodoc
abstract mixin class $PHXSectionItemDetailDataCopyWith<$Res> {
  factory $PHXSectionItemDetailDataCopyWith(PHXSectionItemDetailData value,
          $Res Function(PHXSectionItemDetailData) _then) =
      _$PHXSectionItemDetailDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'icon') List<PHXSectionItemDetailIconData>? icon,
      @JsonKey(name: 'type') List<PHXSectionContentTypeData>? type,
      @JsonKey(name: 'show_divider') bool? showDivider,
      @JsonKey(name: 'is_break_line') bool? isBreakLine,
      @JsonKey(name: 'is_justify') bool? isJustify,
      @JsonKey(name: 'badgeType') String? badgeType,
      @JsonKey(name: 'badge') PHXSectionItemBadgeData? badge,
      @JsonKey(name: 'is_action_item') bool? isActionItem,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'extra') PHXExtraData? extra});

  $PHXSectionItemBadgeDataCopyWith<$Res>? get badge;
  $PHXExtraDataCopyWith<$Res>? get extra;
}

/// @nodoc
class _$PHXSectionItemDetailDataCopyWithImpl<$Res>
    implements $PHXSectionItemDetailDataCopyWith<$Res> {
  _$PHXSectionItemDetailDataCopyWithImpl(this._self, this._then);

  final PHXSectionItemDetailData _self;
  final $Res Function(PHXSectionItemDetailData) _then;

  /// Create a copy of PHXSectionItemDetailData
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
              as List<PHXSectionItemDetailIconData>?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as List<PHXSectionContentTypeData>?,
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
              as PHXSectionItemBadgeData?,
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
              as PHXExtraData?,
    ));
  }

  /// Create a copy of PHXSectionItemDetailData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXSectionItemBadgeDataCopyWith<$Res>? get badge {
    if (_self.badge == null) {
      return null;
    }

    return $PHXSectionItemBadgeDataCopyWith<$Res>(_self.badge!, (value) {
      return _then(_self.copyWith(badge: value));
    });
  }

  /// Create a copy of PHXSectionItemDetailData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXExtraDataCopyWith<$Res>? get extra {
    if (_self.extra == null) {
      return null;
    }

    return $PHXExtraDataCopyWith<$Res>(_self.extra!, (value) {
      return _then(_self.copyWith(extra: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PHXSectionItemDetailData].
extension PHXSectionItemDetailDataPatterns on PHXSectionItemDetailData {
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
    TResult Function(_PHXSectionItemDetailData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemDetailData() when $default != null:
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
    TResult Function(_PHXSectionItemDetailData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemDetailData():
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
    TResult? Function(_PHXSectionItemDetailData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemDetailData() when $default != null:
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
            @JsonKey(name: 'id') int? id,
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'icon') List<PHXSectionItemDetailIconData>? icon,
            @JsonKey(name: 'type') List<PHXSectionContentTypeData>? type,
            @JsonKey(name: 'show_divider') bool? showDivider,
            @JsonKey(name: 'is_break_line') bool? isBreakLine,
            @JsonKey(name: 'is_justify') bool? isJustify,
            @JsonKey(name: 'badgeType') String? badgeType,
            @JsonKey(name: 'badge') PHXSectionItemBadgeData? badge,
            @JsonKey(name: 'is_action_item') bool? isActionItem,
            @JsonKey(name: 'image_url') String? imageUrl,
            @JsonKey(name: 'extra') PHXExtraData? extra)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemDetailData() when $default != null:
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
            @JsonKey(name: 'id') int? id,
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'icon') List<PHXSectionItemDetailIconData>? icon,
            @JsonKey(name: 'type') List<PHXSectionContentTypeData>? type,
            @JsonKey(name: 'show_divider') bool? showDivider,
            @JsonKey(name: 'is_break_line') bool? isBreakLine,
            @JsonKey(name: 'is_justify') bool? isJustify,
            @JsonKey(name: 'badgeType') String? badgeType,
            @JsonKey(name: 'badge') PHXSectionItemBadgeData? badge,
            @JsonKey(name: 'is_action_item') bool? isActionItem,
            @JsonKey(name: 'image_url') String? imageUrl,
            @JsonKey(name: 'extra') PHXExtraData? extra)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemDetailData():
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
            @JsonKey(name: 'id') int? id,
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'icon') List<PHXSectionItemDetailIconData>? icon,
            @JsonKey(name: 'type') List<PHXSectionContentTypeData>? type,
            @JsonKey(name: 'show_divider') bool? showDivider,
            @JsonKey(name: 'is_break_line') bool? isBreakLine,
            @JsonKey(name: 'is_justify') bool? isJustify,
            @JsonKey(name: 'badgeType') String? badgeType,
            @JsonKey(name: 'badge') PHXSectionItemBadgeData? badge,
            @JsonKey(name: 'is_action_item') bool? isActionItem,
            @JsonKey(name: 'image_url') String? imageUrl,
            @JsonKey(name: 'extra') PHXExtraData? extra)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemDetailData() when $default != null:
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

@JsonSerializable(explicitToJson: true)
class _PHXSectionItemDetailData implements PHXSectionItemDetailData {
  const _PHXSectionItemDetailData(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'content') this.content,
      @JsonKey(name: 'icon') final List<PHXSectionItemDetailIconData>? icon,
      @JsonKey(name: 'type') final List<PHXSectionContentTypeData>? type,
      @JsonKey(name: 'show_divider') this.showDivider,
      @JsonKey(name: 'is_break_line') this.isBreakLine,
      @JsonKey(name: 'is_justify') this.isJustify,
      @JsonKey(name: 'badgeType') this.badgeType,
      @JsonKey(name: 'badge') this.badge,
      @JsonKey(name: 'is_action_item') this.isActionItem,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'extra') this.extra})
      : _icon = icon,
        _type = type;
  factory _PHXSectionItemDetailData.fromJson(Map<String, dynamic> json) =>
      _$PHXSectionItemDetailDataFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'content')
  final String? content;
  final List<PHXSectionItemDetailIconData>? _icon;
  @override
  @JsonKey(name: 'icon')
  List<PHXSectionItemDetailIconData>? get icon {
    final value = _icon;
    if (value == null) return null;
    if (_icon is EqualUnmodifiableListView) return _icon;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<PHXSectionContentTypeData>? _type;
  @override
  @JsonKey(name: 'type')
  List<PHXSectionContentTypeData>? get type {
    final value = _type;
    if (value == null) return null;
    if (_type is EqualUnmodifiableListView) return _type;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'show_divider')
  final bool? showDivider;
  @override
  @JsonKey(name: 'is_break_line')
  final bool? isBreakLine;
  @override
  @JsonKey(name: 'is_justify')
  final bool? isJustify;
  @override
  @JsonKey(name: 'badgeType')
  final String? badgeType;
  @override
  @JsonKey(name: 'badge')
  final PHXSectionItemBadgeData? badge;
  @override
  @JsonKey(name: 'is_action_item')
  final bool? isActionItem;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'extra')
  final PHXExtraData? extra;

  /// Create a copy of PHXSectionItemDetailData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXSectionItemDetailDataCopyWith<_PHXSectionItemDetailData> get copyWith =>
      __$PHXSectionItemDetailDataCopyWithImpl<_PHXSectionItemDetailData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PHXSectionItemDetailDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXSectionItemDetailData &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'PHXSectionItemDetailData(id: $id, title: $title, content: $content, icon: $icon, type: $type, showDivider: $showDivider, isBreakLine: $isBreakLine, isJustify: $isJustify, badgeType: $badgeType, badge: $badge, isActionItem: $isActionItem, imageUrl: $imageUrl, extra: $extra)';
  }
}

/// @nodoc
abstract mixin class _$PHXSectionItemDetailDataCopyWith<$Res>
    implements $PHXSectionItemDetailDataCopyWith<$Res> {
  factory _$PHXSectionItemDetailDataCopyWith(_PHXSectionItemDetailData value,
          $Res Function(_PHXSectionItemDetailData) _then) =
      __$PHXSectionItemDetailDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'icon') List<PHXSectionItemDetailIconData>? icon,
      @JsonKey(name: 'type') List<PHXSectionContentTypeData>? type,
      @JsonKey(name: 'show_divider') bool? showDivider,
      @JsonKey(name: 'is_break_line') bool? isBreakLine,
      @JsonKey(name: 'is_justify') bool? isJustify,
      @JsonKey(name: 'badgeType') String? badgeType,
      @JsonKey(name: 'badge') PHXSectionItemBadgeData? badge,
      @JsonKey(name: 'is_action_item') bool? isActionItem,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'extra') PHXExtraData? extra});

  @override
  $PHXSectionItemBadgeDataCopyWith<$Res>? get badge;
  @override
  $PHXExtraDataCopyWith<$Res>? get extra;
}

/// @nodoc
class __$PHXSectionItemDetailDataCopyWithImpl<$Res>
    implements _$PHXSectionItemDetailDataCopyWith<$Res> {
  __$PHXSectionItemDetailDataCopyWithImpl(this._self, this._then);

  final _PHXSectionItemDetailData _self;
  final $Res Function(_PHXSectionItemDetailData) _then;

  /// Create a copy of PHXSectionItemDetailData
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
    return _then(_PHXSectionItemDetailData(
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
              as List<PHXSectionItemDetailIconData>?,
      type: freezed == type
          ? _self._type
          : type // ignore: cast_nullable_to_non_nullable
              as List<PHXSectionContentTypeData>?,
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
              as PHXSectionItemBadgeData?,
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
              as PHXExtraData?,
    ));
  }

  /// Create a copy of PHXSectionItemDetailData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXSectionItemBadgeDataCopyWith<$Res>? get badge {
    if (_self.badge == null) {
      return null;
    }

    return $PHXSectionItemBadgeDataCopyWith<$Res>(_self.badge!, (value) {
      return _then(_self.copyWith(badge: value));
    });
  }

  /// Create a copy of PHXSectionItemDetailData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXExtraDataCopyWith<$Res>? get extra {
    if (_self.extra == null) {
      return null;
    }

    return $PHXExtraDataCopyWith<$Res>(_self.extra!, (value) {
      return _then(_self.copyWith(extra: value));
    });
  }
}

/// @nodoc
mixin _$PHXSectionContentTypeData {
  @JsonKey(name: 'is_disable')
  bool? get isDisable;
  @JsonKey(name: 'is_enable')
  bool? get isEnable;
  @JsonKey(name: 'is_text_area')
  bool? get isTextArea;

  /// Create a copy of PHXSectionContentTypeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXSectionContentTypeDataCopyWith<PHXSectionContentTypeData> get copyWith =>
      _$PHXSectionContentTypeDataCopyWithImpl<PHXSectionContentTypeData>(
          this as PHXSectionContentTypeData, _$identity);

  /// Serializes this PHXSectionContentTypeData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXSectionContentTypeData &&
            (identical(other.isDisable, isDisable) ||
                other.isDisable == isDisable) &&
            (identical(other.isEnable, isEnable) ||
                other.isEnable == isEnable) &&
            (identical(other.isTextArea, isTextArea) ||
                other.isTextArea == isTextArea));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isDisable, isEnable, isTextArea);

  @override
  String toString() {
    return 'PHXSectionContentTypeData(isDisable: $isDisable, isEnable: $isEnable, isTextArea: $isTextArea)';
  }
}

/// @nodoc
abstract mixin class $PHXSectionContentTypeDataCopyWith<$Res> {
  factory $PHXSectionContentTypeDataCopyWith(PHXSectionContentTypeData value,
          $Res Function(PHXSectionContentTypeData) _then) =
      _$PHXSectionContentTypeDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'is_disable') bool? isDisable,
      @JsonKey(name: 'is_enable') bool? isEnable,
      @JsonKey(name: 'is_text_area') bool? isTextArea});
}

/// @nodoc
class _$PHXSectionContentTypeDataCopyWithImpl<$Res>
    implements $PHXSectionContentTypeDataCopyWith<$Res> {
  _$PHXSectionContentTypeDataCopyWithImpl(this._self, this._then);

  final PHXSectionContentTypeData _self;
  final $Res Function(PHXSectionContentTypeData) _then;

  /// Create a copy of PHXSectionContentTypeData
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

/// Adds pattern-matching-related methods to [PHXSectionContentTypeData].
extension PHXSectionContentTypeDataPatterns on PHXSectionContentTypeData {
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
    TResult Function(_PHXSectionContentTypeData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXSectionContentTypeData() when $default != null:
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
    TResult Function(_PHXSectionContentTypeData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionContentTypeData():
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
    TResult? Function(_PHXSectionContentTypeData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionContentTypeData() when $default != null:
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
            @JsonKey(name: 'is_disable') bool? isDisable,
            @JsonKey(name: 'is_enable') bool? isEnable,
            @JsonKey(name: 'is_text_area') bool? isTextArea)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXSectionContentTypeData() when $default != null:
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
    TResult Function(
            @JsonKey(name: 'is_disable') bool? isDisable,
            @JsonKey(name: 'is_enable') bool? isEnable,
            @JsonKey(name: 'is_text_area') bool? isTextArea)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionContentTypeData():
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
    TResult? Function(
            @JsonKey(name: 'is_disable') bool? isDisable,
            @JsonKey(name: 'is_enable') bool? isEnable,
            @JsonKey(name: 'is_text_area') bool? isTextArea)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionContentTypeData() when $default != null:
        return $default(_that.isDisable, _that.isEnable, _that.isTextArea);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PHXSectionContentTypeData implements PHXSectionContentTypeData {
  const _PHXSectionContentTypeData(
      {@JsonKey(name: 'is_disable') this.isDisable,
      @JsonKey(name: 'is_enable') this.isEnable,
      @JsonKey(name: 'is_text_area') this.isTextArea});
  factory _PHXSectionContentTypeData.fromJson(Map<String, dynamic> json) =>
      _$PHXSectionContentTypeDataFromJson(json);

  @override
  @JsonKey(name: 'is_disable')
  final bool? isDisable;
  @override
  @JsonKey(name: 'is_enable')
  final bool? isEnable;
  @override
  @JsonKey(name: 'is_text_area')
  final bool? isTextArea;

  /// Create a copy of PHXSectionContentTypeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXSectionContentTypeDataCopyWith<_PHXSectionContentTypeData>
      get copyWith =>
          __$PHXSectionContentTypeDataCopyWithImpl<_PHXSectionContentTypeData>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PHXSectionContentTypeDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXSectionContentTypeData &&
            (identical(other.isDisable, isDisable) ||
                other.isDisable == isDisable) &&
            (identical(other.isEnable, isEnable) ||
                other.isEnable == isEnable) &&
            (identical(other.isTextArea, isTextArea) ||
                other.isTextArea == isTextArea));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isDisable, isEnable, isTextArea);

  @override
  String toString() {
    return 'PHXSectionContentTypeData(isDisable: $isDisable, isEnable: $isEnable, isTextArea: $isTextArea)';
  }
}

/// @nodoc
abstract mixin class _$PHXSectionContentTypeDataCopyWith<$Res>
    implements $PHXSectionContentTypeDataCopyWith<$Res> {
  factory _$PHXSectionContentTypeDataCopyWith(_PHXSectionContentTypeData value,
          $Res Function(_PHXSectionContentTypeData) _then) =
      __$PHXSectionContentTypeDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'is_disable') bool? isDisable,
      @JsonKey(name: 'is_enable') bool? isEnable,
      @JsonKey(name: 'is_text_area') bool? isTextArea});
}

/// @nodoc
class __$PHXSectionContentTypeDataCopyWithImpl<$Res>
    implements _$PHXSectionContentTypeDataCopyWith<$Res> {
  __$PHXSectionContentTypeDataCopyWithImpl(this._self, this._then);

  final _PHXSectionContentTypeData _self;
  final $Res Function(_PHXSectionContentTypeData) _then;

  /// Create a copy of PHXSectionContentTypeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isDisable = freezed,
    Object? isEnable = freezed,
    Object? isTextArea = freezed,
  }) {
    return _then(_PHXSectionContentTypeData(
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
mixin _$PHXSectionItemDetailIconData {
  @JsonKey(name: 'url')
  String? get url;
  @JsonKey(name: 'action')
  String? get action;

  /// Create a copy of PHXSectionItemDetailIconData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXSectionItemDetailIconDataCopyWith<PHXSectionItemDetailIconData>
      get copyWith => _$PHXSectionItemDetailIconDataCopyWithImpl<
              PHXSectionItemDetailIconData>(
          this as PHXSectionItemDetailIconData, _$identity);

  /// Serializes this PHXSectionItemDetailIconData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXSectionItemDetailIconData &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.action, action) || other.action == action));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, action);

  @override
  String toString() {
    return 'PHXSectionItemDetailIconData(url: $url, action: $action)';
  }
}

/// @nodoc
abstract mixin class $PHXSectionItemDetailIconDataCopyWith<$Res> {
  factory $PHXSectionItemDetailIconDataCopyWith(
          PHXSectionItemDetailIconData value,
          $Res Function(PHXSectionItemDetailIconData) _then) =
      _$PHXSectionItemDetailIconDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'url') String? url,
      @JsonKey(name: 'action') String? action});
}

/// @nodoc
class _$PHXSectionItemDetailIconDataCopyWithImpl<$Res>
    implements $PHXSectionItemDetailIconDataCopyWith<$Res> {
  _$PHXSectionItemDetailIconDataCopyWithImpl(this._self, this._then);

  final PHXSectionItemDetailIconData _self;
  final $Res Function(PHXSectionItemDetailIconData) _then;

  /// Create a copy of PHXSectionItemDetailIconData
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

/// Adds pattern-matching-related methods to [PHXSectionItemDetailIconData].
extension PHXSectionItemDetailIconDataPatterns on PHXSectionItemDetailIconData {
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
    TResult Function(_PHXSectionItemDetailIconData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemDetailIconData() when $default != null:
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
    TResult Function(_PHXSectionItemDetailIconData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemDetailIconData():
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
    TResult? Function(_PHXSectionItemDetailIconData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemDetailIconData() when $default != null:
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
    TResult Function(@JsonKey(name: 'url') String? url,
            @JsonKey(name: 'action') String? action)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemDetailIconData() when $default != null:
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
    TResult Function(@JsonKey(name: 'url') String? url,
            @JsonKey(name: 'action') String? action)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemDetailIconData():
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
    TResult? Function(@JsonKey(name: 'url') String? url,
            @JsonKey(name: 'action') String? action)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemDetailIconData() when $default != null:
        return $default(_that.url, _that.action);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PHXSectionItemDetailIconData implements PHXSectionItemDetailIconData {
  const _PHXSectionItemDetailIconData(
      {@JsonKey(name: 'url') this.url, @JsonKey(name: 'action') this.action});
  factory _PHXSectionItemDetailIconData.fromJson(Map<String, dynamic> json) =>
      _$PHXSectionItemDetailIconDataFromJson(json);

  @override
  @JsonKey(name: 'url')
  final String? url;
  @override
  @JsonKey(name: 'action')
  final String? action;

  /// Create a copy of PHXSectionItemDetailIconData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXSectionItemDetailIconDataCopyWith<_PHXSectionItemDetailIconData>
      get copyWith => __$PHXSectionItemDetailIconDataCopyWithImpl<
          _PHXSectionItemDetailIconData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PHXSectionItemDetailIconDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXSectionItemDetailIconData &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.action, action) || other.action == action));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, action);

  @override
  String toString() {
    return 'PHXSectionItemDetailIconData(url: $url, action: $action)';
  }
}

/// @nodoc
abstract mixin class _$PHXSectionItemDetailIconDataCopyWith<$Res>
    implements $PHXSectionItemDetailIconDataCopyWith<$Res> {
  factory _$PHXSectionItemDetailIconDataCopyWith(
          _PHXSectionItemDetailIconData value,
          $Res Function(_PHXSectionItemDetailIconData) _then) =
      __$PHXSectionItemDetailIconDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'url') String? url,
      @JsonKey(name: 'action') String? action});
}

/// @nodoc
class __$PHXSectionItemDetailIconDataCopyWithImpl<$Res>
    implements _$PHXSectionItemDetailIconDataCopyWith<$Res> {
  __$PHXSectionItemDetailIconDataCopyWithImpl(this._self, this._then);

  final _PHXSectionItemDetailIconData _self;
  final $Res Function(_PHXSectionItemDetailIconData) _then;

  /// Create a copy of PHXSectionItemDetailIconData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? url = freezed,
    Object? action = freezed,
  }) {
    return _then(_PHXSectionItemDetailIconData(
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
mixin _$PHXSectionItemBadgeData {
  @JsonKey(name: 'title')
  String? get title;
  @JsonKey(name: 'content')
  String? get content;
  @JsonKey(name: 'badgeType')
  String? get badgeType;

  /// Create a copy of PHXSectionItemBadgeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXSectionItemBadgeDataCopyWith<PHXSectionItemBadgeData> get copyWith =>
      _$PHXSectionItemBadgeDataCopyWithImpl<PHXSectionItemBadgeData>(
          this as PHXSectionItemBadgeData, _$identity);

  /// Serializes this PHXSectionItemBadgeData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXSectionItemBadgeData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.badgeType, badgeType) ||
                other.badgeType == badgeType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, content, badgeType);

  @override
  String toString() {
    return 'PHXSectionItemBadgeData(title: $title, content: $content, badgeType: $badgeType)';
  }
}

/// @nodoc
abstract mixin class $PHXSectionItemBadgeDataCopyWith<$Res> {
  factory $PHXSectionItemBadgeDataCopyWith(PHXSectionItemBadgeData value,
          $Res Function(PHXSectionItemBadgeData) _then) =
      _$PHXSectionItemBadgeDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'badgeType') String? badgeType});
}

/// @nodoc
class _$PHXSectionItemBadgeDataCopyWithImpl<$Res>
    implements $PHXSectionItemBadgeDataCopyWith<$Res> {
  _$PHXSectionItemBadgeDataCopyWithImpl(this._self, this._then);

  final PHXSectionItemBadgeData _self;
  final $Res Function(PHXSectionItemBadgeData) _then;

  /// Create a copy of PHXSectionItemBadgeData
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

/// Adds pattern-matching-related methods to [PHXSectionItemBadgeData].
extension PHXSectionItemBadgeDataPatterns on PHXSectionItemBadgeData {
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
    TResult Function(_PHXSectionItemBadgeData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemBadgeData() when $default != null:
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
    TResult Function(_PHXSectionItemBadgeData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemBadgeData():
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
    TResult? Function(_PHXSectionItemBadgeData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemBadgeData() when $default != null:
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
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'badgeType') String? badgeType)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemBadgeData() when $default != null:
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
    TResult Function(
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'badgeType') String? badgeType)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemBadgeData():
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
    TResult? Function(
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'badgeType') String? badgeType)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemBadgeData() when $default != null:
        return $default(_that.title, _that.content, _that.badgeType);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PHXSectionItemBadgeData implements PHXSectionItemBadgeData {
  const _PHXSectionItemBadgeData(
      {@JsonKey(name: 'title') this.title,
      @JsonKey(name: 'content') this.content,
      @JsonKey(name: 'badgeType') this.badgeType});
  factory _PHXSectionItemBadgeData.fromJson(Map<String, dynamic> json) =>
      _$PHXSectionItemBadgeDataFromJson(json);

  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'content')
  final String? content;
  @override
  @JsonKey(name: 'badgeType')
  final String? badgeType;

  /// Create a copy of PHXSectionItemBadgeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXSectionItemBadgeDataCopyWith<_PHXSectionItemBadgeData> get copyWith =>
      __$PHXSectionItemBadgeDataCopyWithImpl<_PHXSectionItemBadgeData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PHXSectionItemBadgeDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXSectionItemBadgeData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.badgeType, badgeType) ||
                other.badgeType == badgeType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, content, badgeType);

  @override
  String toString() {
    return 'PHXSectionItemBadgeData(title: $title, content: $content, badgeType: $badgeType)';
  }
}

/// @nodoc
abstract mixin class _$PHXSectionItemBadgeDataCopyWith<$Res>
    implements $PHXSectionItemBadgeDataCopyWith<$Res> {
  factory _$PHXSectionItemBadgeDataCopyWith(_PHXSectionItemBadgeData value,
          $Res Function(_PHXSectionItemBadgeData) _then) =
      __$PHXSectionItemBadgeDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'badgeType') String? badgeType});
}

/// @nodoc
class __$PHXSectionItemBadgeDataCopyWithImpl<$Res>
    implements _$PHXSectionItemBadgeDataCopyWith<$Res> {
  __$PHXSectionItemBadgeDataCopyWithImpl(this._self, this._then);

  final _PHXSectionItemBadgeData _self;
  final $Res Function(_PHXSectionItemBadgeData) _then;

  /// Create a copy of PHXSectionItemBadgeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
    Object? badgeType = freezed,
  }) {
    return _then(_PHXSectionItemBadgeData(
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
mixin _$PHXSectionItemBottomInfoData {
  @JsonKey(name: 'title')
  String? get title;
  @JsonKey(name: 'sub_title')
  String? get subTitle;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @JsonKey(name: 'is_contact')
  bool? get isContact;
  @JsonKey(name: 'show_divider')
  bool? get showDivider;
  @JsonKey(name: 'icon')
  List<PHXSectionItemDetailIconData>? get icon;

  /// Create a copy of PHXSectionItemBottomInfoData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXSectionItemBottomInfoDataCopyWith<PHXSectionItemBottomInfoData>
      get copyWith => _$PHXSectionItemBottomInfoDataCopyWithImpl<
              PHXSectionItemBottomInfoData>(
          this as PHXSectionItemBottomInfoData, _$identity);

  /// Serializes this PHXSectionItemBottomInfoData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXSectionItemBottomInfoData &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, subTitle, avatarUrl,
      isContact, showDivider, const DeepCollectionEquality().hash(icon));

  @override
  String toString() {
    return 'PHXSectionItemBottomInfoData(title: $title, subTitle: $subTitle, avatarUrl: $avatarUrl, isContact: $isContact, showDivider: $showDivider, icon: $icon)';
  }
}

/// @nodoc
abstract mixin class $PHXSectionItemBottomInfoDataCopyWith<$Res> {
  factory $PHXSectionItemBottomInfoDataCopyWith(
          PHXSectionItemBottomInfoData value,
          $Res Function(PHXSectionItemBottomInfoData) _then) =
      _$PHXSectionItemBottomInfoDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'sub_title') String? subTitle,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'is_contact') bool? isContact,
      @JsonKey(name: 'show_divider') bool? showDivider,
      @JsonKey(name: 'icon') List<PHXSectionItemDetailIconData>? icon});
}

/// @nodoc
class _$PHXSectionItemBottomInfoDataCopyWithImpl<$Res>
    implements $PHXSectionItemBottomInfoDataCopyWith<$Res> {
  _$PHXSectionItemBottomInfoDataCopyWithImpl(this._self, this._then);

  final PHXSectionItemBottomInfoData _self;
  final $Res Function(PHXSectionItemBottomInfoData) _then;

  /// Create a copy of PHXSectionItemBottomInfoData
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
              as List<PHXSectionItemDetailIconData>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PHXSectionItemBottomInfoData].
extension PHXSectionItemBottomInfoDataPatterns on PHXSectionItemBottomInfoData {
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
    TResult Function(_PHXSectionItemBottomInfoData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemBottomInfoData() when $default != null:
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
    TResult Function(_PHXSectionItemBottomInfoData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemBottomInfoData():
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
    TResult? Function(_PHXSectionItemBottomInfoData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemBottomInfoData() when $default != null:
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
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'sub_title') String? subTitle,
            @JsonKey(name: 'avatar_url') String? avatarUrl,
            @JsonKey(name: 'is_contact') bool? isContact,
            @JsonKey(name: 'show_divider') bool? showDivider,
            @JsonKey(name: 'icon') List<PHXSectionItemDetailIconData>? icon)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemBottomInfoData() when $default != null:
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
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'sub_title') String? subTitle,
            @JsonKey(name: 'avatar_url') String? avatarUrl,
            @JsonKey(name: 'is_contact') bool? isContact,
            @JsonKey(name: 'show_divider') bool? showDivider,
            @JsonKey(name: 'icon') List<PHXSectionItemDetailIconData>? icon)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemBottomInfoData():
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
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'sub_title') String? subTitle,
            @JsonKey(name: 'avatar_url') String? avatarUrl,
            @JsonKey(name: 'is_contact') bool? isContact,
            @JsonKey(name: 'show_divider') bool? showDivider,
            @JsonKey(name: 'icon') List<PHXSectionItemDetailIconData>? icon)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXSectionItemBottomInfoData() when $default != null:
        return $default(_that.title, _that.subTitle, _that.avatarUrl,
            _that.isContact, _that.showDivider, _that.icon);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PHXSectionItemBottomInfoData implements PHXSectionItemBottomInfoData {
  const _PHXSectionItemBottomInfoData(
      {@JsonKey(name: 'title') this.title,
      @JsonKey(name: 'sub_title') this.subTitle,
      @JsonKey(name: 'avatar_url') this.avatarUrl,
      @JsonKey(name: 'is_contact') this.isContact,
      @JsonKey(name: 'show_divider') this.showDivider,
      @JsonKey(name: 'icon') final List<PHXSectionItemDetailIconData>? icon})
      : _icon = icon;
  factory _PHXSectionItemBottomInfoData.fromJson(Map<String, dynamic> json) =>
      _$PHXSectionItemBottomInfoDataFromJson(json);

  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'sub_title')
  final String? subTitle;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  @JsonKey(name: 'is_contact')
  final bool? isContact;
  @override
  @JsonKey(name: 'show_divider')
  final bool? showDivider;
  final List<PHXSectionItemDetailIconData>? _icon;
  @override
  @JsonKey(name: 'icon')
  List<PHXSectionItemDetailIconData>? get icon {
    final value = _icon;
    if (value == null) return null;
    if (_icon is EqualUnmodifiableListView) return _icon;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of PHXSectionItemBottomInfoData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXSectionItemBottomInfoDataCopyWith<_PHXSectionItemBottomInfoData>
      get copyWith => __$PHXSectionItemBottomInfoDataCopyWithImpl<
          _PHXSectionItemBottomInfoData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PHXSectionItemBottomInfoDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXSectionItemBottomInfoData &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, subTitle, avatarUrl,
      isContact, showDivider, const DeepCollectionEquality().hash(_icon));

  @override
  String toString() {
    return 'PHXSectionItemBottomInfoData(title: $title, subTitle: $subTitle, avatarUrl: $avatarUrl, isContact: $isContact, showDivider: $showDivider, icon: $icon)';
  }
}

/// @nodoc
abstract mixin class _$PHXSectionItemBottomInfoDataCopyWith<$Res>
    implements $PHXSectionItemBottomInfoDataCopyWith<$Res> {
  factory _$PHXSectionItemBottomInfoDataCopyWith(
          _PHXSectionItemBottomInfoData value,
          $Res Function(_PHXSectionItemBottomInfoData) _then) =
      __$PHXSectionItemBottomInfoDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'sub_title') String? subTitle,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'is_contact') bool? isContact,
      @JsonKey(name: 'show_divider') bool? showDivider,
      @JsonKey(name: 'icon') List<PHXSectionItemDetailIconData>? icon});
}

/// @nodoc
class __$PHXSectionItemBottomInfoDataCopyWithImpl<$Res>
    implements _$PHXSectionItemBottomInfoDataCopyWith<$Res> {
  __$PHXSectionItemBottomInfoDataCopyWithImpl(this._self, this._then);

  final _PHXSectionItemBottomInfoData _self;
  final $Res Function(_PHXSectionItemBottomInfoData) _then;

  /// Create a copy of PHXSectionItemBottomInfoData
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
    return _then(_PHXSectionItemBottomInfoData(
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
              as List<PHXSectionItemDetailIconData>?,
    ));
  }
}

/// @nodoc
mixin _$PHXListOptionData {
  @JsonKey(name: 'id')
  int? get id;
  @JsonKey(name: 'code')
  String? get code;
  @JsonKey(name: 'title')
  String? get title;
  @JsonKey(name: 'is_active')
  bool? get isActive;
  @JsonKey(name: 'extra')
  PHXExtraData? get extra;

  /// Create a copy of PHXListOptionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXListOptionDataCopyWith<PHXListOptionData> get copyWith =>
      _$PHXListOptionDataCopyWithImpl<PHXListOptionData>(
          this as PHXListOptionData, _$identity);

  /// Serializes this PHXListOptionData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXListOptionData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.extra, extra) || other.extra == extra));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, code, title, isActive, extra);

  @override
  String toString() {
    return 'PHXListOptionData(id: $id, code: $code, title: $title, isActive: $isActive, extra: $extra)';
  }
}

/// @nodoc
abstract mixin class $PHXListOptionDataCopyWith<$Res> {
  factory $PHXListOptionDataCopyWith(
          PHXListOptionData value, $Res Function(PHXListOptionData) _then) =
      _$PHXListOptionDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'code') String? code,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'extra') PHXExtraData? extra});

  $PHXExtraDataCopyWith<$Res>? get extra;
}

/// @nodoc
class _$PHXListOptionDataCopyWithImpl<$Res>
    implements $PHXListOptionDataCopyWith<$Res> {
  _$PHXListOptionDataCopyWithImpl(this._self, this._then);

  final PHXListOptionData _self;
  final $Res Function(PHXListOptionData) _then;

  /// Create a copy of PHXListOptionData
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
              as PHXExtraData?,
    ));
  }

  /// Create a copy of PHXListOptionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXExtraDataCopyWith<$Res>? get extra {
    if (_self.extra == null) {
      return null;
    }

    return $PHXExtraDataCopyWith<$Res>(_self.extra!, (value) {
      return _then(_self.copyWith(extra: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PHXListOptionData].
extension PHXListOptionDataPatterns on PHXListOptionData {
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
    TResult Function(_PHXListOptionData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXListOptionData() when $default != null:
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
    TResult Function(_PHXListOptionData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXListOptionData():
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
    TResult? Function(_PHXListOptionData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXListOptionData() when $default != null:
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
            @JsonKey(name: 'id') int? id,
            @JsonKey(name: 'code') String? code,
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'is_active') bool? isActive,
            @JsonKey(name: 'extra') PHXExtraData? extra)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXListOptionData() when $default != null:
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
    TResult Function(
            @JsonKey(name: 'id') int? id,
            @JsonKey(name: 'code') String? code,
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'is_active') bool? isActive,
            @JsonKey(name: 'extra') PHXExtraData? extra)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXListOptionData():
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
    TResult? Function(
            @JsonKey(name: 'id') int? id,
            @JsonKey(name: 'code') String? code,
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'is_active') bool? isActive,
            @JsonKey(name: 'extra') PHXExtraData? extra)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXListOptionData() when $default != null:
        return $default(
            _that.id, _that.code, _that.title, _that.isActive, _that.extra);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PHXListOptionData implements PHXListOptionData {
  const _PHXListOptionData(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'code') this.code,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'is_active') this.isActive,
      @JsonKey(name: 'extra') this.extra});
  factory _PHXListOptionData.fromJson(Map<String, dynamic> json) =>
      _$PHXListOptionDataFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'code')
  final String? code;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @override
  @JsonKey(name: 'extra')
  final PHXExtraData? extra;

  /// Create a copy of PHXListOptionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXListOptionDataCopyWith<_PHXListOptionData> get copyWith =>
      __$PHXListOptionDataCopyWithImpl<_PHXListOptionData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PHXListOptionDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXListOptionData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.extra, extra) || other.extra == extra));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, code, title, isActive, extra);

  @override
  String toString() {
    return 'PHXListOptionData(id: $id, code: $code, title: $title, isActive: $isActive, extra: $extra)';
  }
}

/// @nodoc
abstract mixin class _$PHXListOptionDataCopyWith<$Res>
    implements $PHXListOptionDataCopyWith<$Res> {
  factory _$PHXListOptionDataCopyWith(
          _PHXListOptionData value, $Res Function(_PHXListOptionData) _then) =
      __$PHXListOptionDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'code') String? code,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'extra') PHXExtraData? extra});

  @override
  $PHXExtraDataCopyWith<$Res>? get extra;
}

/// @nodoc
class __$PHXListOptionDataCopyWithImpl<$Res>
    implements _$PHXListOptionDataCopyWith<$Res> {
  __$PHXListOptionDataCopyWithImpl(this._self, this._then);

  final _PHXListOptionData _self;
  final $Res Function(_PHXListOptionData) _then;

  /// Create a copy of PHXListOptionData
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
    return _then(_PHXListOptionData(
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
              as PHXExtraData?,
    ));
  }

  /// Create a copy of PHXListOptionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXExtraDataCopyWith<$Res>? get extra {
    if (_self.extra == null) {
      return null;
    }

    return $PHXExtraDataCopyWith<$Res>(_self.extra!, (value) {
      return _then(_self.copyWith(extra: value));
    });
  }
}

/// @nodoc
mixin _$PHXBottomActionData {
  @JsonKey(name: 'title')
  String? get title;
  @JsonKey(name: 'type')
  String? get type;
  @JsonKey(name: 'extra')
  PHXExtraData? get extra;
  @JsonKey(name: 'bottom_sheet')
  PHXBottomSheetData? get bottomSheet;
  @JsonKey(name: 'is_hidden_action')
  bool? get isHiddenAction;
  @JsonKey(name: 'is_show_sub_title')
  bool? get isShowSubTitle;
  @JsonKey(name: 'sub_title')
  String? get subTitle;
  @JsonKey(name: 'students')
  List<PHXStudentData>? get students;

  /// Create a copy of PHXBottomActionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXBottomActionDataCopyWith<PHXBottomActionData> get copyWith =>
      _$PHXBottomActionDataCopyWithImpl<PHXBottomActionData>(
          this as PHXBottomActionData, _$identity);

  /// Serializes this PHXBottomActionData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXBottomActionData &&
            (identical(other.title, title) || other.title == title) &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      type,
      extra,
      bottomSheet,
      isHiddenAction,
      isShowSubTitle,
      subTitle,
      const DeepCollectionEquality().hash(students));

  @override
  String toString() {
    return 'PHXBottomActionData(title: $title, type: $type, extra: $extra, bottomSheet: $bottomSheet, isHiddenAction: $isHiddenAction, isShowSubTitle: $isShowSubTitle, subTitle: $subTitle, students: $students)';
  }
}

/// @nodoc
abstract mixin class $PHXBottomActionDataCopyWith<$Res> {
  factory $PHXBottomActionDataCopyWith(
          PHXBottomActionData value, $Res Function(PHXBottomActionData) _then) =
      _$PHXBottomActionDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'extra') PHXExtraData? extra,
      @JsonKey(name: 'bottom_sheet') PHXBottomSheetData? bottomSheet,
      @JsonKey(name: 'is_hidden_action') bool? isHiddenAction,
      @JsonKey(name: 'is_show_sub_title') bool? isShowSubTitle,
      @JsonKey(name: 'sub_title') String? subTitle,
      @JsonKey(name: 'students') List<PHXStudentData>? students});

  $PHXExtraDataCopyWith<$Res>? get extra;
  $PHXBottomSheetDataCopyWith<$Res>? get bottomSheet;
}

/// @nodoc
class _$PHXBottomActionDataCopyWithImpl<$Res>
    implements $PHXBottomActionDataCopyWith<$Res> {
  _$PHXBottomActionDataCopyWithImpl(this._self, this._then);

  final PHXBottomActionData _self;
  final $Res Function(PHXBottomActionData) _then;

  /// Create a copy of PHXBottomActionData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
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
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      extra: freezed == extra
          ? _self.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as PHXExtraData?,
      bottomSheet: freezed == bottomSheet
          ? _self.bottomSheet
          : bottomSheet // ignore: cast_nullable_to_non_nullable
              as PHXBottomSheetData?,
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
              as List<PHXStudentData>?,
    ));
  }

  /// Create a copy of PHXBottomActionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXExtraDataCopyWith<$Res>? get extra {
    if (_self.extra == null) {
      return null;
    }

    return $PHXExtraDataCopyWith<$Res>(_self.extra!, (value) {
      return _then(_self.copyWith(extra: value));
    });
  }

  /// Create a copy of PHXBottomActionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXBottomSheetDataCopyWith<$Res>? get bottomSheet {
    if (_self.bottomSheet == null) {
      return null;
    }

    return $PHXBottomSheetDataCopyWith<$Res>(_self.bottomSheet!, (value) {
      return _then(_self.copyWith(bottomSheet: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PHXBottomActionData].
extension PHXBottomActionDataPatterns on PHXBottomActionData {
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
    TResult Function(_PHXBottomActionData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXBottomActionData() when $default != null:
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
    TResult Function(_PHXBottomActionData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXBottomActionData():
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
    TResult? Function(_PHXBottomActionData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXBottomActionData() when $default != null:
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
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'type') String? type,
            @JsonKey(name: 'extra') PHXExtraData? extra,
            @JsonKey(name: 'bottom_sheet') PHXBottomSheetData? bottomSheet,
            @JsonKey(name: 'is_hidden_action') bool? isHiddenAction,
            @JsonKey(name: 'is_show_sub_title') bool? isShowSubTitle,
            @JsonKey(name: 'sub_title') String? subTitle,
            @JsonKey(name: 'students') List<PHXStudentData>? students)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXBottomActionData() when $default != null:
        return $default(
            _that.title,
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
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'type') String? type,
            @JsonKey(name: 'extra') PHXExtraData? extra,
            @JsonKey(name: 'bottom_sheet') PHXBottomSheetData? bottomSheet,
            @JsonKey(name: 'is_hidden_action') bool? isHiddenAction,
            @JsonKey(name: 'is_show_sub_title') bool? isShowSubTitle,
            @JsonKey(name: 'sub_title') String? subTitle,
            @JsonKey(name: 'students') List<PHXStudentData>? students)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXBottomActionData():
        return $default(
            _that.title,
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
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'type') String? type,
            @JsonKey(name: 'extra') PHXExtraData? extra,
            @JsonKey(name: 'bottom_sheet') PHXBottomSheetData? bottomSheet,
            @JsonKey(name: 'is_hidden_action') bool? isHiddenAction,
            @JsonKey(name: 'is_show_sub_title') bool? isShowSubTitle,
            @JsonKey(name: 'sub_title') String? subTitle,
            @JsonKey(name: 'students') List<PHXStudentData>? students)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXBottomActionData() when $default != null:
        return $default(
            _that.title,
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

@JsonSerializable(explicitToJson: true)
class _PHXBottomActionData implements PHXBottomActionData {
  const _PHXBottomActionData(
      {@JsonKey(name: 'title') this.title,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'extra') this.extra,
      @JsonKey(name: 'bottom_sheet') this.bottomSheet,
      @JsonKey(name: 'is_hidden_action') this.isHiddenAction,
      @JsonKey(name: 'is_show_sub_title') this.isShowSubTitle,
      @JsonKey(name: 'sub_title') this.subTitle,
      @JsonKey(name: 'students') final List<PHXStudentData>? students})
      : _students = students;
  factory _PHXBottomActionData.fromJson(Map<String, dynamic> json) =>
      _$PHXBottomActionDataFromJson(json);

  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'extra')
  final PHXExtraData? extra;
  @override
  @JsonKey(name: 'bottom_sheet')
  final PHXBottomSheetData? bottomSheet;
  @override
  @JsonKey(name: 'is_hidden_action')
  final bool? isHiddenAction;
  @override
  @JsonKey(name: 'is_show_sub_title')
  final bool? isShowSubTitle;
  @override
  @JsonKey(name: 'sub_title')
  final String? subTitle;
  final List<PHXStudentData>? _students;
  @override
  @JsonKey(name: 'students')
  List<PHXStudentData>? get students {
    final value = _students;
    if (value == null) return null;
    if (_students is EqualUnmodifiableListView) return _students;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of PHXBottomActionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXBottomActionDataCopyWith<_PHXBottomActionData> get copyWith =>
      __$PHXBottomActionDataCopyWithImpl<_PHXBottomActionData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PHXBottomActionDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXBottomActionData &&
            (identical(other.title, title) || other.title == title) &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      type,
      extra,
      bottomSheet,
      isHiddenAction,
      isShowSubTitle,
      subTitle,
      const DeepCollectionEquality().hash(_students));

  @override
  String toString() {
    return 'PHXBottomActionData(title: $title, type: $type, extra: $extra, bottomSheet: $bottomSheet, isHiddenAction: $isHiddenAction, isShowSubTitle: $isShowSubTitle, subTitle: $subTitle, students: $students)';
  }
}

/// @nodoc
abstract mixin class _$PHXBottomActionDataCopyWith<$Res>
    implements $PHXBottomActionDataCopyWith<$Res> {
  factory _$PHXBottomActionDataCopyWith(_PHXBottomActionData value,
          $Res Function(_PHXBottomActionData) _then) =
      __$PHXBottomActionDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'extra') PHXExtraData? extra,
      @JsonKey(name: 'bottom_sheet') PHXBottomSheetData? bottomSheet,
      @JsonKey(name: 'is_hidden_action') bool? isHiddenAction,
      @JsonKey(name: 'is_show_sub_title') bool? isShowSubTitle,
      @JsonKey(name: 'sub_title') String? subTitle,
      @JsonKey(name: 'students') List<PHXStudentData>? students});

  @override
  $PHXExtraDataCopyWith<$Res>? get extra;
  @override
  $PHXBottomSheetDataCopyWith<$Res>? get bottomSheet;
}

/// @nodoc
class __$PHXBottomActionDataCopyWithImpl<$Res>
    implements _$PHXBottomActionDataCopyWith<$Res> {
  __$PHXBottomActionDataCopyWithImpl(this._self, this._then);

  final _PHXBottomActionData _self;
  final $Res Function(_PHXBottomActionData) _then;

  /// Create a copy of PHXBottomActionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? type = freezed,
    Object? extra = freezed,
    Object? bottomSheet = freezed,
    Object? isHiddenAction = freezed,
    Object? isShowSubTitle = freezed,
    Object? subTitle = freezed,
    Object? students = freezed,
  }) {
    return _then(_PHXBottomActionData(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      extra: freezed == extra
          ? _self.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as PHXExtraData?,
      bottomSheet: freezed == bottomSheet
          ? _self.bottomSheet
          : bottomSheet // ignore: cast_nullable_to_non_nullable
              as PHXBottomSheetData?,
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
              as List<PHXStudentData>?,
    ));
  }

  /// Create a copy of PHXBottomActionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXExtraDataCopyWith<$Res>? get extra {
    if (_self.extra == null) {
      return null;
    }

    return $PHXExtraDataCopyWith<$Res>(_self.extra!, (value) {
      return _then(_self.copyWith(extra: value));
    });
  }

  /// Create a copy of PHXBottomActionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXBottomSheetDataCopyWith<$Res>? get bottomSheet {
    if (_self.bottomSheet == null) {
      return null;
    }

    return $PHXBottomSheetDataCopyWith<$Res>(_self.bottomSheet!, (value) {
      return _then(_self.copyWith(bottomSheet: value));
    });
  }
}

/// @nodoc
mixin _$PHXDataModalContentData {
  @JsonKey(name: 'title')
  String? get title;
  @JsonKey(name: 'title_color')
  String? get titleColor;
  @JsonKey(name: 'content')
  String? get content;
  @JsonKey(name: 'show_divider')
  bool? get showDivider;
  @JsonKey(name: 'is_italics')
  bool? get isItalics;

  /// Create a copy of PHXDataModalContentData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXDataModalContentDataCopyWith<PHXDataModalContentData> get copyWith =>
      _$PHXDataModalContentDataCopyWithImpl<PHXDataModalContentData>(
          this as PHXDataModalContentData, _$identity);

  /// Serializes this PHXDataModalContentData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXDataModalContentData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.titleColor, titleColor) ||
                other.titleColor == titleColor) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.showDivider, showDivider) ||
                other.showDivider == showDivider) &&
            (identical(other.isItalics, isItalics) ||
                other.isItalics == isItalics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, titleColor, content, showDivider, isItalics);

  @override
  String toString() {
    return 'PHXDataModalContentData(title: $title, titleColor: $titleColor, content: $content, showDivider: $showDivider, isItalics: $isItalics)';
  }
}

/// @nodoc
abstract mixin class $PHXDataModalContentDataCopyWith<$Res> {
  factory $PHXDataModalContentDataCopyWith(PHXDataModalContentData value,
          $Res Function(PHXDataModalContentData) _then) =
      _$PHXDataModalContentDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'title_color') String? titleColor,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'show_divider') bool? showDivider,
      @JsonKey(name: 'is_italics') bool? isItalics});
}

/// @nodoc
class _$PHXDataModalContentDataCopyWithImpl<$Res>
    implements $PHXDataModalContentDataCopyWith<$Res> {
  _$PHXDataModalContentDataCopyWithImpl(this._self, this._then);

  final PHXDataModalContentData _self;
  final $Res Function(PHXDataModalContentData) _then;

  /// Create a copy of PHXDataModalContentData
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

/// Adds pattern-matching-related methods to [PHXDataModalContentData].
extension PHXDataModalContentDataPatterns on PHXDataModalContentData {
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
    TResult Function(_PHXDataModalContentData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalContentData() when $default != null:
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
    TResult Function(_PHXDataModalContentData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalContentData():
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
    TResult? Function(_PHXDataModalContentData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalContentData() when $default != null:
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
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'title_color') String? titleColor,
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'show_divider') bool? showDivider,
            @JsonKey(name: 'is_italics') bool? isItalics)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalContentData() when $default != null:
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
    TResult Function(
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'title_color') String? titleColor,
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'show_divider') bool? showDivider,
            @JsonKey(name: 'is_italics') bool? isItalics)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalContentData():
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
    TResult? Function(
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'title_color') String? titleColor,
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'show_divider') bool? showDivider,
            @JsonKey(name: 'is_italics') bool? isItalics)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalContentData() when $default != null:
        return $default(_that.title, _that.titleColor, _that.content,
            _that.showDivider, _that.isItalics);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PHXDataModalContentData implements PHXDataModalContentData {
  const _PHXDataModalContentData(
      {@JsonKey(name: 'title') this.title,
      @JsonKey(name: 'title_color') this.titleColor,
      @JsonKey(name: 'content') this.content,
      @JsonKey(name: 'show_divider') this.showDivider,
      @JsonKey(name: 'is_italics') this.isItalics});
  factory _PHXDataModalContentData.fromJson(Map<String, dynamic> json) =>
      _$PHXDataModalContentDataFromJson(json);

  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'title_color')
  final String? titleColor;
  @override
  @JsonKey(name: 'content')
  final String? content;
  @override
  @JsonKey(name: 'show_divider')
  final bool? showDivider;
  @override
  @JsonKey(name: 'is_italics')
  final bool? isItalics;

  /// Create a copy of PHXDataModalContentData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXDataModalContentDataCopyWith<_PHXDataModalContentData> get copyWith =>
      __$PHXDataModalContentDataCopyWithImpl<_PHXDataModalContentData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PHXDataModalContentDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXDataModalContentData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.titleColor, titleColor) ||
                other.titleColor == titleColor) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.showDivider, showDivider) ||
                other.showDivider == showDivider) &&
            (identical(other.isItalics, isItalics) ||
                other.isItalics == isItalics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, titleColor, content, showDivider, isItalics);

  @override
  String toString() {
    return 'PHXDataModalContentData(title: $title, titleColor: $titleColor, content: $content, showDivider: $showDivider, isItalics: $isItalics)';
  }
}

/// @nodoc
abstract mixin class _$PHXDataModalContentDataCopyWith<$Res>
    implements $PHXDataModalContentDataCopyWith<$Res> {
  factory _$PHXDataModalContentDataCopyWith(_PHXDataModalContentData value,
          $Res Function(_PHXDataModalContentData) _then) =
      __$PHXDataModalContentDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'title_color') String? titleColor,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'show_divider') bool? showDivider,
      @JsonKey(name: 'is_italics') bool? isItalics});
}

/// @nodoc
class __$PHXDataModalContentDataCopyWithImpl<$Res>
    implements _$PHXDataModalContentDataCopyWith<$Res> {
  __$PHXDataModalContentDataCopyWithImpl(this._self, this._then);

  final _PHXDataModalContentData _self;
  final $Res Function(_PHXDataModalContentData) _then;

  /// Create a copy of PHXDataModalContentData
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
    return _then(_PHXDataModalContentData(
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
mixin _$PHXDataModalTabData {
  @JsonKey(name: 'title')
  String? get title;
  @JsonKey(name: 'is_active')
  bool? get isActive;
  @JsonKey(name: 'id')
  int? get id;

  /// Create a copy of PHXDataModalTabData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXDataModalTabDataCopyWith<PHXDataModalTabData> get copyWith =>
      _$PHXDataModalTabDataCopyWithImpl<PHXDataModalTabData>(
          this as PHXDataModalTabData, _$identity);

  /// Serializes this PHXDataModalTabData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXDataModalTabData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, isActive, id);

  @override
  String toString() {
    return 'PHXDataModalTabData(title: $title, isActive: $isActive, id: $id)';
  }
}

/// @nodoc
abstract mixin class $PHXDataModalTabDataCopyWith<$Res> {
  factory $PHXDataModalTabDataCopyWith(
          PHXDataModalTabData value, $Res Function(PHXDataModalTabData) _then) =
      _$PHXDataModalTabDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'id') int? id});
}

/// @nodoc
class _$PHXDataModalTabDataCopyWithImpl<$Res>
    implements $PHXDataModalTabDataCopyWith<$Res> {
  _$PHXDataModalTabDataCopyWithImpl(this._self, this._then);

  final PHXDataModalTabData _self;
  final $Res Function(PHXDataModalTabData) _then;

  /// Create a copy of PHXDataModalTabData
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

/// Adds pattern-matching-related methods to [PHXDataModalTabData].
extension PHXDataModalTabDataPatterns on PHXDataModalTabData {
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
    TResult Function(_PHXDataModalTabData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalTabData() when $default != null:
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
    TResult Function(_PHXDataModalTabData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalTabData():
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
    TResult? Function(_PHXDataModalTabData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalTabData() when $default != null:
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
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'is_active') bool? isActive,
            @JsonKey(name: 'id') int? id)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalTabData() when $default != null:
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
    TResult Function(
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'is_active') bool? isActive,
            @JsonKey(name: 'id') int? id)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalTabData():
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
    TResult? Function(
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'is_active') bool? isActive,
            @JsonKey(name: 'id') int? id)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalTabData() when $default != null:
        return $default(_that.title, _that.isActive, _that.id);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PHXDataModalTabData implements PHXDataModalTabData {
  const _PHXDataModalTabData(
      {@JsonKey(name: 'title') this.title,
      @JsonKey(name: 'is_active') this.isActive,
      @JsonKey(name: 'id') this.id});
  factory _PHXDataModalTabData.fromJson(Map<String, dynamic> json) =>
      _$PHXDataModalTabDataFromJson(json);

  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @override
  @JsonKey(name: 'id')
  final int? id;

  /// Create a copy of PHXDataModalTabData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXDataModalTabDataCopyWith<_PHXDataModalTabData> get copyWith =>
      __$PHXDataModalTabDataCopyWithImpl<_PHXDataModalTabData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PHXDataModalTabDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXDataModalTabData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, isActive, id);

  @override
  String toString() {
    return 'PHXDataModalTabData(title: $title, isActive: $isActive, id: $id)';
  }
}

/// @nodoc
abstract mixin class _$PHXDataModalTabDataCopyWith<$Res>
    implements $PHXDataModalTabDataCopyWith<$Res> {
  factory _$PHXDataModalTabDataCopyWith(_PHXDataModalTabData value,
          $Res Function(_PHXDataModalTabData) _then) =
      __$PHXDataModalTabDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'id') int? id});
}

/// @nodoc
class __$PHXDataModalTabDataCopyWithImpl<$Res>
    implements _$PHXDataModalTabDataCopyWith<$Res> {
  __$PHXDataModalTabDataCopyWithImpl(this._self, this._then);

  final _PHXDataModalTabData _self;
  final $Res Function(_PHXDataModalTabData) _then;

  /// Create a copy of PHXDataModalTabData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? isActive = freezed,
    Object? id = freezed,
  }) {
    return _then(_PHXDataModalTabData(
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
mixin _$PHXDataModalData {
  @JsonKey(name: 'title')
  String? get title;
  @JsonKey(name: 'tabs')
  List<PHXDataModalTabData>? get tabs;
  @JsonKey(name: 'content')
  List<PHXDataModalContentData>? get content;

  /// Create a copy of PHXDataModalData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXDataModalDataCopyWith<PHXDataModalData> get copyWith =>
      _$PHXDataModalDataCopyWithImpl<PHXDataModalData>(
          this as PHXDataModalData, _$identity);

  /// Serializes this PHXDataModalData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXDataModalData &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other.tabs, tabs) &&
            const DeepCollectionEquality().equals(other.content, content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      const DeepCollectionEquality().hash(tabs),
      const DeepCollectionEquality().hash(content));

  @override
  String toString() {
    return 'PHXDataModalData(title: $title, tabs: $tabs, content: $content)';
  }
}

/// @nodoc
abstract mixin class $PHXDataModalDataCopyWith<$Res> {
  factory $PHXDataModalDataCopyWith(
          PHXDataModalData value, $Res Function(PHXDataModalData) _then) =
      _$PHXDataModalDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'tabs') List<PHXDataModalTabData>? tabs,
      @JsonKey(name: 'content') List<PHXDataModalContentData>? content});
}

/// @nodoc
class _$PHXDataModalDataCopyWithImpl<$Res>
    implements $PHXDataModalDataCopyWith<$Res> {
  _$PHXDataModalDataCopyWithImpl(this._self, this._then);

  final PHXDataModalData _self;
  final $Res Function(PHXDataModalData) _then;

  /// Create a copy of PHXDataModalData
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
              as List<PHXDataModalTabData>?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<PHXDataModalContentData>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PHXDataModalData].
extension PHXDataModalDataPatterns on PHXDataModalData {
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
    TResult Function(_PHXDataModalData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalData() when $default != null:
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
    TResult Function(_PHXDataModalData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalData():
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
    TResult? Function(_PHXDataModalData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalData() when $default != null:
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
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'tabs') List<PHXDataModalTabData>? tabs,
            @JsonKey(name: 'content') List<PHXDataModalContentData>? content)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalData() when $default != null:
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
    TResult Function(
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'tabs') List<PHXDataModalTabData>? tabs,
            @JsonKey(name: 'content') List<PHXDataModalContentData>? content)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalData():
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
    TResult? Function(
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'tabs') List<PHXDataModalTabData>? tabs,
            @JsonKey(name: 'content') List<PHXDataModalContentData>? content)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXDataModalData() when $default != null:
        return $default(_that.title, _that.tabs, _that.content);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PHXDataModalData implements PHXDataModalData {
  const _PHXDataModalData(
      {@JsonKey(name: 'title') this.title,
      @JsonKey(name: 'tabs') final List<PHXDataModalTabData>? tabs,
      @JsonKey(name: 'content') final List<PHXDataModalContentData>? content})
      : _tabs = tabs,
        _content = content;
  factory _PHXDataModalData.fromJson(Map<String, dynamic> json) =>
      _$PHXDataModalDataFromJson(json);

  @override
  @JsonKey(name: 'title')
  final String? title;
  final List<PHXDataModalTabData>? _tabs;
  @override
  @JsonKey(name: 'tabs')
  List<PHXDataModalTabData>? get tabs {
    final value = _tabs;
    if (value == null) return null;
    if (_tabs is EqualUnmodifiableListView) return _tabs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<PHXDataModalContentData>? _content;
  @override
  @JsonKey(name: 'content')
  List<PHXDataModalContentData>? get content {
    final value = _content;
    if (value == null) return null;
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of PHXDataModalData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXDataModalDataCopyWith<_PHXDataModalData> get copyWith =>
      __$PHXDataModalDataCopyWithImpl<_PHXDataModalData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PHXDataModalDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXDataModalData &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._tabs, _tabs) &&
            const DeepCollectionEquality().equals(other._content, _content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      const DeepCollectionEquality().hash(_tabs),
      const DeepCollectionEquality().hash(_content));

  @override
  String toString() {
    return 'PHXDataModalData(title: $title, tabs: $tabs, content: $content)';
  }
}

/// @nodoc
abstract mixin class _$PHXDataModalDataCopyWith<$Res>
    implements $PHXDataModalDataCopyWith<$Res> {
  factory _$PHXDataModalDataCopyWith(
          _PHXDataModalData value, $Res Function(_PHXDataModalData) _then) =
      __$PHXDataModalDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'tabs') List<PHXDataModalTabData>? tabs,
      @JsonKey(name: 'content') List<PHXDataModalContentData>? content});
}

/// @nodoc
class __$PHXDataModalDataCopyWithImpl<$Res>
    implements _$PHXDataModalDataCopyWith<$Res> {
  __$PHXDataModalDataCopyWithImpl(this._self, this._then);

  final _PHXDataModalData _self;
  final $Res Function(_PHXDataModalData) _then;

  /// Create a copy of PHXDataModalData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? tabs = freezed,
    Object? content = freezed,
  }) {
    return _then(_PHXDataModalData(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      tabs: freezed == tabs
          ? _self._tabs
          : tabs // ignore: cast_nullable_to_non_nullable
              as List<PHXDataModalTabData>?,
      content: freezed == content
          ? _self._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<PHXDataModalContentData>?,
    ));
  }
}

/// @nodoc
mixin _$PHXBottomSheetData {
  @JsonKey(name: 'sheet_title')
  String? get sheetTitle;
  @JsonKey(name: 'sheet_description')
  List<String>? get sheetDescription;
  @JsonKey(name: 'bottom_sheet_type')
  String? get bottomSheetType;
  @JsonKey(name: 'sheet_content')
  List<PHXBottomSheetContentData>? get sheetContent;

  /// Create a copy of PHXBottomSheetData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXBottomSheetDataCopyWith<PHXBottomSheetData> get copyWith =>
      _$PHXBottomSheetDataCopyWithImpl<PHXBottomSheetData>(
          this as PHXBottomSheetData, _$identity);

  /// Serializes this PHXBottomSheetData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXBottomSheetData &&
            (identical(other.sheetTitle, sheetTitle) ||
                other.sheetTitle == sheetTitle) &&
            const DeepCollectionEquality()
                .equals(other.sheetDescription, sheetDescription) &&
            (identical(other.bottomSheetType, bottomSheetType) ||
                other.bottomSheetType == bottomSheetType) &&
            const DeepCollectionEquality()
                .equals(other.sheetContent, sheetContent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sheetTitle,
      const DeepCollectionEquality().hash(sheetDescription),
      bottomSheetType,
      const DeepCollectionEquality().hash(sheetContent));

  @override
  String toString() {
    return 'PHXBottomSheetData(sheetTitle: $sheetTitle, sheetDescription: $sheetDescription, bottomSheetType: $bottomSheetType, sheetContent: $sheetContent)';
  }
}

/// @nodoc
abstract mixin class $PHXBottomSheetDataCopyWith<$Res> {
  factory $PHXBottomSheetDataCopyWith(
          PHXBottomSheetData value, $Res Function(PHXBottomSheetData) _then) =
      _$PHXBottomSheetDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'sheet_title') String? sheetTitle,
      @JsonKey(name: 'sheet_description') List<String>? sheetDescription,
      @JsonKey(name: 'bottom_sheet_type') String? bottomSheetType,
      @JsonKey(name: 'sheet_content')
      List<PHXBottomSheetContentData>? sheetContent});
}

/// @nodoc
class _$PHXBottomSheetDataCopyWithImpl<$Res>
    implements $PHXBottomSheetDataCopyWith<$Res> {
  _$PHXBottomSheetDataCopyWithImpl(this._self, this._then);

  final PHXBottomSheetData _self;
  final $Res Function(PHXBottomSheetData) _then;

  /// Create a copy of PHXBottomSheetData
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
              as List<PHXBottomSheetContentData>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PHXBottomSheetData].
extension PHXBottomSheetDataPatterns on PHXBottomSheetData {
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
    TResult Function(_PHXBottomSheetData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXBottomSheetData() when $default != null:
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
    TResult Function(_PHXBottomSheetData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXBottomSheetData():
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
    TResult? Function(_PHXBottomSheetData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXBottomSheetData() when $default != null:
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
            @JsonKey(name: 'sheet_title') String? sheetTitle,
            @JsonKey(name: 'sheet_description') List<String>? sheetDescription,
            @JsonKey(name: 'bottom_sheet_type') String? bottomSheetType,
            @JsonKey(name: 'sheet_content')
            List<PHXBottomSheetContentData>? sheetContent)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXBottomSheetData() when $default != null:
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
            @JsonKey(name: 'sheet_title') String? sheetTitle,
            @JsonKey(name: 'sheet_description') List<String>? sheetDescription,
            @JsonKey(name: 'bottom_sheet_type') String? bottomSheetType,
            @JsonKey(name: 'sheet_content')
            List<PHXBottomSheetContentData>? sheetContent)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXBottomSheetData():
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
            @JsonKey(name: 'sheet_title') String? sheetTitle,
            @JsonKey(name: 'sheet_description') List<String>? sheetDescription,
            @JsonKey(name: 'bottom_sheet_type') String? bottomSheetType,
            @JsonKey(name: 'sheet_content')
            List<PHXBottomSheetContentData>? sheetContent)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXBottomSheetData() when $default != null:
        return $default(_that.sheetTitle, _that.sheetDescription,
            _that.bottomSheetType, _that.sheetContent);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PHXBottomSheetData implements PHXBottomSheetData {
  const _PHXBottomSheetData(
      {@JsonKey(name: 'sheet_title') this.sheetTitle,
      @JsonKey(name: 'sheet_description') final List<String>? sheetDescription,
      @JsonKey(name: 'bottom_sheet_type') this.bottomSheetType,
      @JsonKey(name: 'sheet_content')
      final List<PHXBottomSheetContentData>? sheetContent})
      : _sheetDescription = sheetDescription,
        _sheetContent = sheetContent;
  factory _PHXBottomSheetData.fromJson(Map<String, dynamic> json) =>
      _$PHXBottomSheetDataFromJson(json);

  @override
  @JsonKey(name: 'sheet_title')
  final String? sheetTitle;
  final List<String>? _sheetDescription;
  @override
  @JsonKey(name: 'sheet_description')
  List<String>? get sheetDescription {
    final value = _sheetDescription;
    if (value == null) return null;
    if (_sheetDescription is EqualUnmodifiableListView)
      return _sheetDescription;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'bottom_sheet_type')
  final String? bottomSheetType;
  final List<PHXBottomSheetContentData>? _sheetContent;
  @override
  @JsonKey(name: 'sheet_content')
  List<PHXBottomSheetContentData>? get sheetContent {
    final value = _sheetContent;
    if (value == null) return null;
    if (_sheetContent is EqualUnmodifiableListView) return _sheetContent;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of PHXBottomSheetData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXBottomSheetDataCopyWith<_PHXBottomSheetData> get copyWith =>
      __$PHXBottomSheetDataCopyWithImpl<_PHXBottomSheetData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PHXBottomSheetDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXBottomSheetData &&
            (identical(other.sheetTitle, sheetTitle) ||
                other.sheetTitle == sheetTitle) &&
            const DeepCollectionEquality()
                .equals(other._sheetDescription, _sheetDescription) &&
            (identical(other.bottomSheetType, bottomSheetType) ||
                other.bottomSheetType == bottomSheetType) &&
            const DeepCollectionEquality()
                .equals(other._sheetContent, _sheetContent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sheetTitle,
      const DeepCollectionEquality().hash(_sheetDescription),
      bottomSheetType,
      const DeepCollectionEquality().hash(_sheetContent));

  @override
  String toString() {
    return 'PHXBottomSheetData(sheetTitle: $sheetTitle, sheetDescription: $sheetDescription, bottomSheetType: $bottomSheetType, sheetContent: $sheetContent)';
  }
}

/// @nodoc
abstract mixin class _$PHXBottomSheetDataCopyWith<$Res>
    implements $PHXBottomSheetDataCopyWith<$Res> {
  factory _$PHXBottomSheetDataCopyWith(
          _PHXBottomSheetData value, $Res Function(_PHXBottomSheetData) _then) =
      __$PHXBottomSheetDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'sheet_title') String? sheetTitle,
      @JsonKey(name: 'sheet_description') List<String>? sheetDescription,
      @JsonKey(name: 'bottom_sheet_type') String? bottomSheetType,
      @JsonKey(name: 'sheet_content')
      List<PHXBottomSheetContentData>? sheetContent});
}

/// @nodoc
class __$PHXBottomSheetDataCopyWithImpl<$Res>
    implements _$PHXBottomSheetDataCopyWith<$Res> {
  __$PHXBottomSheetDataCopyWithImpl(this._self, this._then);

  final _PHXBottomSheetData _self;
  final $Res Function(_PHXBottomSheetData) _then;

  /// Create a copy of PHXBottomSheetData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sheetTitle = freezed,
    Object? sheetDescription = freezed,
    Object? bottomSheetType = freezed,
    Object? sheetContent = freezed,
  }) {
    return _then(_PHXBottomSheetData(
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
              as List<PHXBottomSheetContentData>?,
    ));
  }
}

/// @nodoc
mixin _$PHXBottomSheetContentData {
  @JsonKey(name: 'id')
  int? get id;
  @JsonKey(name: 'title')
  String? get title;
  @JsonKey(name: 'sub_title')
  String? get subTitle;
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @JsonKey(name: 'content')
  String? get content;

  /// Create a copy of PHXBottomSheetContentData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXBottomSheetContentDataCopyWith<PHXBottomSheetContentData> get copyWith =>
      _$PHXBottomSheetContentDataCopyWithImpl<PHXBottomSheetContentData>(
          this as PHXBottomSheetContentData, _$identity);

  /// Serializes this PHXBottomSheetContentData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXBottomSheetContentData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, subTitle, imageUrl, content);

  @override
  String toString() {
    return 'PHXBottomSheetContentData(id: $id, title: $title, subTitle: $subTitle, imageUrl: $imageUrl, content: $content)';
  }
}

/// @nodoc
abstract mixin class $PHXBottomSheetContentDataCopyWith<$Res> {
  factory $PHXBottomSheetContentDataCopyWith(PHXBottomSheetContentData value,
          $Res Function(PHXBottomSheetContentData) _then) =
      _$PHXBottomSheetContentDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'sub_title') String? subTitle,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'content') String? content});
}

/// @nodoc
class _$PHXBottomSheetContentDataCopyWithImpl<$Res>
    implements $PHXBottomSheetContentDataCopyWith<$Res> {
  _$PHXBottomSheetContentDataCopyWithImpl(this._self, this._then);

  final PHXBottomSheetContentData _self;
  final $Res Function(PHXBottomSheetContentData) _then;

  /// Create a copy of PHXBottomSheetContentData
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

/// Adds pattern-matching-related methods to [PHXBottomSheetContentData].
extension PHXBottomSheetContentDataPatterns on PHXBottomSheetContentData {
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
    TResult Function(_PHXBottomSheetContentData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXBottomSheetContentData() when $default != null:
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
    TResult Function(_PHXBottomSheetContentData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXBottomSheetContentData():
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
    TResult? Function(_PHXBottomSheetContentData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXBottomSheetContentData() when $default != null:
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
            @JsonKey(name: 'id') int? id,
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'sub_title') String? subTitle,
            @JsonKey(name: 'image_url') String? imageUrl,
            @JsonKey(name: 'content') String? content)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXBottomSheetContentData() when $default != null:
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
    TResult Function(
            @JsonKey(name: 'id') int? id,
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'sub_title') String? subTitle,
            @JsonKey(name: 'image_url') String? imageUrl,
            @JsonKey(name: 'content') String? content)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXBottomSheetContentData():
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
    TResult? Function(
            @JsonKey(name: 'id') int? id,
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'sub_title') String? subTitle,
            @JsonKey(name: 'image_url') String? imageUrl,
            @JsonKey(name: 'content') String? content)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXBottomSheetContentData() when $default != null:
        return $default(_that.id, _that.title, _that.subTitle, _that.imageUrl,
            _that.content);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PHXBottomSheetContentData implements PHXBottomSheetContentData {
  const _PHXBottomSheetContentData(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'sub_title') this.subTitle,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'content') this.content});
  factory _PHXBottomSheetContentData.fromJson(Map<String, dynamic> json) =>
      _$PHXBottomSheetContentDataFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'sub_title')
  final String? subTitle;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'content')
  final String? content;

  /// Create a copy of PHXBottomSheetContentData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXBottomSheetContentDataCopyWith<_PHXBottomSheetContentData>
      get copyWith =>
          __$PHXBottomSheetContentDataCopyWithImpl<_PHXBottomSheetContentData>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PHXBottomSheetContentDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXBottomSheetContentData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, subTitle, imageUrl, content);

  @override
  String toString() {
    return 'PHXBottomSheetContentData(id: $id, title: $title, subTitle: $subTitle, imageUrl: $imageUrl, content: $content)';
  }
}

/// @nodoc
abstract mixin class _$PHXBottomSheetContentDataCopyWith<$Res>
    implements $PHXBottomSheetContentDataCopyWith<$Res> {
  factory _$PHXBottomSheetContentDataCopyWith(_PHXBottomSheetContentData value,
          $Res Function(_PHXBottomSheetContentData) _then) =
      __$PHXBottomSheetContentDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'sub_title') String? subTitle,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'content') String? content});
}

/// @nodoc
class __$PHXBottomSheetContentDataCopyWithImpl<$Res>
    implements _$PHXBottomSheetContentDataCopyWith<$Res> {
  __$PHXBottomSheetContentDataCopyWithImpl(this._self, this._then);

  final _PHXBottomSheetContentData _self;
  final $Res Function(_PHXBottomSheetContentData) _then;

  /// Create a copy of PHXBottomSheetContentData
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
    return _then(_PHXBottomSheetContentData(
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
mixin _$PHXExtraData {
  @JsonKey(name: 'teacher_id')
  int? get teacherId;
  @JsonKey(name: 'phone_number')
  String? get phoneNumber;
  @JsonKey(name: 'group_id')
  int? get groupId;
  @JsonKey(name: 'call_modal_data')
  bool? get callModalData;
  @JsonKey(name: 'data_modal')
  PHXDataModalData? get dataModal;
  @JsonKey(name: 'title_page')
  String? get titlePage;
  @JsonKey(name: 'sub_title_page')
  String? get subTitlePage;
  @JsonKey(name: 'show_divider')
  bool? get showDivider;
  @JsonKey(name: 'is_italics')
  bool? get isItalics;
  @JsonKey(name: 'student_code')
  String? get studentCode;
  @JsonKey(name: 'service_code')
  String? get serviceCode;
  @JsonKey(name: 'shift_code')
  String? get shiftCode;
  @JsonKey(name: 'body_cancel')
  BodyCancelData? get bodyCancel;
  @JsonKey(name: 'list_calendar')
  List<MonthCalendarData>? get listCalendar;
  @JsonKey(name: 'total_day_off')
  double? get totalDayOff;
  @JsonKey(name: 'mess_cancel_food')
  MessCancelFoodData? get messCancelFood;
  @JsonKey(name: 'title')
  String? get title;
  @JsonKey(name: 'content')
  String? get content;
  @JsonKey(name: 'banner')
  String? get banner;
  @JsonKey(name: 'status')
  List<PHXStatusLegendData>? get status;
  @JsonKey(name: 'info_banner')
  String? get infoBanner;
  @JsonKey(name: 'status_code')
  String? get statusCode;
  @JsonKey(name: 'student_id')
  int? get studentId;
  @JsonKey(name: 'school_year_id')
  int? get schoolYearId;
  @JsonKey(name: 'request_id')
  int? get requestId;
  @JsonKey(name: 'school_id')
  int? get schoolId;
  @JsonKey(name: 'list_month_register')
  List<PHXMonthData>? get listMonthRegister;
  @JsonKey(name: 'is_cancel_request')
  bool? get isCancelRequest;
  @JsonKey(name: 'educational_code')
  String? get educationalCode;
  @JsonKey(name: 'food_section_id')
  int? get foodSectionId;
  @JsonKey(name: 'start_date')
  String? get startDate;
  @JsonKey(name: 'end_date')
  String? get endDate;
  @JsonKey(name: 'menu_name')
  String? get menuName;
  @JsonKey(name: 'is_image_default')
  bool? get isImageDefault;
  @JsonKey(name: 'is_view_request_cancel')
  bool? get isViewRequestCancel;
  @JsonKey(name: 'request_cancel_id')
  int? get requestCancelId;
  @JsonKey(name: 'has_next_page')
  bool? get hasNextPage;
  @JsonKey(name: 'endCusor')
  String? get endCusor;
  @JsonKey(name: 'page')
  int? get page;
  @JsonKey(name: 'page_size')
  int? get pageSize;
  @JsonKey(name: 'school_term_id')
  int? get schoolTermId;
  @JsonKey(name: 'month_id')
  int? get monthId;
  @JsonKey(name: 'total')
  int? get total;
  @JsonKey(name: 'totalPage')
  int? get totalPage;
  @JsonKey(name: 'remaining')
  int? get remaining;
  @JsonKey(name: 'register_link')
  String? get registerLink;
  @JsonKey(name: 'navigator_button_name')
  String? get navigatorButtonName;
  @JsonKey(name: 'subject_id')
  int? get subjectId;
  @JsonKey(name: 'sub_lable')
  String? get subLable;

  /// Create a copy of PHXExtraData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXExtraDataCopyWith<PHXExtraData> get copyWith =>
      _$PHXExtraDataCopyWithImpl<PHXExtraData>(
          this as PHXExtraData, _$identity);

  /// Serializes this PHXExtraData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXExtraData &&
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
            (identical(other.endCusor, endCusor) ||
                other.endCusor == endCusor) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.schoolTermId, schoolTermId) ||
                other.schoolTermId == schoolTermId) &&
            (identical(other.monthId, monthId) || other.monthId == monthId) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage) &&
            (identical(other.remaining, remaining) ||
                other.remaining == remaining) &&
            (identical(other.registerLink, registerLink) ||
                other.registerLink == registerLink) &&
            (identical(other.navigatorButtonName, navigatorButtonName) ||
                other.navigatorButtonName == navigatorButtonName) &&
            (identical(other.subjectId, subjectId) ||
                other.subjectId == subjectId) &&
            (identical(other.subLable, subLable) ||
                other.subLable == subLable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
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
        endCusor,
        page,
        pageSize,
        schoolTermId,
        monthId,
        total,
        totalPage,
        remaining,
        registerLink,
        navigatorButtonName,
        subjectId,
        subLable
      ]);

  @override
  String toString() {
    return 'PHXExtraData(teacherId: $teacherId, phoneNumber: $phoneNumber, groupId: $groupId, callModalData: $callModalData, dataModal: $dataModal, titlePage: $titlePage, subTitlePage: $subTitlePage, showDivider: $showDivider, isItalics: $isItalics, studentCode: $studentCode, serviceCode: $serviceCode, shiftCode: $shiftCode, bodyCancel: $bodyCancel, listCalendar: $listCalendar, totalDayOff: $totalDayOff, messCancelFood: $messCancelFood, title: $title, content: $content, banner: $banner, status: $status, infoBanner: $infoBanner, statusCode: $statusCode, studentId: $studentId, schoolYearId: $schoolYearId, requestId: $requestId, schoolId: $schoolId, listMonthRegister: $listMonthRegister, isCancelRequest: $isCancelRequest, educationalCode: $educationalCode, foodSectionId: $foodSectionId, startDate: $startDate, endDate: $endDate, menuName: $menuName, isImageDefault: $isImageDefault, isViewRequestCancel: $isViewRequestCancel, requestCancelId: $requestCancelId, hasNextPage: $hasNextPage, endCusor: $endCusor, page: $page, pageSize: $pageSize, schoolTermId: $schoolTermId, monthId: $monthId, total: $total, totalPage: $totalPage, remaining: $remaining, registerLink: $registerLink, navigatorButtonName: $navigatorButtonName, subjectId: $subjectId, subLable: $subLable)';
  }
}

/// @nodoc
abstract mixin class $PHXExtraDataCopyWith<$Res> {
  factory $PHXExtraDataCopyWith(
          PHXExtraData value, $Res Function(PHXExtraData) _then) =
      _$PHXExtraDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'teacher_id') int? teacherId,
      @JsonKey(name: 'phone_number') String? phoneNumber,
      @JsonKey(name: 'group_id') int? groupId,
      @JsonKey(name: 'call_modal_data') bool? callModalData,
      @JsonKey(name: 'data_modal') PHXDataModalData? dataModal,
      @JsonKey(name: 'title_page') String? titlePage,
      @JsonKey(name: 'sub_title_page') String? subTitlePage,
      @JsonKey(name: 'show_divider') bool? showDivider,
      @JsonKey(name: 'is_italics') bool? isItalics,
      @JsonKey(name: 'student_code') String? studentCode,
      @JsonKey(name: 'service_code') String? serviceCode,
      @JsonKey(name: 'shift_code') String? shiftCode,
      @JsonKey(name: 'body_cancel') BodyCancelData? bodyCancel,
      @JsonKey(name: 'list_calendar') List<MonthCalendarData>? listCalendar,
      @JsonKey(name: 'total_day_off') double? totalDayOff,
      @JsonKey(name: 'mess_cancel_food') MessCancelFoodData? messCancelFood,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'banner') String? banner,
      @JsonKey(name: 'status') List<PHXStatusLegendData>? status,
      @JsonKey(name: 'info_banner') String? infoBanner,
      @JsonKey(name: 'status_code') String? statusCode,
      @JsonKey(name: 'student_id') int? studentId,
      @JsonKey(name: 'school_year_id') int? schoolYearId,
      @JsonKey(name: 'request_id') int? requestId,
      @JsonKey(name: 'school_id') int? schoolId,
      @JsonKey(name: 'list_month_register')
      List<PHXMonthData>? listMonthRegister,
      @JsonKey(name: 'is_cancel_request') bool? isCancelRequest,
      @JsonKey(name: 'educational_code') String? educationalCode,
      @JsonKey(name: 'food_section_id') int? foodSectionId,
      @JsonKey(name: 'start_date') String? startDate,
      @JsonKey(name: 'end_date') String? endDate,
      @JsonKey(name: 'menu_name') String? menuName,
      @JsonKey(name: 'is_image_default') bool? isImageDefault,
      @JsonKey(name: 'is_view_request_cancel') bool? isViewRequestCancel,
      @JsonKey(name: 'request_cancel_id') int? requestCancelId,
      @JsonKey(name: 'has_next_page') bool? hasNextPage,
      @JsonKey(name: 'endCusor') String? endCusor,
      @JsonKey(name: 'page') int? page,
      @JsonKey(name: 'page_size') int? pageSize,
      @JsonKey(name: 'school_term_id') int? schoolTermId,
      @JsonKey(name: 'month_id') int? monthId,
      @JsonKey(name: 'total') int? total,
      @JsonKey(name: 'totalPage') int? totalPage,
      @JsonKey(name: 'remaining') int? remaining,
      @JsonKey(name: 'register_link') String? registerLink,
      @JsonKey(name: 'navigator_button_name') String? navigatorButtonName,
      @JsonKey(name: 'subject_id') int? subjectId,
      @JsonKey(name: 'sub_lable') String? subLable});

  $PHXDataModalDataCopyWith<$Res>? get dataModal;
  $BodyCancelDataCopyWith<$Res>? get bodyCancel;
  $MessCancelFoodDataCopyWith<$Res>? get messCancelFood;
}

/// @nodoc
class _$PHXExtraDataCopyWithImpl<$Res> implements $PHXExtraDataCopyWith<$Res> {
  _$PHXExtraDataCopyWithImpl(this._self, this._then);

  final PHXExtraData _self;
  final $Res Function(PHXExtraData) _then;

  /// Create a copy of PHXExtraData
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
    Object? endCusor = freezed,
    Object? page = freezed,
    Object? pageSize = freezed,
    Object? schoolTermId = freezed,
    Object? monthId = freezed,
    Object? total = freezed,
    Object? totalPage = freezed,
    Object? remaining = freezed,
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
              as PHXDataModalData?,
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
              as BodyCancelData?,
      listCalendar: freezed == listCalendar
          ? _self.listCalendar
          : listCalendar // ignore: cast_nullable_to_non_nullable
              as List<MonthCalendarData>?,
      totalDayOff: freezed == totalDayOff
          ? _self.totalDayOff
          : totalDayOff // ignore: cast_nullable_to_non_nullable
              as double?,
      messCancelFood: freezed == messCancelFood
          ? _self.messCancelFood
          : messCancelFood // ignore: cast_nullable_to_non_nullable
              as MessCancelFoodData?,
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
              as List<PHXStatusLegendData>?,
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
              as List<PHXMonthData>?,
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
      endCusor: freezed == endCusor
          ? _self.endCusor
          : endCusor // ignore: cast_nullable_to_non_nullable
              as String?,
      page: freezed == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSize: freezed == pageSize
          ? _self.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      schoolTermId: freezed == schoolTermId
          ? _self.schoolTermId
          : schoolTermId // ignore: cast_nullable_to_non_nullable
              as int?,
      monthId: freezed == monthId
          ? _self.monthId
          : monthId // ignore: cast_nullable_to_non_nullable
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

  /// Create a copy of PHXExtraData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXDataModalDataCopyWith<$Res>? get dataModal {
    if (_self.dataModal == null) {
      return null;
    }

    return $PHXDataModalDataCopyWith<$Res>(_self.dataModal!, (value) {
      return _then(_self.copyWith(dataModal: value));
    });
  }

  /// Create a copy of PHXExtraData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BodyCancelDataCopyWith<$Res>? get bodyCancel {
    if (_self.bodyCancel == null) {
      return null;
    }

    return $BodyCancelDataCopyWith<$Res>(_self.bodyCancel!, (value) {
      return _then(_self.copyWith(bodyCancel: value));
    });
  }

  /// Create a copy of PHXExtraData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessCancelFoodDataCopyWith<$Res>? get messCancelFood {
    if (_self.messCancelFood == null) {
      return null;
    }

    return $MessCancelFoodDataCopyWith<$Res>(_self.messCancelFood!, (value) {
      return _then(_self.copyWith(messCancelFood: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PHXExtraData].
extension PHXExtraDataPatterns on PHXExtraData {
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
    TResult Function(_PHXExtraData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXExtraData() when $default != null:
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
    TResult Function(_PHXExtraData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXExtraData():
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
    TResult? Function(_PHXExtraData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXExtraData() when $default != null:
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
            @JsonKey(name: 'teacher_id') int? teacherId,
            @JsonKey(name: 'phone_number') String? phoneNumber,
            @JsonKey(name: 'group_id') int? groupId,
            @JsonKey(name: 'call_modal_data') bool? callModalData,
            @JsonKey(name: 'data_modal') PHXDataModalData? dataModal,
            @JsonKey(name: 'title_page') String? titlePage,
            @JsonKey(name: 'sub_title_page') String? subTitlePage,
            @JsonKey(name: 'show_divider') bool? showDivider,
            @JsonKey(name: 'is_italics') bool? isItalics,
            @JsonKey(name: 'student_code') String? studentCode,
            @JsonKey(name: 'service_code') String? serviceCode,
            @JsonKey(name: 'shift_code') String? shiftCode,
            @JsonKey(name: 'body_cancel') BodyCancelData? bodyCancel,
            @JsonKey(name: 'list_calendar')
            List<MonthCalendarData>? listCalendar,
            @JsonKey(name: 'total_day_off') double? totalDayOff,
            @JsonKey(name: 'mess_cancel_food')
            MessCancelFoodData? messCancelFood,
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'banner') String? banner,
            @JsonKey(name: 'status') List<PHXStatusLegendData>? status,
            @JsonKey(name: 'info_banner') String? infoBanner,
            @JsonKey(name: 'status_code') String? statusCode,
            @JsonKey(name: 'student_id') int? studentId,
            @JsonKey(name: 'school_year_id') int? schoolYearId,
            @JsonKey(name: 'request_id') int? requestId,
            @JsonKey(name: 'school_id') int? schoolId,
            @JsonKey(name: 'list_month_register')
            List<PHXMonthData>? listMonthRegister,
            @JsonKey(name: 'is_cancel_request') bool? isCancelRequest,
            @JsonKey(name: 'educational_code') String? educationalCode,
            @JsonKey(name: 'food_section_id') int? foodSectionId,
            @JsonKey(name: 'start_date') String? startDate,
            @JsonKey(name: 'end_date') String? endDate,
            @JsonKey(name: 'menu_name') String? menuName,
            @JsonKey(name: 'is_image_default') bool? isImageDefault,
            @JsonKey(name: 'is_view_request_cancel') bool? isViewRequestCancel,
            @JsonKey(name: 'request_cancel_id') int? requestCancelId,
            @JsonKey(name: 'has_next_page') bool? hasNextPage,
            @JsonKey(name: 'endCusor') String? endCusor,
            @JsonKey(name: 'page') int? page,
            @JsonKey(name: 'page_size') int? pageSize,
            @JsonKey(name: 'school_term_id') int? schoolTermId,
            @JsonKey(name: 'month_id') int? monthId,
            @JsonKey(name: 'total') int? total,
            @JsonKey(name: 'totalPage') int? totalPage,
            @JsonKey(name: 'remaining') int? remaining,
            @JsonKey(name: 'register_link') String? registerLink,
            @JsonKey(name: 'navigator_button_name') String? navigatorButtonName,
            @JsonKey(name: 'subject_id') int? subjectId,
            @JsonKey(name: 'sub_lable') String? subLable)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXExtraData() when $default != null:
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
            _that.endCusor,
            _that.page,
            _that.pageSize,
            _that.schoolTermId,
            _that.monthId,
            _that.total,
            _that.totalPage,
            _that.remaining,
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
            @JsonKey(name: 'teacher_id') int? teacherId,
            @JsonKey(name: 'phone_number') String? phoneNumber,
            @JsonKey(name: 'group_id') int? groupId,
            @JsonKey(name: 'call_modal_data') bool? callModalData,
            @JsonKey(name: 'data_modal') PHXDataModalData? dataModal,
            @JsonKey(name: 'title_page') String? titlePage,
            @JsonKey(name: 'sub_title_page') String? subTitlePage,
            @JsonKey(name: 'show_divider') bool? showDivider,
            @JsonKey(name: 'is_italics') bool? isItalics,
            @JsonKey(name: 'student_code') String? studentCode,
            @JsonKey(name: 'service_code') String? serviceCode,
            @JsonKey(name: 'shift_code') String? shiftCode,
            @JsonKey(name: 'body_cancel') BodyCancelData? bodyCancel,
            @JsonKey(name: 'list_calendar')
            List<MonthCalendarData>? listCalendar,
            @JsonKey(name: 'total_day_off') double? totalDayOff,
            @JsonKey(name: 'mess_cancel_food')
            MessCancelFoodData? messCancelFood,
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'banner') String? banner,
            @JsonKey(name: 'status') List<PHXStatusLegendData>? status,
            @JsonKey(name: 'info_banner') String? infoBanner,
            @JsonKey(name: 'status_code') String? statusCode,
            @JsonKey(name: 'student_id') int? studentId,
            @JsonKey(name: 'school_year_id') int? schoolYearId,
            @JsonKey(name: 'request_id') int? requestId,
            @JsonKey(name: 'school_id') int? schoolId,
            @JsonKey(name: 'list_month_register')
            List<PHXMonthData>? listMonthRegister,
            @JsonKey(name: 'is_cancel_request') bool? isCancelRequest,
            @JsonKey(name: 'educational_code') String? educationalCode,
            @JsonKey(name: 'food_section_id') int? foodSectionId,
            @JsonKey(name: 'start_date') String? startDate,
            @JsonKey(name: 'end_date') String? endDate,
            @JsonKey(name: 'menu_name') String? menuName,
            @JsonKey(name: 'is_image_default') bool? isImageDefault,
            @JsonKey(name: 'is_view_request_cancel') bool? isViewRequestCancel,
            @JsonKey(name: 'request_cancel_id') int? requestCancelId,
            @JsonKey(name: 'has_next_page') bool? hasNextPage,
            @JsonKey(name: 'endCusor') String? endCusor,
            @JsonKey(name: 'page') int? page,
            @JsonKey(name: 'page_size') int? pageSize,
            @JsonKey(name: 'school_term_id') int? schoolTermId,
            @JsonKey(name: 'month_id') int? monthId,
            @JsonKey(name: 'total') int? total,
            @JsonKey(name: 'totalPage') int? totalPage,
            @JsonKey(name: 'remaining') int? remaining,
            @JsonKey(name: 'register_link') String? registerLink,
            @JsonKey(name: 'navigator_button_name') String? navigatorButtonName,
            @JsonKey(name: 'subject_id') int? subjectId,
            @JsonKey(name: 'sub_lable') String? subLable)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXExtraData():
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
            _that.endCusor,
            _that.page,
            _that.pageSize,
            _that.schoolTermId,
            _that.monthId,
            _that.total,
            _that.totalPage,
            _that.remaining,
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
            @JsonKey(name: 'teacher_id') int? teacherId,
            @JsonKey(name: 'phone_number') String? phoneNumber,
            @JsonKey(name: 'group_id') int? groupId,
            @JsonKey(name: 'call_modal_data') bool? callModalData,
            @JsonKey(name: 'data_modal') PHXDataModalData? dataModal,
            @JsonKey(name: 'title_page') String? titlePage,
            @JsonKey(name: 'sub_title_page') String? subTitlePage,
            @JsonKey(name: 'show_divider') bool? showDivider,
            @JsonKey(name: 'is_italics') bool? isItalics,
            @JsonKey(name: 'student_code') String? studentCode,
            @JsonKey(name: 'service_code') String? serviceCode,
            @JsonKey(name: 'shift_code') String? shiftCode,
            @JsonKey(name: 'body_cancel') BodyCancelData? bodyCancel,
            @JsonKey(name: 'list_calendar')
            List<MonthCalendarData>? listCalendar,
            @JsonKey(name: 'total_day_off') double? totalDayOff,
            @JsonKey(name: 'mess_cancel_food')
            MessCancelFoodData? messCancelFood,
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'banner') String? banner,
            @JsonKey(name: 'status') List<PHXStatusLegendData>? status,
            @JsonKey(name: 'info_banner') String? infoBanner,
            @JsonKey(name: 'status_code') String? statusCode,
            @JsonKey(name: 'student_id') int? studentId,
            @JsonKey(name: 'school_year_id') int? schoolYearId,
            @JsonKey(name: 'request_id') int? requestId,
            @JsonKey(name: 'school_id') int? schoolId,
            @JsonKey(name: 'list_month_register')
            List<PHXMonthData>? listMonthRegister,
            @JsonKey(name: 'is_cancel_request') bool? isCancelRequest,
            @JsonKey(name: 'educational_code') String? educationalCode,
            @JsonKey(name: 'food_section_id') int? foodSectionId,
            @JsonKey(name: 'start_date') String? startDate,
            @JsonKey(name: 'end_date') String? endDate,
            @JsonKey(name: 'menu_name') String? menuName,
            @JsonKey(name: 'is_image_default') bool? isImageDefault,
            @JsonKey(name: 'is_view_request_cancel') bool? isViewRequestCancel,
            @JsonKey(name: 'request_cancel_id') int? requestCancelId,
            @JsonKey(name: 'has_next_page') bool? hasNextPage,
            @JsonKey(name: 'endCusor') String? endCusor,
            @JsonKey(name: 'page') int? page,
            @JsonKey(name: 'page_size') int? pageSize,
            @JsonKey(name: 'school_term_id') int? schoolTermId,
            @JsonKey(name: 'month_id') int? monthId,
            @JsonKey(name: 'total') int? total,
            @JsonKey(name: 'totalPage') int? totalPage,
            @JsonKey(name: 'remaining') int? remaining,
            @JsonKey(name: 'register_link') String? registerLink,
            @JsonKey(name: 'navigator_button_name') String? navigatorButtonName,
            @JsonKey(name: 'subject_id') int? subjectId,
            @JsonKey(name: 'sub_lable') String? subLable)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXExtraData() when $default != null:
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
            _that.endCusor,
            _that.page,
            _that.pageSize,
            _that.schoolTermId,
            _that.monthId,
            _that.total,
            _that.totalPage,
            _that.remaining,
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

@JsonSerializable(explicitToJson: true)
class _PHXExtraData implements PHXExtraData {
  const _PHXExtraData(
      {@JsonKey(name: 'teacher_id') this.teacherId,
      @JsonKey(name: 'phone_number') this.phoneNumber,
      @JsonKey(name: 'group_id') this.groupId,
      @JsonKey(name: 'call_modal_data') this.callModalData,
      @JsonKey(name: 'data_modal') this.dataModal,
      @JsonKey(name: 'title_page') this.titlePage,
      @JsonKey(name: 'sub_title_page') this.subTitlePage,
      @JsonKey(name: 'show_divider') this.showDivider,
      @JsonKey(name: 'is_italics') this.isItalics,
      @JsonKey(name: 'student_code') this.studentCode,
      @JsonKey(name: 'service_code') this.serviceCode,
      @JsonKey(name: 'shift_code') this.shiftCode,
      @JsonKey(name: 'body_cancel') this.bodyCancel,
      @JsonKey(name: 'list_calendar')
      final List<MonthCalendarData>? listCalendar,
      @JsonKey(name: 'total_day_off') this.totalDayOff,
      @JsonKey(name: 'mess_cancel_food') this.messCancelFood,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'content') this.content,
      @JsonKey(name: 'banner') this.banner,
      @JsonKey(name: 'status') final List<PHXStatusLegendData>? status,
      @JsonKey(name: 'info_banner') this.infoBanner,
      @JsonKey(name: 'status_code') this.statusCode,
      @JsonKey(name: 'student_id') this.studentId,
      @JsonKey(name: 'school_year_id') this.schoolYearId,
      @JsonKey(name: 'request_id') this.requestId,
      @JsonKey(name: 'school_id') this.schoolId,
      @JsonKey(name: 'list_month_register')
      final List<PHXMonthData>? listMonthRegister,
      @JsonKey(name: 'is_cancel_request') this.isCancelRequest,
      @JsonKey(name: 'educational_code') this.educationalCode,
      @JsonKey(name: 'food_section_id') this.foodSectionId,
      @JsonKey(name: 'start_date') this.startDate,
      @JsonKey(name: 'end_date') this.endDate,
      @JsonKey(name: 'menu_name') this.menuName,
      @JsonKey(name: 'is_image_default') this.isImageDefault,
      @JsonKey(name: 'is_view_request_cancel') this.isViewRequestCancel,
      @JsonKey(name: 'request_cancel_id') this.requestCancelId,
      @JsonKey(name: 'has_next_page') this.hasNextPage,
      @JsonKey(name: 'endCusor') this.endCusor,
      @JsonKey(name: 'page') this.page,
      @JsonKey(name: 'page_size') this.pageSize,
      @JsonKey(name: 'school_term_id') this.schoolTermId,
      @JsonKey(name: 'month_id') this.monthId,
      @JsonKey(name: 'total') this.total,
      @JsonKey(name: 'totalPage') this.totalPage,
      @JsonKey(name: 'remaining') this.remaining,
      @JsonKey(name: 'register_link') this.registerLink,
      @JsonKey(name: 'navigator_button_name') this.navigatorButtonName,
      @JsonKey(name: 'subject_id') this.subjectId,
      @JsonKey(name: 'sub_lable') this.subLable})
      : _listCalendar = listCalendar,
        _status = status,
        _listMonthRegister = listMonthRegister;
  factory _PHXExtraData.fromJson(Map<String, dynamic> json) =>
      _$PHXExtraDataFromJson(json);

  @override
  @JsonKey(name: 'teacher_id')
  final int? teacherId;
  @override
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @override
  @JsonKey(name: 'group_id')
  final int? groupId;
  @override
  @JsonKey(name: 'call_modal_data')
  final bool? callModalData;
  @override
  @JsonKey(name: 'data_modal')
  final PHXDataModalData? dataModal;
  @override
  @JsonKey(name: 'title_page')
  final String? titlePage;
  @override
  @JsonKey(name: 'sub_title_page')
  final String? subTitlePage;
  @override
  @JsonKey(name: 'show_divider')
  final bool? showDivider;
  @override
  @JsonKey(name: 'is_italics')
  final bool? isItalics;
  @override
  @JsonKey(name: 'student_code')
  final String? studentCode;
  @override
  @JsonKey(name: 'service_code')
  final String? serviceCode;
  @override
  @JsonKey(name: 'shift_code')
  final String? shiftCode;
  @override
  @JsonKey(name: 'body_cancel')
  final BodyCancelData? bodyCancel;
  final List<MonthCalendarData>? _listCalendar;
  @override
  @JsonKey(name: 'list_calendar')
  List<MonthCalendarData>? get listCalendar {
    final value = _listCalendar;
    if (value == null) return null;
    if (_listCalendar is EqualUnmodifiableListView) return _listCalendar;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'total_day_off')
  final double? totalDayOff;
  @override
  @JsonKey(name: 'mess_cancel_food')
  final MessCancelFoodData? messCancelFood;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'content')
  final String? content;
  @override
  @JsonKey(name: 'banner')
  final String? banner;
  final List<PHXStatusLegendData>? _status;
  @override
  @JsonKey(name: 'status')
  List<PHXStatusLegendData>? get status {
    final value = _status;
    if (value == null) return null;
    if (_status is EqualUnmodifiableListView) return _status;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'info_banner')
  final String? infoBanner;
  @override
  @JsonKey(name: 'status_code')
  final String? statusCode;
  @override
  @JsonKey(name: 'student_id')
  final int? studentId;
  @override
  @JsonKey(name: 'school_year_id')
  final int? schoolYearId;
  @override
  @JsonKey(name: 'request_id')
  final int? requestId;
  @override
  @JsonKey(name: 'school_id')
  final int? schoolId;
  final List<PHXMonthData>? _listMonthRegister;
  @override
  @JsonKey(name: 'list_month_register')
  List<PHXMonthData>? get listMonthRegister {
    final value = _listMonthRegister;
    if (value == null) return null;
    if (_listMonthRegister is EqualUnmodifiableListView)
      return _listMonthRegister;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'is_cancel_request')
  final bool? isCancelRequest;
  @override
  @JsonKey(name: 'educational_code')
  final String? educationalCode;
  @override
  @JsonKey(name: 'food_section_id')
  final int? foodSectionId;
  @override
  @JsonKey(name: 'start_date')
  final String? startDate;
  @override
  @JsonKey(name: 'end_date')
  final String? endDate;
  @override
  @JsonKey(name: 'menu_name')
  final String? menuName;
  @override
  @JsonKey(name: 'is_image_default')
  final bool? isImageDefault;
  @override
  @JsonKey(name: 'is_view_request_cancel')
  final bool? isViewRequestCancel;
  @override
  @JsonKey(name: 'request_cancel_id')
  final int? requestCancelId;
  @override
  @JsonKey(name: 'has_next_page')
  final bool? hasNextPage;
  @override
  @JsonKey(name: 'endCusor')
  final String? endCusor;
  @override
  @JsonKey(name: 'page')
  final int? page;
  @override
  @JsonKey(name: 'page_size')
  final int? pageSize;
  @override
  @JsonKey(name: 'school_term_id')
  final int? schoolTermId;
  @override
  @JsonKey(name: 'month_id')
  final int? monthId;
  @override
  @JsonKey(name: 'total')
  final int? total;
  @override
  @JsonKey(name: 'totalPage')
  final int? totalPage;
  @override
  @JsonKey(name: 'remaining')
  final int? remaining;
  @override
  @JsonKey(name: 'register_link')
  final String? registerLink;
  @override
  @JsonKey(name: 'navigator_button_name')
  final String? navigatorButtonName;
  @override
  @JsonKey(name: 'subject_id')
  final int? subjectId;
  @override
  @JsonKey(name: 'sub_lable')
  final String? subLable;

  /// Create a copy of PHXExtraData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXExtraDataCopyWith<_PHXExtraData> get copyWith =>
      __$PHXExtraDataCopyWithImpl<_PHXExtraData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PHXExtraDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXExtraData &&
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
            (identical(other.endCusor, endCusor) ||
                other.endCusor == endCusor) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.schoolTermId, schoolTermId) ||
                other.schoolTermId == schoolTermId) &&
            (identical(other.monthId, monthId) || other.monthId == monthId) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage) &&
            (identical(other.remaining, remaining) ||
                other.remaining == remaining) &&
            (identical(other.registerLink, registerLink) ||
                other.registerLink == registerLink) &&
            (identical(other.navigatorButtonName, navigatorButtonName) ||
                other.navigatorButtonName == navigatorButtonName) &&
            (identical(other.subjectId, subjectId) ||
                other.subjectId == subjectId) &&
            (identical(other.subLable, subLable) ||
                other.subLable == subLable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
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
        endCusor,
        page,
        pageSize,
        schoolTermId,
        monthId,
        total,
        totalPage,
        remaining,
        registerLink,
        navigatorButtonName,
        subjectId,
        subLable
      ]);

  @override
  String toString() {
    return 'PHXExtraData(teacherId: $teacherId, phoneNumber: $phoneNumber, groupId: $groupId, callModalData: $callModalData, dataModal: $dataModal, titlePage: $titlePage, subTitlePage: $subTitlePage, showDivider: $showDivider, isItalics: $isItalics, studentCode: $studentCode, serviceCode: $serviceCode, shiftCode: $shiftCode, bodyCancel: $bodyCancel, listCalendar: $listCalendar, totalDayOff: $totalDayOff, messCancelFood: $messCancelFood, title: $title, content: $content, banner: $banner, status: $status, infoBanner: $infoBanner, statusCode: $statusCode, studentId: $studentId, schoolYearId: $schoolYearId, requestId: $requestId, schoolId: $schoolId, listMonthRegister: $listMonthRegister, isCancelRequest: $isCancelRequest, educationalCode: $educationalCode, foodSectionId: $foodSectionId, startDate: $startDate, endDate: $endDate, menuName: $menuName, isImageDefault: $isImageDefault, isViewRequestCancel: $isViewRequestCancel, requestCancelId: $requestCancelId, hasNextPage: $hasNextPage, endCusor: $endCusor, page: $page, pageSize: $pageSize, schoolTermId: $schoolTermId, monthId: $monthId, total: $total, totalPage: $totalPage, remaining: $remaining, registerLink: $registerLink, navigatorButtonName: $navigatorButtonName, subjectId: $subjectId, subLable: $subLable)';
  }
}

/// @nodoc
abstract mixin class _$PHXExtraDataCopyWith<$Res>
    implements $PHXExtraDataCopyWith<$Res> {
  factory _$PHXExtraDataCopyWith(
          _PHXExtraData value, $Res Function(_PHXExtraData) _then) =
      __$PHXExtraDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'teacher_id') int? teacherId,
      @JsonKey(name: 'phone_number') String? phoneNumber,
      @JsonKey(name: 'group_id') int? groupId,
      @JsonKey(name: 'call_modal_data') bool? callModalData,
      @JsonKey(name: 'data_modal') PHXDataModalData? dataModal,
      @JsonKey(name: 'title_page') String? titlePage,
      @JsonKey(name: 'sub_title_page') String? subTitlePage,
      @JsonKey(name: 'show_divider') bool? showDivider,
      @JsonKey(name: 'is_italics') bool? isItalics,
      @JsonKey(name: 'student_code') String? studentCode,
      @JsonKey(name: 'service_code') String? serviceCode,
      @JsonKey(name: 'shift_code') String? shiftCode,
      @JsonKey(name: 'body_cancel') BodyCancelData? bodyCancel,
      @JsonKey(name: 'list_calendar') List<MonthCalendarData>? listCalendar,
      @JsonKey(name: 'total_day_off') double? totalDayOff,
      @JsonKey(name: 'mess_cancel_food') MessCancelFoodData? messCancelFood,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'banner') String? banner,
      @JsonKey(name: 'status') List<PHXStatusLegendData>? status,
      @JsonKey(name: 'info_banner') String? infoBanner,
      @JsonKey(name: 'status_code') String? statusCode,
      @JsonKey(name: 'student_id') int? studentId,
      @JsonKey(name: 'school_year_id') int? schoolYearId,
      @JsonKey(name: 'request_id') int? requestId,
      @JsonKey(name: 'school_id') int? schoolId,
      @JsonKey(name: 'list_month_register')
      List<PHXMonthData>? listMonthRegister,
      @JsonKey(name: 'is_cancel_request') bool? isCancelRequest,
      @JsonKey(name: 'educational_code') String? educationalCode,
      @JsonKey(name: 'food_section_id') int? foodSectionId,
      @JsonKey(name: 'start_date') String? startDate,
      @JsonKey(name: 'end_date') String? endDate,
      @JsonKey(name: 'menu_name') String? menuName,
      @JsonKey(name: 'is_image_default') bool? isImageDefault,
      @JsonKey(name: 'is_view_request_cancel') bool? isViewRequestCancel,
      @JsonKey(name: 'request_cancel_id') int? requestCancelId,
      @JsonKey(name: 'has_next_page') bool? hasNextPage,
      @JsonKey(name: 'endCusor') String? endCusor,
      @JsonKey(name: 'page') int? page,
      @JsonKey(name: 'page_size') int? pageSize,
      @JsonKey(name: 'school_term_id') int? schoolTermId,
      @JsonKey(name: 'month_id') int? monthId,
      @JsonKey(name: 'total') int? total,
      @JsonKey(name: 'totalPage') int? totalPage,
      @JsonKey(name: 'remaining') int? remaining,
      @JsonKey(name: 'register_link') String? registerLink,
      @JsonKey(name: 'navigator_button_name') String? navigatorButtonName,
      @JsonKey(name: 'subject_id') int? subjectId,
      @JsonKey(name: 'sub_lable') String? subLable});

  @override
  $PHXDataModalDataCopyWith<$Res>? get dataModal;
  @override
  $BodyCancelDataCopyWith<$Res>? get bodyCancel;
  @override
  $MessCancelFoodDataCopyWith<$Res>? get messCancelFood;
}

/// @nodoc
class __$PHXExtraDataCopyWithImpl<$Res>
    implements _$PHXExtraDataCopyWith<$Res> {
  __$PHXExtraDataCopyWithImpl(this._self, this._then);

  final _PHXExtraData _self;
  final $Res Function(_PHXExtraData) _then;

  /// Create a copy of PHXExtraData
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
    Object? endCusor = freezed,
    Object? page = freezed,
    Object? pageSize = freezed,
    Object? schoolTermId = freezed,
    Object? monthId = freezed,
    Object? total = freezed,
    Object? totalPage = freezed,
    Object? remaining = freezed,
    Object? registerLink = freezed,
    Object? navigatorButtonName = freezed,
    Object? subjectId = freezed,
    Object? subLable = freezed,
  }) {
    return _then(_PHXExtraData(
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
              as PHXDataModalData?,
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
              as BodyCancelData?,
      listCalendar: freezed == listCalendar
          ? _self._listCalendar
          : listCalendar // ignore: cast_nullable_to_non_nullable
              as List<MonthCalendarData>?,
      totalDayOff: freezed == totalDayOff
          ? _self.totalDayOff
          : totalDayOff // ignore: cast_nullable_to_non_nullable
              as double?,
      messCancelFood: freezed == messCancelFood
          ? _self.messCancelFood
          : messCancelFood // ignore: cast_nullable_to_non_nullable
              as MessCancelFoodData?,
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
              as List<PHXStatusLegendData>?,
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
              as List<PHXMonthData>?,
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
      endCusor: freezed == endCusor
          ? _self.endCusor
          : endCusor // ignore: cast_nullable_to_non_nullable
              as String?,
      page: freezed == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSize: freezed == pageSize
          ? _self.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      schoolTermId: freezed == schoolTermId
          ? _self.schoolTermId
          : schoolTermId // ignore: cast_nullable_to_non_nullable
              as int?,
      monthId: freezed == monthId
          ? _self.monthId
          : monthId // ignore: cast_nullable_to_non_nullable
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

  /// Create a copy of PHXExtraData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXDataModalDataCopyWith<$Res>? get dataModal {
    if (_self.dataModal == null) {
      return null;
    }

    return $PHXDataModalDataCopyWith<$Res>(_self.dataModal!, (value) {
      return _then(_self.copyWith(dataModal: value));
    });
  }

  /// Create a copy of PHXExtraData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BodyCancelDataCopyWith<$Res>? get bodyCancel {
    if (_self.bodyCancel == null) {
      return null;
    }

    return $BodyCancelDataCopyWith<$Res>(_self.bodyCancel!, (value) {
      return _then(_self.copyWith(bodyCancel: value));
    });
  }

  /// Create a copy of PHXExtraData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessCancelFoodDataCopyWith<$Res>? get messCancelFood {
    if (_self.messCancelFood == null) {
      return null;
    }

    return $MessCancelFoodDataCopyWith<$Res>(_self.messCancelFood!, (value) {
      return _then(_self.copyWith(messCancelFood: value));
    });
  }
}

/// @nodoc
mixin _$PHXEmptyStateData {
  @JsonKey(name: 'title')
  String? get title;
  @JsonKey(name: 'sub_title')
  String? get subTitle;
  @JsonKey(name: 'is_show_button')
  bool? get isShowButton;
  @JsonKey(name: 'button_label')
  String? get buttonLabel;

  /// Create a copy of PHXEmptyStateData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXEmptyStateDataCopyWith<PHXEmptyStateData> get copyWith =>
      _$PHXEmptyStateDataCopyWithImpl<PHXEmptyStateData>(
          this as PHXEmptyStateData, _$identity);

  /// Serializes this PHXEmptyStateData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXEmptyStateData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.isShowButton, isShowButton) ||
                other.isShowButton == isShowButton) &&
            (identical(other.buttonLabel, buttonLabel) ||
                other.buttonLabel == buttonLabel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, subTitle, isShowButton, buttonLabel);

  @override
  String toString() {
    return 'PHXEmptyStateData(title: $title, subTitle: $subTitle, isShowButton: $isShowButton, buttonLabel: $buttonLabel)';
  }
}

/// @nodoc
abstract mixin class $PHXEmptyStateDataCopyWith<$Res> {
  factory $PHXEmptyStateDataCopyWith(
          PHXEmptyStateData value, $Res Function(PHXEmptyStateData) _then) =
      _$PHXEmptyStateDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'sub_title') String? subTitle,
      @JsonKey(name: 'is_show_button') bool? isShowButton,
      @JsonKey(name: 'button_label') String? buttonLabel});
}

/// @nodoc
class _$PHXEmptyStateDataCopyWithImpl<$Res>
    implements $PHXEmptyStateDataCopyWith<$Res> {
  _$PHXEmptyStateDataCopyWithImpl(this._self, this._then);

  final PHXEmptyStateData _self;
  final $Res Function(PHXEmptyStateData) _then;

  /// Create a copy of PHXEmptyStateData
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

/// Adds pattern-matching-related methods to [PHXEmptyStateData].
extension PHXEmptyStateDataPatterns on PHXEmptyStateData {
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
    TResult Function(_PHXEmptyStateData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXEmptyStateData() when $default != null:
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
    TResult Function(_PHXEmptyStateData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXEmptyStateData():
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
    TResult? Function(_PHXEmptyStateData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXEmptyStateData() when $default != null:
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
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'sub_title') String? subTitle,
            @JsonKey(name: 'is_show_button') bool? isShowButton,
            @JsonKey(name: 'button_label') String? buttonLabel)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXEmptyStateData() when $default != null:
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
    TResult Function(
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'sub_title') String? subTitle,
            @JsonKey(name: 'is_show_button') bool? isShowButton,
            @JsonKey(name: 'button_label') String? buttonLabel)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXEmptyStateData():
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
    TResult? Function(
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'sub_title') String? subTitle,
            @JsonKey(name: 'is_show_button') bool? isShowButton,
            @JsonKey(name: 'button_label') String? buttonLabel)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXEmptyStateData() when $default != null:
        return $default(
            _that.title, _that.subTitle, _that.isShowButton, _that.buttonLabel);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PHXEmptyStateData implements PHXEmptyStateData {
  const _PHXEmptyStateData(
      {@JsonKey(name: 'title') this.title,
      @JsonKey(name: 'sub_title') this.subTitle,
      @JsonKey(name: 'is_show_button') this.isShowButton,
      @JsonKey(name: 'button_label') this.buttonLabel});
  factory _PHXEmptyStateData.fromJson(Map<String, dynamic> json) =>
      _$PHXEmptyStateDataFromJson(json);

  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'sub_title')
  final String? subTitle;
  @override
  @JsonKey(name: 'is_show_button')
  final bool? isShowButton;
  @override
  @JsonKey(name: 'button_label')
  final String? buttonLabel;

  /// Create a copy of PHXEmptyStateData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXEmptyStateDataCopyWith<_PHXEmptyStateData> get copyWith =>
      __$PHXEmptyStateDataCopyWithImpl<_PHXEmptyStateData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PHXEmptyStateDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXEmptyStateData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.isShowButton, isShowButton) ||
                other.isShowButton == isShowButton) &&
            (identical(other.buttonLabel, buttonLabel) ||
                other.buttonLabel == buttonLabel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, subTitle, isShowButton, buttonLabel);

  @override
  String toString() {
    return 'PHXEmptyStateData(title: $title, subTitle: $subTitle, isShowButton: $isShowButton, buttonLabel: $buttonLabel)';
  }
}

/// @nodoc
abstract mixin class _$PHXEmptyStateDataCopyWith<$Res>
    implements $PHXEmptyStateDataCopyWith<$Res> {
  factory _$PHXEmptyStateDataCopyWith(
          _PHXEmptyStateData value, $Res Function(_PHXEmptyStateData) _then) =
      __$PHXEmptyStateDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'sub_title') String? subTitle,
      @JsonKey(name: 'is_show_button') bool? isShowButton,
      @JsonKey(name: 'button_label') String? buttonLabel});
}

/// @nodoc
class __$PHXEmptyStateDataCopyWithImpl<$Res>
    implements _$PHXEmptyStateDataCopyWith<$Res> {
  __$PHXEmptyStateDataCopyWithImpl(this._self, this._then);

  final _PHXEmptyStateData _self;
  final $Res Function(_PHXEmptyStateData) _then;

  /// Create a copy of PHXEmptyStateData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? subTitle = freezed,
    Object? isShowButton = freezed,
    Object? buttonLabel = freezed,
  }) {
    return _then(_PHXEmptyStateData(
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
mixin _$PHXTableData {
  @JsonKey(name: 'title')
  String? get title;
  @JsonKey(name: 'content')
  PHXTableContentData? get content;

  /// Create a copy of PHXTableData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXTableDataCopyWith<PHXTableData> get copyWith =>
      _$PHXTableDataCopyWithImpl<PHXTableData>(
          this as PHXTableData, _$identity);

  /// Serializes this PHXTableData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXTableData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, content);

  @override
  String toString() {
    return 'PHXTableData(title: $title, content: $content)';
  }
}

/// @nodoc
abstract mixin class $PHXTableDataCopyWith<$Res> {
  factory $PHXTableDataCopyWith(
          PHXTableData value, $Res Function(PHXTableData) _then) =
      _$PHXTableDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'content') PHXTableContentData? content});

  $PHXTableContentDataCopyWith<$Res>? get content;
}

/// @nodoc
class _$PHXTableDataCopyWithImpl<$Res> implements $PHXTableDataCopyWith<$Res> {
  _$PHXTableDataCopyWithImpl(this._self, this._then);

  final PHXTableData _self;
  final $Res Function(PHXTableData) _then;

  /// Create a copy of PHXTableData
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
              as PHXTableContentData?,
    ));
  }

  /// Create a copy of PHXTableData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXTableContentDataCopyWith<$Res>? get content {
    if (_self.content == null) {
      return null;
    }

    return $PHXTableContentDataCopyWith<$Res>(_self.content!, (value) {
      return _then(_self.copyWith(content: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PHXTableData].
extension PHXTableDataPatterns on PHXTableData {
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
    TResult Function(_PHXTableData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXTableData() when $default != null:
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
    TResult Function(_PHXTableData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXTableData():
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
    TResult? Function(_PHXTableData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXTableData() when $default != null:
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
    TResult Function(@JsonKey(name: 'title') String? title,
            @JsonKey(name: 'content') PHXTableContentData? content)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXTableData() when $default != null:
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
    TResult Function(@JsonKey(name: 'title') String? title,
            @JsonKey(name: 'content') PHXTableContentData? content)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXTableData():
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
    TResult? Function(@JsonKey(name: 'title') String? title,
            @JsonKey(name: 'content') PHXTableContentData? content)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXTableData() when $default != null:
        return $default(_that.title, _that.content);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PHXTableData implements PHXTableData {
  const _PHXTableData(
      {@JsonKey(name: 'title') this.title,
      @JsonKey(name: 'content') this.content});
  factory _PHXTableData.fromJson(Map<String, dynamic> json) =>
      _$PHXTableDataFromJson(json);

  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'content')
  final PHXTableContentData? content;

  /// Create a copy of PHXTableData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXTableDataCopyWith<_PHXTableData> get copyWith =>
      __$PHXTableDataCopyWithImpl<_PHXTableData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PHXTableDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXTableData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, content);

  @override
  String toString() {
    return 'PHXTableData(title: $title, content: $content)';
  }
}

/// @nodoc
abstract mixin class _$PHXTableDataCopyWith<$Res>
    implements $PHXTableDataCopyWith<$Res> {
  factory _$PHXTableDataCopyWith(
          _PHXTableData value, $Res Function(_PHXTableData) _then) =
      __$PHXTableDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'content') PHXTableContentData? content});

  @override
  $PHXTableContentDataCopyWith<$Res>? get content;
}

/// @nodoc
class __$PHXTableDataCopyWithImpl<$Res>
    implements _$PHXTableDataCopyWith<$Res> {
  __$PHXTableDataCopyWithImpl(this._self, this._then);

  final _PHXTableData _self;
  final $Res Function(_PHXTableData) _then;

  /// Create a copy of PHXTableData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
  }) {
    return _then(_PHXTableData(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as PHXTableContentData?,
    ));
  }

  /// Create a copy of PHXTableData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PHXTableContentDataCopyWith<$Res>? get content {
    if (_self.content == null) {
      return null;
    }

    return $PHXTableContentDataCopyWith<$Res>(_self.content!, (value) {
      return _then(_self.copyWith(content: value));
    });
  }
}

/// @nodoc
mixin _$PHXTableContentData {
  @JsonKey(name: 'headers')
  List<String>? get headers;
  @JsonKey(name: 'rows')
  List<List<String>>? get rows;

  /// Create a copy of PHXTableContentData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXTableContentDataCopyWith<PHXTableContentData> get copyWith =>
      _$PHXTableContentDataCopyWithImpl<PHXTableContentData>(
          this as PHXTableContentData, _$identity);

  /// Serializes this PHXTableContentData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXTableContentData &&
            const DeepCollectionEquality().equals(other.headers, headers) &&
            const DeepCollectionEquality().equals(other.rows, rows));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(headers),
      const DeepCollectionEquality().hash(rows));

  @override
  String toString() {
    return 'PHXTableContentData(headers: $headers, rows: $rows)';
  }
}

/// @nodoc
abstract mixin class $PHXTableContentDataCopyWith<$Res> {
  factory $PHXTableContentDataCopyWith(
          PHXTableContentData value, $Res Function(PHXTableContentData) _then) =
      _$PHXTableContentDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'headers') List<String>? headers,
      @JsonKey(name: 'rows') List<List<String>>? rows});
}

/// @nodoc
class _$PHXTableContentDataCopyWithImpl<$Res>
    implements $PHXTableContentDataCopyWith<$Res> {
  _$PHXTableContentDataCopyWithImpl(this._self, this._then);

  final PHXTableContentData _self;
  final $Res Function(PHXTableContentData) _then;

  /// Create a copy of PHXTableContentData
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

/// Adds pattern-matching-related methods to [PHXTableContentData].
extension PHXTableContentDataPatterns on PHXTableContentData {
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
    TResult Function(_PHXTableContentData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXTableContentData() when $default != null:
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
    TResult Function(_PHXTableContentData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXTableContentData():
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
    TResult? Function(_PHXTableContentData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXTableContentData() when $default != null:
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
    TResult Function(@JsonKey(name: 'headers') List<String>? headers,
            @JsonKey(name: 'rows') List<List<String>>? rows)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXTableContentData() when $default != null:
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
    TResult Function(@JsonKey(name: 'headers') List<String>? headers,
            @JsonKey(name: 'rows') List<List<String>>? rows)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXTableContentData():
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
    TResult? Function(@JsonKey(name: 'headers') List<String>? headers,
            @JsonKey(name: 'rows') List<List<String>>? rows)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXTableContentData() when $default != null:
        return $default(_that.headers, _that.rows);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PHXTableContentData implements PHXTableContentData {
  const _PHXTableContentData(
      {@JsonKey(name: 'headers') final List<String>? headers,
      @JsonKey(name: 'rows') final List<List<String>>? rows})
      : _headers = headers,
        _rows = rows;
  factory _PHXTableContentData.fromJson(Map<String, dynamic> json) =>
      _$PHXTableContentDataFromJson(json);

  final List<String>? _headers;
  @override
  @JsonKey(name: 'headers')
  List<String>? get headers {
    final value = _headers;
    if (value == null) return null;
    if (_headers is EqualUnmodifiableListView) return _headers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<List<String>>? _rows;
  @override
  @JsonKey(name: 'rows')
  List<List<String>>? get rows {
    final value = _rows;
    if (value == null) return null;
    if (_rows is EqualUnmodifiableListView) return _rows;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of PHXTableContentData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXTableContentDataCopyWith<_PHXTableContentData> get copyWith =>
      __$PHXTableContentDataCopyWithImpl<_PHXTableContentData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PHXTableContentDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXTableContentData &&
            const DeepCollectionEquality().equals(other._headers, _headers) &&
            const DeepCollectionEquality().equals(other._rows, _rows));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_headers),
      const DeepCollectionEquality().hash(_rows));

  @override
  String toString() {
    return 'PHXTableContentData(headers: $headers, rows: $rows)';
  }
}

/// @nodoc
abstract mixin class _$PHXTableContentDataCopyWith<$Res>
    implements $PHXTableContentDataCopyWith<$Res> {
  factory _$PHXTableContentDataCopyWith(_PHXTableContentData value,
          $Res Function(_PHXTableContentData) _then) =
      __$PHXTableContentDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'headers') List<String>? headers,
      @JsonKey(name: 'rows') List<List<String>>? rows});
}

/// @nodoc
class __$PHXTableContentDataCopyWithImpl<$Res>
    implements _$PHXTableContentDataCopyWith<$Res> {
  __$PHXTableContentDataCopyWithImpl(this._self, this._then);

  final _PHXTableContentData _self;
  final $Res Function(_PHXTableContentData) _then;

  /// Create a copy of PHXTableContentData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? headers = freezed,
    Object? rows = freezed,
  }) {
    return _then(_PHXTableContentData(
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
mixin _$CalendarItemData {
  @JsonKey(name: 'content')
  String? get content;
  @JsonKey(name: 'date')
  String? get date;
  @JsonKey(name: 'date_to_call_api')
  String? get dateToCallApi;
  @JsonKey(name: 'dayOfWeek')
  String? get dayOfWeek;
  @JsonKey(name: 'isCurrentMonth')
  bool? get isCurrentMonth;
  @JsonKey(name: 'isToday')
  bool? get isToday;
  @JsonKey(name: 'active')
  bool? get active;
  @JsonKey(name: 'isPast')
  bool? get isPast;
  @JsonKey(name: 'isWeekend')
  bool? get isWeekend;
  @JsonKey(name: 'type')
  String? get type;
  @JsonKey(name: 'schedule_setting')
  String? get scheduleSetting;
  @JsonKey(name: 'is_half_day')
  bool? get isHalfDay;
  @JsonKey(name: 'is_full_day')
  bool? get isFullDay;
  @JsonKey(name: 'status')
  String? get status;

  /// Create a copy of CalendarItemData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CalendarItemDataCopyWith<CalendarItemData> get copyWith =>
      _$CalendarItemDataCopyWithImpl<CalendarItemData>(
          this as CalendarItemData, _$identity);

  /// Serializes this CalendarItemData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CalendarItemData &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'CalendarItemData(content: $content, date: $date, dateToCallApi: $dateToCallApi, dayOfWeek: $dayOfWeek, isCurrentMonth: $isCurrentMonth, isToday: $isToday, active: $active, isPast: $isPast, isWeekend: $isWeekend, type: $type, scheduleSetting: $scheduleSetting, isHalfDay: $isHalfDay, isFullDay: $isFullDay, status: $status)';
  }
}

/// @nodoc
abstract mixin class $CalendarItemDataCopyWith<$Res> {
  factory $CalendarItemDataCopyWith(
          CalendarItemData value, $Res Function(CalendarItemData) _then) =
      _$CalendarItemDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'content') String? content,
      @JsonKey(name: 'date') String? date,
      @JsonKey(name: 'date_to_call_api') String? dateToCallApi,
      @JsonKey(name: 'dayOfWeek') String? dayOfWeek,
      @JsonKey(name: 'isCurrentMonth') bool? isCurrentMonth,
      @JsonKey(name: 'isToday') bool? isToday,
      @JsonKey(name: 'active') bool? active,
      @JsonKey(name: 'isPast') bool? isPast,
      @JsonKey(name: 'isWeekend') bool? isWeekend,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'schedule_setting') String? scheduleSetting,
      @JsonKey(name: 'is_half_day') bool? isHalfDay,
      @JsonKey(name: 'is_full_day') bool? isFullDay,
      @JsonKey(name: 'status') String? status});
}

/// @nodoc
class _$CalendarItemDataCopyWithImpl<$Res>
    implements $CalendarItemDataCopyWith<$Res> {
  _$CalendarItemDataCopyWithImpl(this._self, this._then);

  final CalendarItemData _self;
  final $Res Function(CalendarItemData) _then;

  /// Create a copy of CalendarItemData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? date = freezed,
    Object? dateToCallApi = freezed,
    Object? dayOfWeek = freezed,
    Object? isCurrentMonth = freezed,
    Object? isToday = freezed,
    Object? active = freezed,
    Object? isPast = freezed,
    Object? isWeekend = freezed,
    Object? type = freezed,
    Object? scheduleSetting = freezed,
    Object? isHalfDay = freezed,
    Object? isFullDay = freezed,
    Object? status = freezed,
  }) {
    return _then(_self.copyWith(
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      dateToCallApi: freezed == dateToCallApi
          ? _self.dateToCallApi
          : dateToCallApi // ignore: cast_nullable_to_non_nullable
              as String?,
      dayOfWeek: freezed == dayOfWeek
          ? _self.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as String?,
      isCurrentMonth: freezed == isCurrentMonth
          ? _self.isCurrentMonth
          : isCurrentMonth // ignore: cast_nullable_to_non_nullable
              as bool?,
      isToday: freezed == isToday
          ? _self.isToday
          : isToday // ignore: cast_nullable_to_non_nullable
              as bool?,
      active: freezed == active
          ? _self.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPast: freezed == isPast
          ? _self.isPast
          : isPast // ignore: cast_nullable_to_non_nullable
              as bool?,
      isWeekend: freezed == isWeekend
          ? _self.isWeekend
          : isWeekend // ignore: cast_nullable_to_non_nullable
              as bool?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleSetting: freezed == scheduleSetting
          ? _self.scheduleSetting
          : scheduleSetting // ignore: cast_nullable_to_non_nullable
              as String?,
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

/// Adds pattern-matching-related methods to [CalendarItemData].
extension CalendarItemDataPatterns on CalendarItemData {
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
    TResult Function(_CalendarItemData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CalendarItemData() when $default != null:
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
    TResult Function(_CalendarItemData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CalendarItemData():
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
    TResult? Function(_CalendarItemData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CalendarItemData() when $default != null:
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
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'date') String? date,
            @JsonKey(name: 'date_to_call_api') String? dateToCallApi,
            @JsonKey(name: 'dayOfWeek') String? dayOfWeek,
            @JsonKey(name: 'isCurrentMonth') bool? isCurrentMonth,
            @JsonKey(name: 'isToday') bool? isToday,
            @JsonKey(name: 'active') bool? active,
            @JsonKey(name: 'isPast') bool? isPast,
            @JsonKey(name: 'isWeekend') bool? isWeekend,
            @JsonKey(name: 'type') String? type,
            @JsonKey(name: 'schedule_setting') String? scheduleSetting,
            @JsonKey(name: 'is_half_day') bool? isHalfDay,
            @JsonKey(name: 'is_full_day') bool? isFullDay,
            @JsonKey(name: 'status') String? status)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CalendarItemData() when $default != null:
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
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'date') String? date,
            @JsonKey(name: 'date_to_call_api') String? dateToCallApi,
            @JsonKey(name: 'dayOfWeek') String? dayOfWeek,
            @JsonKey(name: 'isCurrentMonth') bool? isCurrentMonth,
            @JsonKey(name: 'isToday') bool? isToday,
            @JsonKey(name: 'active') bool? active,
            @JsonKey(name: 'isPast') bool? isPast,
            @JsonKey(name: 'isWeekend') bool? isWeekend,
            @JsonKey(name: 'type') String? type,
            @JsonKey(name: 'schedule_setting') String? scheduleSetting,
            @JsonKey(name: 'is_half_day') bool? isHalfDay,
            @JsonKey(name: 'is_full_day') bool? isFullDay,
            @JsonKey(name: 'status') String? status)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CalendarItemData():
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
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'date') String? date,
            @JsonKey(name: 'date_to_call_api') String? dateToCallApi,
            @JsonKey(name: 'dayOfWeek') String? dayOfWeek,
            @JsonKey(name: 'isCurrentMonth') bool? isCurrentMonth,
            @JsonKey(name: 'isToday') bool? isToday,
            @JsonKey(name: 'active') bool? active,
            @JsonKey(name: 'isPast') bool? isPast,
            @JsonKey(name: 'isWeekend') bool? isWeekend,
            @JsonKey(name: 'type') String? type,
            @JsonKey(name: 'schedule_setting') String? scheduleSetting,
            @JsonKey(name: 'is_half_day') bool? isHalfDay,
            @JsonKey(name: 'is_full_day') bool? isFullDay,
            @JsonKey(name: 'status') String? status)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CalendarItemData() when $default != null:
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

@JsonSerializable(explicitToJson: true)
class _CalendarItemData implements CalendarItemData {
  const _CalendarItemData(
      {@JsonKey(name: 'content') this.content,
      @JsonKey(name: 'date') this.date,
      @JsonKey(name: 'date_to_call_api') this.dateToCallApi,
      @JsonKey(name: 'dayOfWeek') this.dayOfWeek,
      @JsonKey(name: 'isCurrentMonth') this.isCurrentMonth,
      @JsonKey(name: 'isToday') this.isToday,
      @JsonKey(name: 'active') this.active,
      @JsonKey(name: 'isPast') this.isPast,
      @JsonKey(name: 'isWeekend') this.isWeekend,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'schedule_setting') this.scheduleSetting,
      @JsonKey(name: 'is_half_day') this.isHalfDay,
      @JsonKey(name: 'is_full_day') this.isFullDay,
      @JsonKey(name: 'status') this.status});
  factory _CalendarItemData.fromJson(Map<String, dynamic> json) =>
      _$CalendarItemDataFromJson(json);

  @override
  @JsonKey(name: 'content')
  final String? content;
  @override
  @JsonKey(name: 'date')
  final String? date;
  @override
  @JsonKey(name: 'date_to_call_api')
  final String? dateToCallApi;
  @override
  @JsonKey(name: 'dayOfWeek')
  final String? dayOfWeek;
  @override
  @JsonKey(name: 'isCurrentMonth')
  final bool? isCurrentMonth;
  @override
  @JsonKey(name: 'isToday')
  final bool? isToday;
  @override
  @JsonKey(name: 'active')
  final bool? active;
  @override
  @JsonKey(name: 'isPast')
  final bool? isPast;
  @override
  @JsonKey(name: 'isWeekend')
  final bool? isWeekend;
  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'schedule_setting')
  final String? scheduleSetting;
  @override
  @JsonKey(name: 'is_half_day')
  final bool? isHalfDay;
  @override
  @JsonKey(name: 'is_full_day')
  final bool? isFullDay;
  @override
  @JsonKey(name: 'status')
  final String? status;

  /// Create a copy of CalendarItemData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CalendarItemDataCopyWith<_CalendarItemData> get copyWith =>
      __$CalendarItemDataCopyWithImpl<_CalendarItemData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CalendarItemDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CalendarItemData &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'CalendarItemData(content: $content, date: $date, dateToCallApi: $dateToCallApi, dayOfWeek: $dayOfWeek, isCurrentMonth: $isCurrentMonth, isToday: $isToday, active: $active, isPast: $isPast, isWeekend: $isWeekend, type: $type, scheduleSetting: $scheduleSetting, isHalfDay: $isHalfDay, isFullDay: $isFullDay, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$CalendarItemDataCopyWith<$Res>
    implements $CalendarItemDataCopyWith<$Res> {
  factory _$CalendarItemDataCopyWith(
          _CalendarItemData value, $Res Function(_CalendarItemData) _then) =
      __$CalendarItemDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'content') String? content,
      @JsonKey(name: 'date') String? date,
      @JsonKey(name: 'date_to_call_api') String? dateToCallApi,
      @JsonKey(name: 'dayOfWeek') String? dayOfWeek,
      @JsonKey(name: 'isCurrentMonth') bool? isCurrentMonth,
      @JsonKey(name: 'isToday') bool? isToday,
      @JsonKey(name: 'active') bool? active,
      @JsonKey(name: 'isPast') bool? isPast,
      @JsonKey(name: 'isWeekend') bool? isWeekend,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'schedule_setting') String? scheduleSetting,
      @JsonKey(name: 'is_half_day') bool? isHalfDay,
      @JsonKey(name: 'is_full_day') bool? isFullDay,
      @JsonKey(name: 'status') String? status});
}

/// @nodoc
class __$CalendarItemDataCopyWithImpl<$Res>
    implements _$CalendarItemDataCopyWith<$Res> {
  __$CalendarItemDataCopyWithImpl(this._self, this._then);

  final _CalendarItemData _self;
  final $Res Function(_CalendarItemData) _then;

  /// Create a copy of CalendarItemData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? content = freezed,
    Object? date = freezed,
    Object? dateToCallApi = freezed,
    Object? dayOfWeek = freezed,
    Object? isCurrentMonth = freezed,
    Object? isToday = freezed,
    Object? active = freezed,
    Object? isPast = freezed,
    Object? isWeekend = freezed,
    Object? type = freezed,
    Object? scheduleSetting = freezed,
    Object? isHalfDay = freezed,
    Object? isFullDay = freezed,
    Object? status = freezed,
  }) {
    return _then(_CalendarItemData(
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      dateToCallApi: freezed == dateToCallApi
          ? _self.dateToCallApi
          : dateToCallApi // ignore: cast_nullable_to_non_nullable
              as String?,
      dayOfWeek: freezed == dayOfWeek
          ? _self.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as String?,
      isCurrentMonth: freezed == isCurrentMonth
          ? _self.isCurrentMonth
          : isCurrentMonth // ignore: cast_nullable_to_non_nullable
              as bool?,
      isToday: freezed == isToday
          ? _self.isToday
          : isToday // ignore: cast_nullable_to_non_nullable
              as bool?,
      active: freezed == active
          ? _self.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPast: freezed == isPast
          ? _self.isPast
          : isPast // ignore: cast_nullable_to_non_nullable
              as bool?,
      isWeekend: freezed == isWeekend
          ? _self.isWeekend
          : isWeekend // ignore: cast_nullable_to_non_nullable
              as bool?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleSetting: freezed == scheduleSetting
          ? _self.scheduleSetting
          : scheduleSetting // ignore: cast_nullable_to_non_nullable
              as String?,
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
mixin _$MonthCalendarData {
  @JsonKey(name: 'month')
  String? get month;
  @JsonKey(name: 'current')
  bool? get current;
  @JsonKey(name: 'day_of_month')
  List<CalendarItemData>? get dayOfMonth;

  /// Create a copy of MonthCalendarData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MonthCalendarDataCopyWith<MonthCalendarData> get copyWith =>
      _$MonthCalendarDataCopyWithImpl<MonthCalendarData>(
          this as MonthCalendarData, _$identity);

  /// Serializes this MonthCalendarData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MonthCalendarData &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.current, current) || other.current == current) &&
            const DeepCollectionEquality()
                .equals(other.dayOfMonth, dayOfMonth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, month, current,
      const DeepCollectionEquality().hash(dayOfMonth));

  @override
  String toString() {
    return 'MonthCalendarData(month: $month, current: $current, dayOfMonth: $dayOfMonth)';
  }
}

/// @nodoc
abstract mixin class $MonthCalendarDataCopyWith<$Res> {
  factory $MonthCalendarDataCopyWith(
          MonthCalendarData value, $Res Function(MonthCalendarData) _then) =
      _$MonthCalendarDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'month') String? month,
      @JsonKey(name: 'current') bool? current,
      @JsonKey(name: 'day_of_month') List<CalendarItemData>? dayOfMonth});
}

/// @nodoc
class _$MonthCalendarDataCopyWithImpl<$Res>
    implements $MonthCalendarDataCopyWith<$Res> {
  _$MonthCalendarDataCopyWithImpl(this._self, this._then);

  final MonthCalendarData _self;
  final $Res Function(MonthCalendarData) _then;

  /// Create a copy of MonthCalendarData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = freezed,
    Object? current = freezed,
    Object? dayOfMonth = freezed,
  }) {
    return _then(_self.copyWith(
      month: freezed == month
          ? _self.month
          : month // ignore: cast_nullable_to_non_nullable
              as String?,
      current: freezed == current
          ? _self.current
          : current // ignore: cast_nullable_to_non_nullable
              as bool?,
      dayOfMonth: freezed == dayOfMonth
          ? _self.dayOfMonth
          : dayOfMonth // ignore: cast_nullable_to_non_nullable
              as List<CalendarItemData>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [MonthCalendarData].
extension MonthCalendarDataPatterns on MonthCalendarData {
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
    TResult Function(_MonthCalendarData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MonthCalendarData() when $default != null:
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
    TResult Function(_MonthCalendarData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MonthCalendarData():
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
    TResult? Function(_MonthCalendarData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MonthCalendarData() when $default != null:
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
            @JsonKey(name: 'month') String? month,
            @JsonKey(name: 'current') bool? current,
            @JsonKey(name: 'day_of_month') List<CalendarItemData>? dayOfMonth)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MonthCalendarData() when $default != null:
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
    TResult Function(
            @JsonKey(name: 'month') String? month,
            @JsonKey(name: 'current') bool? current,
            @JsonKey(name: 'day_of_month') List<CalendarItemData>? dayOfMonth)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MonthCalendarData():
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
            @JsonKey(name: 'month') String? month,
            @JsonKey(name: 'current') bool? current,
            @JsonKey(name: 'day_of_month') List<CalendarItemData>? dayOfMonth)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MonthCalendarData() when $default != null:
        return $default(_that.month, _that.current, _that.dayOfMonth);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _MonthCalendarData implements MonthCalendarData {
  const _MonthCalendarData(
      {@JsonKey(name: 'month') this.month,
      @JsonKey(name: 'current') this.current,
      @JsonKey(name: 'day_of_month') final List<CalendarItemData>? dayOfMonth})
      : _dayOfMonth = dayOfMonth;
  factory _MonthCalendarData.fromJson(Map<String, dynamic> json) =>
      _$MonthCalendarDataFromJson(json);

  @override
  @JsonKey(name: 'month')
  final String? month;
  @override
  @JsonKey(name: 'current')
  final bool? current;
  final List<CalendarItemData>? _dayOfMonth;
  @override
  @JsonKey(name: 'day_of_month')
  List<CalendarItemData>? get dayOfMonth {
    final value = _dayOfMonth;
    if (value == null) return null;
    if (_dayOfMonth is EqualUnmodifiableListView) return _dayOfMonth;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of MonthCalendarData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MonthCalendarDataCopyWith<_MonthCalendarData> get copyWith =>
      __$MonthCalendarDataCopyWithImpl<_MonthCalendarData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MonthCalendarDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MonthCalendarData &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.current, current) || other.current == current) &&
            const DeepCollectionEquality()
                .equals(other._dayOfMonth, _dayOfMonth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, month, current,
      const DeepCollectionEquality().hash(_dayOfMonth));

  @override
  String toString() {
    return 'MonthCalendarData(month: $month, current: $current, dayOfMonth: $dayOfMonth)';
  }
}

/// @nodoc
abstract mixin class _$MonthCalendarDataCopyWith<$Res>
    implements $MonthCalendarDataCopyWith<$Res> {
  factory _$MonthCalendarDataCopyWith(
          _MonthCalendarData value, $Res Function(_MonthCalendarData) _then) =
      __$MonthCalendarDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'month') String? month,
      @JsonKey(name: 'current') bool? current,
      @JsonKey(name: 'day_of_month') List<CalendarItemData>? dayOfMonth});
}

/// @nodoc
class __$MonthCalendarDataCopyWithImpl<$Res>
    implements _$MonthCalendarDataCopyWith<$Res> {
  __$MonthCalendarDataCopyWithImpl(this._self, this._then);

  final _MonthCalendarData _self;
  final $Res Function(_MonthCalendarData) _then;

  /// Create a copy of MonthCalendarData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? month = freezed,
    Object? current = freezed,
    Object? dayOfMonth = freezed,
  }) {
    return _then(_MonthCalendarData(
      month: freezed == month
          ? _self.month
          : month // ignore: cast_nullable_to_non_nullable
              as String?,
      current: freezed == current
          ? _self.current
          : current // ignore: cast_nullable_to_non_nullable
              as bool?,
      dayOfMonth: freezed == dayOfMonth
          ? _self._dayOfMonth
          : dayOfMonth // ignore: cast_nullable_to_non_nullable
              as List<CalendarItemData>?,
    ));
  }
}

/// @nodoc
mixin _$MessCancelFoodData {
  @JsonKey(name: 'title')
  String? get title;
  @JsonKey(name: 'content')
  String? get content;

  /// Create a copy of MessCancelFoodData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MessCancelFoodDataCopyWith<MessCancelFoodData> get copyWith =>
      _$MessCancelFoodDataCopyWithImpl<MessCancelFoodData>(
          this as MessCancelFoodData, _$identity);

  /// Serializes this MessCancelFoodData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MessCancelFoodData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, content);

  @override
  String toString() {
    return 'MessCancelFoodData(title: $title, content: $content)';
  }
}

/// @nodoc
abstract mixin class $MessCancelFoodDataCopyWith<$Res> {
  factory $MessCancelFoodDataCopyWith(
          MessCancelFoodData value, $Res Function(MessCancelFoodData) _then) =
      _$MessCancelFoodDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'content') String? content});
}

/// @nodoc
class _$MessCancelFoodDataCopyWithImpl<$Res>
    implements $MessCancelFoodDataCopyWith<$Res> {
  _$MessCancelFoodDataCopyWithImpl(this._self, this._then);

  final MessCancelFoodData _self;
  final $Res Function(MessCancelFoodData) _then;

  /// Create a copy of MessCancelFoodData
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

/// Adds pattern-matching-related methods to [MessCancelFoodData].
extension MessCancelFoodDataPatterns on MessCancelFoodData {
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
    TResult Function(_MessCancelFoodData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MessCancelFoodData() when $default != null:
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
    TResult Function(_MessCancelFoodData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessCancelFoodData():
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
    TResult? Function(_MessCancelFoodData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessCancelFoodData() when $default != null:
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
    TResult Function(@JsonKey(name: 'title') String? title,
            @JsonKey(name: 'content') String? content)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MessCancelFoodData() when $default != null:
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
    TResult Function(@JsonKey(name: 'title') String? title,
            @JsonKey(name: 'content') String? content)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessCancelFoodData():
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
    TResult? Function(@JsonKey(name: 'title') String? title,
            @JsonKey(name: 'content') String? content)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessCancelFoodData() when $default != null:
        return $default(_that.title, _that.content);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _MessCancelFoodData implements MessCancelFoodData {
  const _MessCancelFoodData(
      {@JsonKey(name: 'title') this.title,
      @JsonKey(name: 'content') this.content});
  factory _MessCancelFoodData.fromJson(Map<String, dynamic> json) =>
      _$MessCancelFoodDataFromJson(json);

  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'content')
  final String? content;

  /// Create a copy of MessCancelFoodData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MessCancelFoodDataCopyWith<_MessCancelFoodData> get copyWith =>
      __$MessCancelFoodDataCopyWithImpl<_MessCancelFoodData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MessCancelFoodDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MessCancelFoodData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, content);

  @override
  String toString() {
    return 'MessCancelFoodData(title: $title, content: $content)';
  }
}

/// @nodoc
abstract mixin class _$MessCancelFoodDataCopyWith<$Res>
    implements $MessCancelFoodDataCopyWith<$Res> {
  factory _$MessCancelFoodDataCopyWith(
          _MessCancelFoodData value, $Res Function(_MessCancelFoodData) _then) =
      __$MessCancelFoodDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'content') String? content});
}

/// @nodoc
class __$MessCancelFoodDataCopyWithImpl<$Res>
    implements _$MessCancelFoodDataCopyWith<$Res> {
  __$MessCancelFoodDataCopyWithImpl(this._self, this._then);

  final _MessCancelFoodData _self;
  final $Res Function(_MessCancelFoodData) _then;

  /// Create a copy of MessCancelFoodData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
  }) {
    return _then(_MessCancelFoodData(
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
mixin _$BodyCancelData {
  @JsonKey(name: 'register_id')
  List<int>? get registerId;
  @JsonKey(name: 'type')
  String? get type;

  /// Create a copy of BodyCancelData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BodyCancelDataCopyWith<BodyCancelData> get copyWith =>
      _$BodyCancelDataCopyWithImpl<BodyCancelData>(
          this as BodyCancelData, _$identity);

  /// Serializes this BodyCancelData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BodyCancelData &&
            const DeepCollectionEquality()
                .equals(other.registerId, registerId) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(registerId), type);

  @override
  String toString() {
    return 'BodyCancelData(registerId: $registerId, type: $type)';
  }
}

/// @nodoc
abstract mixin class $BodyCancelDataCopyWith<$Res> {
  factory $BodyCancelDataCopyWith(
          BodyCancelData value, $Res Function(BodyCancelData) _then) =
      _$BodyCancelDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'register_id') List<int>? registerId,
      @JsonKey(name: 'type') String? type});
}

/// @nodoc
class _$BodyCancelDataCopyWithImpl<$Res>
    implements $BodyCancelDataCopyWith<$Res> {
  _$BodyCancelDataCopyWithImpl(this._self, this._then);

  final BodyCancelData _self;
  final $Res Function(BodyCancelData) _then;

  /// Create a copy of BodyCancelData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registerId = freezed,
    Object? type = freezed,
  }) {
    return _then(_self.copyWith(
      registerId: freezed == registerId
          ? _self.registerId
          : registerId // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [BodyCancelData].
extension BodyCancelDataPatterns on BodyCancelData {
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
    TResult Function(_BodyCancelData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BodyCancelData() when $default != null:
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
    TResult Function(_BodyCancelData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BodyCancelData():
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
    TResult? Function(_BodyCancelData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BodyCancelData() when $default != null:
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
    TResult Function(@JsonKey(name: 'register_id') List<int>? registerId,
            @JsonKey(name: 'type') String? type)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BodyCancelData() when $default != null:
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
    TResult Function(@JsonKey(name: 'register_id') List<int>? registerId,
            @JsonKey(name: 'type') String? type)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BodyCancelData():
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
    TResult? Function(@JsonKey(name: 'register_id') List<int>? registerId,
            @JsonKey(name: 'type') String? type)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BodyCancelData() when $default != null:
        return $default(_that.registerId, _that.type);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _BodyCancelData implements BodyCancelData {
  const _BodyCancelData(
      {@JsonKey(name: 'register_id') final List<int>? registerId,
      @JsonKey(name: 'type') this.type})
      : _registerId = registerId;
  factory _BodyCancelData.fromJson(Map<String, dynamic> json) =>
      _$BodyCancelDataFromJson(json);

  final List<int>? _registerId;
  @override
  @JsonKey(name: 'register_id')
  List<int>? get registerId {
    final value = _registerId;
    if (value == null) return null;
    if (_registerId is EqualUnmodifiableListView) return _registerId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'type')
  final String? type;

  /// Create a copy of BodyCancelData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BodyCancelDataCopyWith<_BodyCancelData> get copyWith =>
      __$BodyCancelDataCopyWithImpl<_BodyCancelData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BodyCancelDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BodyCancelData &&
            const DeepCollectionEquality()
                .equals(other._registerId, _registerId) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_registerId), type);

  @override
  String toString() {
    return 'BodyCancelData(registerId: $registerId, type: $type)';
  }
}

/// @nodoc
abstract mixin class _$BodyCancelDataCopyWith<$Res>
    implements $BodyCancelDataCopyWith<$Res> {
  factory _$BodyCancelDataCopyWith(
          _BodyCancelData value, $Res Function(_BodyCancelData) _then) =
      __$BodyCancelDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'register_id') List<int>? registerId,
      @JsonKey(name: 'type') String? type});
}

/// @nodoc
class __$BodyCancelDataCopyWithImpl<$Res>
    implements _$BodyCancelDataCopyWith<$Res> {
  __$BodyCancelDataCopyWithImpl(this._self, this._then);

  final _BodyCancelData _self;
  final $Res Function(_BodyCancelData) _then;

  /// Create a copy of BodyCancelData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? registerId = freezed,
    Object? type = freezed,
  }) {
    return _then(_BodyCancelData(
      registerId: freezed == registerId
          ? _self._registerId
          : registerId // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$PHXMonthData {
  @JsonKey(name: 'id')
  int? get id;
  @JsonKey(name: 'name')
  String? get name;
  @JsonKey(name: 'is_active')
  bool? get isActive;
  @JsonKey(name: 'code')
  String? get code;

  /// Create a copy of PHXMonthData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXMonthDataCopyWith<PHXMonthData> get copyWith =>
      _$PHXMonthDataCopyWithImpl<PHXMonthData>(
          this as PHXMonthData, _$identity);

  /// Serializes this PHXMonthData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXMonthData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, isActive, code);

  @override
  String toString() {
    return 'PHXMonthData(id: $id, name: $name, isActive: $isActive, code: $code)';
  }
}

/// @nodoc
abstract mixin class $PHXMonthDataCopyWith<$Res> {
  factory $PHXMonthDataCopyWith(
          PHXMonthData value, $Res Function(PHXMonthData) _then) =
      _$PHXMonthDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'code') String? code});
}

/// @nodoc
class _$PHXMonthDataCopyWithImpl<$Res> implements $PHXMonthDataCopyWith<$Res> {
  _$PHXMonthDataCopyWithImpl(this._self, this._then);

  final PHXMonthData _self;
  final $Res Function(PHXMonthData) _then;

  /// Create a copy of PHXMonthData
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

/// Adds pattern-matching-related methods to [PHXMonthData].
extension PHXMonthDataPatterns on PHXMonthData {
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
    TResult Function(_PHXMonthData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXMonthData() when $default != null:
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
    TResult Function(_PHXMonthData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXMonthData():
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
    TResult? Function(_PHXMonthData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXMonthData() when $default != null:
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
            @JsonKey(name: 'id') int? id,
            @JsonKey(name: 'name') String? name,
            @JsonKey(name: 'is_active') bool? isActive,
            @JsonKey(name: 'code') String? code)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXMonthData() when $default != null:
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
    TResult Function(
            @JsonKey(name: 'id') int? id,
            @JsonKey(name: 'name') String? name,
            @JsonKey(name: 'is_active') bool? isActive,
            @JsonKey(name: 'code') String? code)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXMonthData():
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
    TResult? Function(
            @JsonKey(name: 'id') int? id,
            @JsonKey(name: 'name') String? name,
            @JsonKey(name: 'is_active') bool? isActive,
            @JsonKey(name: 'code') String? code)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXMonthData() when $default != null:
        return $default(_that.id, _that.name, _that.isActive, _that.code);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _PHXMonthData implements PHXMonthData {
  const _PHXMonthData(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'is_active') this.isActive,
      @JsonKey(name: 'code') this.code});
  factory _PHXMonthData.fromJson(Map<String, dynamic> json) =>
      _$PHXMonthDataFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @override
  @JsonKey(name: 'code')
  final String? code;

  /// Create a copy of PHXMonthData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXMonthDataCopyWith<_PHXMonthData> get copyWith =>
      __$PHXMonthDataCopyWithImpl<_PHXMonthData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PHXMonthDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXMonthData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, isActive, code);

  @override
  String toString() {
    return 'PHXMonthData(id: $id, name: $name, isActive: $isActive, code: $code)';
  }
}

/// @nodoc
abstract mixin class _$PHXMonthDataCopyWith<$Res>
    implements $PHXMonthDataCopyWith<$Res> {
  factory _$PHXMonthDataCopyWith(
          _PHXMonthData value, $Res Function(_PHXMonthData) _then) =
      __$PHXMonthDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'code') String? code});
}

/// @nodoc
class __$PHXMonthDataCopyWithImpl<$Res>
    implements _$PHXMonthDataCopyWith<$Res> {
  __$PHXMonthDataCopyWithImpl(this._self, this._then);

  final _PHXMonthData _self;
  final $Res Function(_PHXMonthData) _then;

  /// Create a copy of PHXMonthData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? isActive = freezed,
    Object? code = freezed,
  }) {
    return _then(_PHXMonthData(
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
mixin _$PHXStatusLegendData {
  @JsonKey(name: 'title')
  String? get title;
  @JsonKey(name: 'status')
  String? get status;

  /// Create a copy of PHXStatusLegendData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PHXStatusLegendDataCopyWith<PHXStatusLegendData> get copyWith =>
      _$PHXStatusLegendDataCopyWithImpl<PHXStatusLegendData>(
          this as PHXStatusLegendData, _$identity);

  /// Serializes this PHXStatusLegendData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PHXStatusLegendData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, status);

  @override
  String toString() {
    return 'PHXStatusLegendData(title: $title, status: $status)';
  }
}

/// @nodoc
abstract mixin class $PHXStatusLegendDataCopyWith<$Res> {
  factory $PHXStatusLegendDataCopyWith(
          PHXStatusLegendData value, $Res Function(PHXStatusLegendData) _then) =
      _$PHXStatusLegendDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'status') String? status});
}

/// @nodoc
class _$PHXStatusLegendDataCopyWithImpl<$Res>
    implements $PHXStatusLegendDataCopyWith<$Res> {
  _$PHXStatusLegendDataCopyWithImpl(this._self, this._then);

  final PHXStatusLegendData _self;
  final $Res Function(PHXStatusLegendData) _then;

  /// Create a copy of PHXStatusLegendData
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

/// Adds pattern-matching-related methods to [PHXStatusLegendData].
extension PHXStatusLegendDataPatterns on PHXStatusLegendData {
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
    TResult Function(_PHXStatusLegendData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXStatusLegendData() when $default != null:
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
    TResult Function(_PHXStatusLegendData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXStatusLegendData():
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
    TResult? Function(_PHXStatusLegendData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXStatusLegendData() when $default != null:
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
    TResult Function(@JsonKey(name: 'title') String? title,
            @JsonKey(name: 'status') String? status)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PHXStatusLegendData() when $default != null:
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
    TResult Function(@JsonKey(name: 'title') String? title,
            @JsonKey(name: 'status') String? status)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXStatusLegendData():
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
    TResult? Function(@JsonKey(name: 'title') String? title,
            @JsonKey(name: 'status') String? status)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PHXStatusLegendData() when $default != null:
        return $default(_that.title, _that.status);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _PHXStatusLegendData implements PHXStatusLegendData {
  const _PHXStatusLegendData(
      {@JsonKey(name: 'title') this.title,
      @JsonKey(name: 'status') this.status});
  factory _PHXStatusLegendData.fromJson(Map<String, dynamic> json) =>
      _$PHXStatusLegendDataFromJson(json);

  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'status')
  final String? status;

  /// Create a copy of PHXStatusLegendData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PHXStatusLegendDataCopyWith<_PHXStatusLegendData> get copyWith =>
      __$PHXStatusLegendDataCopyWithImpl<_PHXStatusLegendData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PHXStatusLegendDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PHXStatusLegendData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, status);

  @override
  String toString() {
    return 'PHXStatusLegendData(title: $title, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$PHXStatusLegendDataCopyWith<$Res>
    implements $PHXStatusLegendDataCopyWith<$Res> {
  factory _$PHXStatusLegendDataCopyWith(_PHXStatusLegendData value,
          $Res Function(_PHXStatusLegendData) _then) =
      __$PHXStatusLegendDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'status') String? status});
}

/// @nodoc
class __$PHXStatusLegendDataCopyWithImpl<$Res>
    implements _$PHXStatusLegendDataCopyWith<$Res> {
  __$PHXStatusLegendDataCopyWithImpl(this._self, this._then);

  final _PHXStatusLegendData _self;
  final $Res Function(_PHXStatusLegendData) _then;

  /// Create a copy of PHXStatusLegendData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? status = freezed,
  }) {
    return _then(_PHXStatusLegendData(
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
