// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 🌎 Project imports:
import 'package:event_booking/features/bookings/booking_providers.dart';
import 'package:event_booking/features/events/data/event_repository.dart';
import 'package:event_booking/features/events/models/event.dart';

part 'event_providers.g.dart';

@Riverpod(keepAlive: true)
EventRepository eventRepository(Ref ref) {
  return EventRepository();
}

@Riverpod(keepAlive: true)
List<Event> events(Ref ref) {
  return ref.watch(eventRepositoryProvider).events;
}

final searchQueryProvider = StateProvider<String?>((ref) => null);
final artistFilterProvider = StateProvider<String?>((ref) => null);
final dateRangeFilterProvider = StateProvider<DateTimeRange?>((ref) => null);

@Riverpod(keepAlive: true)
List<Event> filteredEvents(Ref ref) {
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
}

@Riverpod(keepAlive: true)
// Convenience provider to expose booked status with events.
Map<Event, bool> eventWithBookingStatus(Ref ref) {
  final events = ref.watch(filteredEventsProvider);
  final bookings = ref.watch(bookingsProvider);
  final bookedIds = bookings.map((b) => b.eventId).toSet();
  return {for (final e in events) e: bookedIds.contains(e.id)};
}
