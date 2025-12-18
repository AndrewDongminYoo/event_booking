// In-memory event repository backed by static seed data for the POC.

// 🌎 Project imports:
import 'package:event_booking/features/events/data/events_seed.dart';
import 'package:event_booking/features/events/models/event.dart';

class EventRepository {
  EventRepository({List<Event>? initialEvents}) : _events = List<Event>.unmodifiable(initialEvents ?? seedEvents) {
    for (final event in _events) {
      _booked[event.id] = event.bookedSeats;
      _total[event.id] = event.totalSeats;
    }
  }

  final List<Event> _events;
  final Map<BigInt, int> _booked = {};
  final Map<BigInt, int> _total = {};

  List<Event> get events => _events.map(_materialize).toList(growable: false);

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
        .map(_materialize)
        .toList(growable: false);
  }

  Event? byId(BigInt id) {
    final event = _events.cast<Event?>().firstWhere(
      (e) => e?.id == id,
      orElse: () => null,
    );
    return event == null ? null : _materialize(event);
  }

  bool tryReserveSeat(BigInt eventId) {
    final currentBooked = _booked[eventId] ?? 0;
    final total = _total[eventId] ?? 0;
    if (currentBooked >= total) return false;
    _booked[eventId] = currentBooked + 1;
    return true;
  }

  bool releaseSeat(BigInt eventId) {
    final currentBooked = _booked[eventId];
    if (currentBooked == null || currentBooked == 0) return false;
    _booked[eventId] = currentBooked - 1;
    return true;
  }

  Event _materialize(Event base) {
    final booked = _booked[base.id] ?? base.bookedSeats;
    final total = _total[base.id] ?? base.totalSeats;
    return base.copyWith(bookedSeats: booked, totalSeats: total);
  }
}
