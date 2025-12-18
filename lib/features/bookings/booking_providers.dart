// 🎯 Dart imports:
import 'dart:async';

// 📦 Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 🌎 Project imports:
import 'package:event_booking/features/bookings/data/booking_repository.dart';
import 'package:event_booking/features/bookings/data/booking_storage.dart';
import 'package:event_booking/features/bookings/models/booking.dart';
import 'package:event_booking/features/events/models/event.dart';

part 'booking_providers.g.dart';

@riverpod
FutureOr<SharedPreferences> sharedPreferences(Ref ref) {
  return SharedPreferences.getInstance();
}

@riverpod
BookingStorage bookingStorage(Ref ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  if (prefs.value != null) {
    return SharedPreferencesBookingStorage(prefs.value!);
  } else {
    throw UnimplementedError(
      'BookingStorage provider cannot be used before SharedPreferences is ready.',
    );
  }
}

@riverpod
BookingRepository bookingRepository(Ref ref) {
  return BookingRepository();
}

@Riverpod(keepAlive: true)
class Bookings extends _$Bookings {
  @override
  List<Booking> build() {
    final repository = ref.read(bookingRepositoryProvider);
    final storage = ref.read(bookingStorageProvider);
    ref.onAddListener(() async {
      final stored = await storage.load();
      repository.seedBookings(stored);
    });
    return repository.bookings;
  }

  bool reserve(Event event) {
    final repository = ref.read(bookingRepositoryProvider);
    final _ = ref.read(bookingStorageProvider);
    final created = repository.reserve(event);
    if (created) {
      state = repository.bookings;
      _persist();
    }
    return created;
  }

  bool cancel(BigInt eventId) {
    final repository = ref.read(bookingRepositoryProvider);
    final _ = ref.read(bookingStorageProvider);
    final removed = repository.cancel(eventId);
    if (removed) {
      state = repository.bookings;
      _persist();
    }
    return removed;
  }

  bool isBooked(BigInt eventId) {
    final repository = ref.read(bookingRepositoryProvider);
    final _ = ref.read(bookingStorageProvider);
    return repository.isBooked(eventId);
  }

  void _persist() {
    final storage = ref.read(bookingStorageProvider);
    unawaited(storage.save(state));
  }
}
