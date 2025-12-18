// 🎯 Dart imports:
import 'dart:async';
import 'dart:math';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 🌎 Project imports:
import 'package:event_booking/app/view/event_detail_page.dart';
import 'package:event_booking/app/widgets/event_card.dart';
import 'package:event_booking/features/bookings/booking_providers.dart';
import 'package:event_booking/features/events/event_providers.dart';
import 'package:event_booking/features/events/models/event.dart';
import 'package:event_booking/features/recommendations/recommendation_providers.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventMap = ref.watch(eventWithBookingStatusProvider);
    final entries = eventMap.entries.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('K-Wave Events'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: entries.isEmpty
            ? const Center(child: Text('No events match your filters yet.'))
            : GridView.builder(
                itemCount: entries.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width > 800 ? 3 : 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 3 / 4,
                ),
                itemBuilder: (_, index) {
                  final entry = entries[index];
                  final event = entry.key;
                  final isBooked = entry.value;
                  return EventCard(
                    event: event,
                    isBooked: isBooked,
                    onTap: () => _openDetail(context, ref, event),
                    onBook: () => _attemptReserve(context, ref, event),
                  );
                },
              ),
      ),
    );
  }

  void _openDetail(BuildContext context, WidgetRef ref, Event event) {
    ref.read(viewedEventsProvider.notifier).trackView(event.id);
    unawaited(
      Navigator.of(context).push<void>(
        MaterialPageRoute(
          builder: (_) => EventDetailPage(eventId: event.id),
        ),
      ),
    );
  }

  void _attemptReserve(BuildContext context, WidgetRef ref, Event event) {
    final notifier = ref.read(bookingsProvider.notifier);
    final success = notifier.reserve(event);
    final updated = ref.read(eventRepositoryProvider).byId(event.id) ?? event;
    final seatsLeft = max(updated.seatsLeft, 0);

    if (success) {
      _showSnack(context, 'Reservation confirmed. $seatsLeft seats left.');
      return;
    }

    if (updated.isSoldOut) {
      unawaited(
        showDialog<void>(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Sold out'),
            content: Text('This event is fully booked. Seats left: $seatsLeft'),
            actions: [
              TextButton(
                onPressed: Navigator.of(context).pop,
                child: const Text('Close'),
              ),
            ],
          ),
        ),
      );
    } else {
      _showSnack(context, 'Already booked. Seats left: $seatsLeft');
    }
  }

  void _showSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}
