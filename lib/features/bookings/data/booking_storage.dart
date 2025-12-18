// 🎯 Dart imports:
import 'dart:convert';

// 📦 Package imports:
import 'package:shared_preferences/shared_preferences.dart';

// 🌎 Project imports:
import 'package:event_booking/features/bookings/models/booking.dart';

/// Abstraction over persistence for bookings.
abstract class BookingStorage {
  Future<List<Booking>> load();
  Future<void> save(List<Booking> bookings);
}

class SharedPreferencesBookingStorage implements BookingStorage {
  SharedPreferencesBookingStorage(this._prefs);

  static const _key = 'bookings_v1';
  final SharedPreferences _prefs;

  @override
  Future<List<Booking>> load() async {
    final raw = _prefs.getStringList(_key);
    if (raw == null) return const [];
    return raw
        .map((item) {
          try {
            final decoded = jsonDecode(item) as Map<String, dynamic>;
            return Booking(
              eventId: BigInt.parse(decoded['eventId'] as String),
              bookedAt: DateTime.fromMillisecondsSinceEpoch(decoded['bookedAt'] as int),
            );
          } catch (_) {
            return null;
          }
        })
        .whereType<Booking>()
        .toList(growable: false);
  }

  @override
  Future<void> save(List<Booking> bookings) async {
    final payload = bookings
        .map(
          (b) => jsonEncode(
            {
              'eventId': b.eventId.toString(),
              'bookedAt': b.bookedAt.millisecondsSinceEpoch,
            },
          ),
        )
        .toList(growable: false);
    await _prefs.setStringList(_key, payload);
  }
}

/// In-memory storage helpful for tests or preview environments.
class InMemoryBookingStorage implements BookingStorage {
  List<Booking> _cache = const [];

  @override
  Future<List<Booking>> load() async => _cache;

  @override
  Future<void> save(List<Booking> bookings) async {
    _cache = List<Booking>.from(bookings);
  }
}
