// 🎯 Dart imports:
import 'dart:async';

// 📦 Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 🌎 Project imports:
import 'package:event_booking/features/bookings/booking_providers.dart';
import 'package:event_booking/features/events/event_providers.dart';
import 'package:event_booking/features/events/models/event.dart';

part 'recommendation_providers.g.dart';

@Riverpod(keepAlive: true)
/// Tracks viewed event ids (most recent first).
class ViewedEvents extends _$ViewedEvents {
  static const _prefsKey = 'viewed_events_v1';

  @override
  List<BigInt> build() {
    ref.listen(sharedPreferencesProvider, (previous, next) {
      _restoreFromPrefs(next);
    });
    return <BigInt>[];
  }

  void trackView(BigInt eventId) {
    // Move to front, keep list unique and short.
    final next = <BigInt>[eventId, ...state.where((id) => id != eventId)];
    state = next.take(10).toList(growable: false);
    unawaited(_persist());
  }

  void _restoreFromPrefs(SharedPreferences prefs) {
    final stored = prefs.getStringList(_prefsKey);
    if (stored == null || stored.isEmpty) return;
    final ids = stored.map(BigInt.tryParse).whereType<BigInt>().toList(growable: false);
    if (ids.isNotEmpty) {
      state = ids;
    }
  }

  Future<void> _persist() async {
    try {
      final prefs = ref.read(sharedPreferencesProvider);
      await prefs.setStringList(
        _prefsKey,
        state.map((id) => id.toString()).toList(growable: false),
      );
    } catch (_) {
      // If SharedPreferences is unavailable (e.g. widget tests), skip persistence.
    }
  }
}

@Riverpod(keepAlive: true)
/// Produces a ranked list of recommended events based on recent views and bookings.
List<Event> recommendations(Ref ref) {
  final events = ref.watch(eventsProvider);
  final bookings = ref.watch(bookingsProvider);
  final viewedIds = ref.watch(viewedEventsProvider);

  final bookedIds = bookings.map((b) => b.eventId).toSet();

  // Simple heuristic:
  // - Prefer same artist as last viewed/booked (+3)
  // - Prefer fanmeet/fansign tags (+1)
  // - De-prioritize already booked events (score = -inf -> excluded)
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
}
