// 🎯 Dart imports:
import 'dart:async';

// 📦 Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 🌎 Project imports:
import 'package:event_booking/features/bookings/data/booking_repository.dart';
import 'package:event_booking/features/bookings/data/booking_storage.dart';
import 'package:event_booking/features/bookings/models/booking.dart';
import 'package:event_booking/features/events/event_providers.dart';
import 'package:event_booking/features/events/models/event.dart';

part 'booking_providers.g.dart';

@riverpod
SharedPreferences sharedPreferences(Ref ref) {
  throw UnimplementedError(
    'SharedPreferences provider must be overridden with a real instance.',
  );
}

@riverpod
BookingStorage bookingStorage(Ref ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return SharedPreferencesBookingStorage(prefs);
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
    final eventsRepo = ref.watch(eventRepositoryProvider);
    if (!eventsRepo.tryReserveSeat(event.id)) {
      return false;
    }
    final created = repository.reserve(event);
    if (created) {
      state = repository.bookings;
      _persist();
      _refreshEventCaches();
    } else {
      // rollback seat in case of duplicate booking
      eventsRepo.releaseSeat(event.id);
    }
    return created;
  }

  bool cancel(BigInt eventId) {
    final repository = ref.read(bookingRepositoryProvider);
    final eventsRepo = ref.watch(eventRepositoryProvider);
    final removed = repository.cancel(eventId);
    if (removed) {
      eventsRepo.releaseSeat(eventId);
      state = repository.bookings;
      _persist();
      _refreshEventCaches();
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

  void _refreshEventCaches() {
    ref.invalidate(eventsProvider);
    ref.invalidate(filteredEventsProvider);
    ref.invalidate(eventWithBookingStatusProvider);
  }
}
