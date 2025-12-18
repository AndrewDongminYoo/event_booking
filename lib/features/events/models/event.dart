// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
// Defines the core event entity used across the POC.
// Keep the model framework-agnostic so it can be reused in data, domain, and UI layers.
abstract class Event with _$Event {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Event({
    required BigInt id,
    required String title,
    required String artist,
    required String description,
    required String venue,
    required DateTime eventDate,
    required String imageUrl,
    required double ticketPrice,
    required List<String> tags,
    required int totalSeats,
    required int bookedSeats,
    required DateTime createdAt,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}

extension EventAvailability on Event {
  bool get isUpcoming => eventDate.isAfter(DateTime.now());
  bool get isSoldOut => bookedSeats >= totalSeats;
  int get availableSeats => (totalSeats - bookedSeats).clamp(0, totalSeats);
}
