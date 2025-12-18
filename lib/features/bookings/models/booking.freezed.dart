// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Booking {
  BigInt get eventId;
  DateTime get bookingDate;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookingCopyWith<Booking> get copyWith => _$BookingCopyWithImpl<Booking>(this as Booking, _$identity);

  /// Serializes this Booking to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Booking &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.bookingDate, bookingDate) || other.bookingDate == bookingDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, bookingDate);

  @override
  String toString() {
    return 'Booking(eventId: $eventId, bookingDate: $bookingDate)';
  }
}

/// @nodoc
abstract mixin class $BookingCopyWith<$Res> {
  factory $BookingCopyWith(Booking value, $Res Function(Booking) _then) = _$BookingCopyWithImpl;
  @useResult
  $Res call({BigInt eventId, DateTime bookingDate});
}

/// @nodoc
class _$BookingCopyWithImpl<$Res> implements $BookingCopyWith<$Res> {
  _$BookingCopyWithImpl(this._self, this._then);

  final Booking _self;
  final $Res Function(Booking) _then;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? eventId = null, Object? bookingDate = null}) {
    return _then(
      _self.copyWith(
        eventId: null == eventId
            ? _self.eventId
            : eventId // ignore: cast_nullable_to_non_nullable
                  as BigInt,
        bookingDate: null == bookingDate
            ? _self.bookingDate
            : bookingDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _Booking implements Booking {
  const _Booking({required this.eventId, required this.bookingDate});
  factory _Booking.fromJson(Map<String, dynamic> json) => _$BookingFromJson(json);

  @override
  final BigInt eventId;
  @override
  final DateTime bookingDate;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BookingCopyWith<_Booking> get copyWith => __$BookingCopyWithImpl<_Booking>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BookingToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Booking &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.bookingDate, bookingDate) || other.bookingDate == bookingDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, bookingDate);

  @override
  String toString() {
    return 'Booking(eventId: $eventId, bookingDate: $bookingDate)';
  }
}

/// @nodoc
abstract mixin class _$BookingCopyWith<$Res> implements $BookingCopyWith<$Res> {
  factory _$BookingCopyWith(_Booking value, $Res Function(_Booking) _then) = __$BookingCopyWithImpl;
  @override
  @useResult
  $Res call({BigInt eventId, DateTime bookingDate});
}

/// @nodoc
class __$BookingCopyWithImpl<$Res> implements _$BookingCopyWith<$Res> {
  __$BookingCopyWithImpl(this._self, this._then);

  final _Booking _self;
  final $Res Function(_Booking) _then;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? eventId = null, Object? bookingDate = null}) {
    return _then(
      _Booking(
        eventId: null == eventId
            ? _self.eventId
            : eventId // ignore: cast_nullable_to_non_nullable
                  as BigInt,
        bookingDate: null == bookingDate
            ? _self.bookingDate
            : bookingDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}
