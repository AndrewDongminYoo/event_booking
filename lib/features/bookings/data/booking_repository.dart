// Lightweight in-memory booking repository for the POC.

// 🌎 Project imports:
import 'package:event_booking/features/bookings/models/booking.dart';
import 'package:event_booking/features/events/models/event.dart';

class BookingRepository {
  final Map<String, Booking> _bookings = {};

  List<Booking> get bookings => _bookings.values.toList(growable: false)..sort(_byMostRecent);

  bool reserve(Event event) {
    if (_bookings.containsKey(event.id)) return false;
    _bookings[event.id] = Booking(
      eventId: event.id,
      bookedAt: DateTime.now(),
    );
    return true;
  }

  bool cancel(String eventId) => _bookings.remove(eventId) != null;

  bool isBooked(String eventId) => _bookings.containsKey(eventId);

  static int _byMostRecent(Booking a, Booking b) => b.bookedAt.compareTo(a.bookedAt);
}
