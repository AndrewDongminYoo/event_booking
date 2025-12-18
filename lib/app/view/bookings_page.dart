// 🎯 Dart imports:
import 'dart:async';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 🌎 Project imports:
import 'package:event_booking/app/widgets/event_card.dart';
import 'package:event_booking/features/bookings/booking_providers.dart';
import 'package:event_booking/features/events/event_providers.dart';
import 'package:event_booking/features/events/models/event.dart';

class BookingsPage extends ConsumerWidget {
  const BookingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookings = ref.watch(bookingsProvider);
    final repository = ref.watch(eventRepositoryProvider);

    final bookedEvents = bookings
        .map(
          (b) => repository.byId(b.eventId),
        )
        .whereType<Event>()
        .toList(growable: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bookings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: bookedEvents.isEmpty
            ? const Center(child: Text('You have no bookings yet.'))
            : ListView.separated(
                itemCount: bookedEvents.length,
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (_, index) {
                  final event = bookedEvents[index];
                  return EventCard(
                    event: event,
                    isBooked: true,
                    onTap: () => _showEventDialog(context, event),
                  );
                },
              ),
      ),
    );
  }

  void _showEventDialog(BuildContext context, Event event) {
    unawaited(
      showDialog<void>(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(event.title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(event.artist),
              const SizedBox(height: 8),
              Text('Seats left: ${event.availableSeats}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}
