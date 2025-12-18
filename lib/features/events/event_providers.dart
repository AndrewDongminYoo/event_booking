// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

// 🌎 Project imports:
import 'package:event_booking/features/bookings/booking_providers.dart';
import 'package:event_booking/features/events/data/event_repository.dart';
import 'package:event_booking/features/events/models/event.dart';

final eventRepositoryProvider = Provider<EventRepository>((ref) {
  return EventRepository();
});

final eventsProvider = Provider<List<Event>>((ref) {
  return ref.watch(eventRepositoryProvider).events;
});

final searchQueryProvider = StateProvider<String?>((ref) => null);
final artistFilterProvider = StateProvider<String?>((ref) => null);
final dateRangeFilterProvider = StateProvider<DateTimeRange?>((ref) => null);

final filteredEventsProvider = Provider<List<Event>>((ref) {
  final repo = ref.watch(eventRepositoryProvider);
  final query = ref.watch(searchQueryProvider);
  final artist = ref.watch(artistFilterProvider);
  final range = ref.watch(dateRangeFilterProvider);

  return repo.search(
    query: query,
    artist: artist,
    from: range?.start,
    to: range?.end,
  );
});

// Convenience provider to expose booked status with events.
final eventWithBookingStatusProvider = Provider<Map<Event, bool>>((ref) {
  final events = ref.watch(filteredEventsProvider);
  final bookings = ref.watch(bookingsProvider);
  final bookedIds = bookings.map((b) => b.eventId).toSet();
  return {for (final e in events) e: bookedIds.contains(e.id)};
});
