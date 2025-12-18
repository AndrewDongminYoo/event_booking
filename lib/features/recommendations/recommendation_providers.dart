// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

// 🌎 Project imports:
import 'package:event_booking/features/bookings/booking_providers.dart';
import 'package:event_booking/features/events/event_providers.dart';
import 'package:event_booking/features/events/models/event.dart';

/// Tracks viewed event ids (most recent first).
final viewedEventsProvider = StateNotifierProvider<ViewedEventsNotifier, List<String>>((ref) {
  return ViewedEventsNotifier();
});

class ViewedEventsNotifier extends StateNotifier<List<String>> {
  ViewedEventsNotifier() : super(const []);

  void trackView(String eventId) {
    // Move to front, keep list unique and short.
    final next = <String>[eventId, ...state.where((id) => id != eventId)];
    state = next.take(10).toList(growable: false);
  }
}

/// Produces a ranked list of recommended events based on recent views and bookings.
final recommendationsProvider = Provider<List<Event>>((ref) {
  final events = ref.watch(eventsProvider);
  final bookings = ref.watch(bookingsProvider);
  final viewedIds = ref.watch(viewedEventsProvider);

  final bookedIds = bookings.map((b) => b.eventId).toSet();

  // Simple heuristic:
  // - Prefer same artist as last viewed/booked (+3)
  // - Prefer fanmeet/fansign tags (+1)
  // - Deprioritize already booked events (score = -inf -> excluded)
  Event? lastViewed;
  if (viewedIds.isNotEmpty) {
    lastViewed = events.firstWhere(
      (e) => e.id == viewedIds.first,
      orElse: () => events.first,
    );
  } else if (bookings.isNotEmpty) {
    final lastBookingId = bookings.first.eventId;
    lastViewed = events.firstWhere(
      (e) => e.id == lastBookingId,
      orElse: () => events.first,
    );
  }

  int score(Event e) {
    if (bookedIds.contains(e.id)) return -9999;
    var value = 0;
    if (lastViewed != null && e.artist == lastViewed.artist) value += 3;
    if (e.tags.any((t) => t.contains('fanmeet') || t.contains('fansign'))) {
      value += 1;
    }
    return value;
  }

  final ranked = events.where((e) => e.isUpcoming).toList()
    ..sort((a, b) {
      final scoreDiff = score(b) - score(a);
      if (scoreDiff != 0) return scoreDiff;
      return a.dateTime.compareTo(b.dateTime);
    });

  return ranked.take(5).toList(growable: false);
});
