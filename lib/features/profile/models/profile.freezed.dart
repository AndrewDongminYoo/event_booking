// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Profile {
  BigInt get id;
  String get email;
  String? get fullName;
  List<String>? get favoriteArtists;
  DateTime? get createdAt;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<Profile> get copyWith => _$ProfileCopyWithImpl<Profile>(this as Profile, _$identity);

  /// Serializes this Profile to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Profile &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) || other.fullName == fullName) &&
            const DeepCollectionEquality().equals(
              other.favoriteArtists,
              favoriteArtists,
            ) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    email,
    fullName,
    const DeepCollectionEquality().hash(favoriteArtists),
    createdAt,
  );

  @override
  String toString() {
    return 'Profile(id: $id, email: $email, fullName: $fullName, favoriteArtists: $favoriteArtists, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) _then) = _$ProfileCopyWithImpl;
  @useResult
  $Res call({
    BigInt id,
    String email,
    String? fullName,
    List<String>? favoriteArtists,
    DateTime? createdAt,
  });
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res> implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._self, this._then);

  final Profile _self;
  final $Res Function(Profile) _then;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? fullName = freezed,
    Object? favoriteArtists = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as BigInt,
        email: null == email
            ? _self.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        fullName: freezed == fullName
            ? _self.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String?,
        favoriteArtists: freezed == favoriteArtists
            ? _self.favoriteArtists
            : favoriteArtists // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        createdAt: freezed == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _Profile implements Profile {
  const _Profile({
    required this.id,
    required this.email,
    this.fullName,
    final List<String>? favoriteArtists,
    this.createdAt,
  }) : _favoriteArtists = favoriteArtists;
  factory _Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  @override
  final BigInt id;
  @override
  final String email;
  @override
  final String? fullName;
  final List<String>? _favoriteArtists;
  @override
  List<String>? get favoriteArtists {
    final value = _favoriteArtists;
    if (value == null) return null;
    if (_favoriteArtists is EqualUnmodifiableListView) return _favoriteArtists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? createdAt;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfileCopyWith<_Profile> get copyWith => __$ProfileCopyWithImpl<_Profile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProfileToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Profile &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) || other.fullName == fullName) &&
            const DeepCollectionEquality().equals(
              other._favoriteArtists,
              _favoriteArtists,
            ) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    email,
    fullName,
    const DeepCollectionEquality().hash(_favoriteArtists),
    createdAt,
  );

  @override
  String toString() {
    return 'Profile(id: $id, email: $email, fullName: $fullName, favoriteArtists: $favoriteArtists, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$ProfileCopyWith(_Profile value, $Res Function(_Profile) _then) = __$ProfileCopyWithImpl;
  @override
  @useResult
  $Res call({
    BigInt id,
    String email,
    String? fullName,
    List<String>? favoriteArtists,
    DateTime? createdAt,
  });
}

/// @nodoc
class __$ProfileCopyWithImpl<$Res> implements _$ProfileCopyWith<$Res> {
  __$ProfileCopyWithImpl(this._self, this._then);

  final _Profile _self;
  final $Res Function(_Profile) _then;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? fullName = freezed,
    Object? favoriteArtists = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _Profile(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as BigInt,
        email: null == email
            ? _self.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        fullName: freezed == fullName
            ? _self.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String?,
        favoriteArtists: freezed == favoriteArtists
            ? _self._favoriteArtists
            : favoriteArtists // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        createdAt: freezed == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}
