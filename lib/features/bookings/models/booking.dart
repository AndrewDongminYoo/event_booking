// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking.freezed.dart';
part 'booking.g.dart';

@freezed
// Booking entity representing a user's reservation for an event.
abstract class Booking with _$Booking {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Booking({
    required BigInt eventId,
    required DateTime bookingDate,
  }) = _Booking;
  factory Booking.fromJson(Map<String, dynamic> json) => _$BookingFromJson(json);
}
