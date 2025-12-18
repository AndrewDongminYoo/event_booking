// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
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

@Riverpod(keepAlive: true)
List<Event> filteredEvents(
  Ref ref, {
  String? query,
  String? artist,
  DateTimeRange? range,
}) {
  final repo = ref.watch(eventRepositoryProvider);
  return repo.search(
    query: query,
    artist: artist,
    from: range?.start,
    to: range?.end,
  );
}

@riverpod
// Convenience provider to expose booked status with events.
Map<Event, bool> eventWithBookingStatus(Ref ref) {
  final events = ref.read(eventRepositoryProvider).events;
  final bookings = ref.read(bookingsProvider);
  final bookedIds = bookings.map((b) => b.eventId).toSet();
  return {for (final e in events) e: bookedIds.contains(e.id)};
}
