// Booking entity representing a user's reservation for an event.

// 📦 Package imports:
import 'package:meta/meta.dart';

@immutable
class Booking {
  const Booking({
    required this.eventId,
    required this.bookedAt,
  });

  final String eventId;
  final DateTime bookedAt;
}
