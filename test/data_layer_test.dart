// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 🌎 Project imports:
import 'package:event_booking/features/bookings/booking_providers.dart';
import 'package:event_booking/features/bookings/data/booking_storage.dart';
import 'package:event_booking/features/events/event_providers.dart';
import 'package:event_booking/features/recommendations/recommendation_providers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  late ProviderContainer container;
  setUp(() {
    container = ProviderContainer(
      overrides: [
        bookingStorageProvider.overrideWithValue(InMemoryBookingStorage()),
      ],
    );
  });
  tearDown(() {
    container.dispose();
  });

  test('booking controller prevents duplicate reservations', () {
    final events = container.read(eventsProvider);
    final bookingController = container.read(bookingsProvider.notifier);

    final first = bookingController.reserve(events.first);
    final duplicate = bookingController.reserve(events.first);

    expect(first, isTrue);
    expect(duplicate, isFalse, reason: 'Should not allow duplicate bookings');
    expect(container.read(bookingsProvider).length, 1);
  });

  test('search filters events by query', () {
    final filtered = container.read(filteredEventsProvider(query: 'Seoul'));

    expect(filtered, isNotEmpty);
    expect(filtered.every((e) => e.venue.contains('Seoul')), isTrue);
  });

  test('recommendations favor recently viewed artist', () {
    final events = container.read(eventsProvider);
    final lumi = events.firstWhere((e) => e.artist == 'Lumi');

    container.read(viewedEventsProvider.notifier).trackView(lumi.id);

    final recommended = container.read(recommendationsProvider);

    expect(recommended, isNotEmpty);
    expect(recommended.first.artist, lumi.artist);
  });

  test('reservation fails when seats are sold out', () {
    final events = container.read(eventsProvider);
    final soldOut = events.firstWhere(
      (e) => e.bookedSeats >= e.totalSeats,
      orElse: () => events.first,
    );

    final bookingController = container.read(bookingsProvider.notifier);
    final reserved = bookingController.reserve(soldOut);

    expect(reserved, isFalse);
  });
}
