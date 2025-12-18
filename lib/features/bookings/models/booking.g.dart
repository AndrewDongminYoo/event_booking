// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Booking _$BookingFromJson(Map<String, dynamic> json) => _Booking(
  eventId: BigInt.parse(json['event_id'] as String),
  bookingDate: DateTime.parse(json['booking_date'] as String),
);

Map<String, dynamic> _$BookingToJson(_Booking instance) => <String, dynamic>{
  'event_id': instance.eventId.toString(),
  'booking_date': instance.bookingDate.toIso8601String(),
};
