// In-memory event repository backed by static seed data for the POC.

// 🌎 Project imports:
import 'package:event_booking/features/events/data/events_seed.dart';
import 'package:event_booking/features/events/models/event.dart';

class EventRepository {
  EventRepository({List<Event>? initialEvents}) : _events = List<Event>.unmodifiable(initialEvents ?? seedEvents);

  final List<Event> _events;

  List<Event> get events => _events;

  List<Event> search({
    String? query,
    String? artist,
    DateTime? from,
    DateTime? to,
  }) {
    return _events
        .where((event) {
          final matchesQuery =
              query == null ||
              query.isEmpty ||
              event.title.toLowerCase().contains(query.toLowerCase()) ||
              event.artist.toLowerCase().contains(query.toLowerCase()) ||
              event.venue.toLowerCase().contains(query.toLowerCase());

          final matchesArtist = artist == null || artist.isEmpty || event.artist.toLowerCase() == artist.toLowerCase();

          final matchesFrom = from == null || !event.dateTime.isBefore(from);
          final matchesTo = to == null || !event.dateTime.isAfter(to);

          return matchesQuery && matchesArtist && matchesFrom && matchesTo;
        })
        .toList(growable: false);
  }

  Event? byId(String id) => _events.cast<Event?>().firstWhere((e) => e?.id == id, orElse: () => null);
}
