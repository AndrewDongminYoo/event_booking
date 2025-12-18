// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

// 🌎 Project imports:
import 'package:event_booking/features/bookings/data/booking_repository.dart';
import 'package:event_booking/features/bookings/models/booking.dart';
import 'package:event_booking/features/events/models/event.dart';

final bookingRepositoryProvider = Provider<BookingRepository>((ref) {
  return BookingRepository();
});

final bookingsProvider = StateNotifierProvider<BookingController, List<Booking>>((ref) {
  final repo = ref.watch(bookingRepositoryProvider);
  return BookingController(repo);
});

class BookingController extends StateNotifier<List<Booking>> {
  BookingController(this._repository) : super(_repository.bookings);

  final BookingRepository _repository;

  bool reserve(Event event) {
    final created = _repository.reserve(event);
    if (created) {
      state = _repository.bookings;
    }
    return created;
  }

  bool cancel(String eventId) {
    final removed = _repository.cancel(eventId);
    if (removed) {
      state = _repository.bookings;
    }
    return removed;
  }

  bool isBooked(String eventId) => _repository.isBooked(eventId);
}
