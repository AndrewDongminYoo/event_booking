// 🎯 Dart imports:
import 'dart:async';
import 'dart:math';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

// 🌎 Project imports:
import 'package:event_booking/app/widgets/event_card.dart';
import 'package:event_booking/features/bookings/booking_providers.dart';
import 'package:event_booking/features/events/event_providers.dart';
import 'package:event_booking/features/events/models/event.dart';
import 'package:event_booking/features/recommendations/recommendation_providers.dart';

class EventDetailPage extends ConsumerStatefulWidget {
  const EventDetailPage({required this.eventId, super.key});

  final BigInt eventId;

  @override
  ConsumerState<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends ConsumerState<EventDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final event = ref.read(eventRepositoryProvider).byId(widget.eventId);
      if (event != null) {
        ref.read(viewedEventsProvider.notifier).trackView(event.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final events = ref.watch(eventsProvider);
    final event = _findEvent(events, widget.eventId);

    if (event == null) {
      return const Scaffold(
        body: Center(child: Text('Event not found')),
      );
    }

    final booked = ref.watch(bookingsProvider).any((b) => b.eventId == event.id);
    final formatter = DateFormat('MMM d, yyyy • h:mm a');
    final isSoldOut = event.isSoldOut;
    final label = isSoldOut
        ? 'Sold Out'
        : booked
        ? 'Booked'
        : 'Reserve';

    return Scaffold(
      appBar: AppBar(
        title: Text(event.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    event.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) => Container(color: Colors.grey.shade300),
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: SeatBadge(event: event),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    event.artist,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.black87),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.event, size: 20),
                      const SizedBox(width: 8),
                      Text(formatter.format(event.eventDate)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.place, size: 20),
                      const SizedBox(width: 8),
                      Expanded(child: Text(event.venue)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: event.tags.map((t) => Chip(label: Text(t))).toList(),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    event.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Seats left: ${event.availableSeats}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: isSoldOut || booked ? null : () => _attemptReserve(event),
                      child: Text(label),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _attemptReserve(Event event) {
    final success = ref.read(bookingsProvider.notifier).reserve(event);
    final updated = ref.read(eventRepositoryProvider).byId(event.id) ?? event;
    final seatsLeft = max(updated.availableSeats, 0);

    if (success) {
      _showSnack('Reservation confirmed. $seatsLeft seats left.');
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
      _showSnack('Already booked. Seats left: $seatsLeft');
    }
  }

  void _showSnack(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}

Event? _findEvent(List<Event> events, BigInt id) {
  for (final e in events) {
    if (e.id == id) {
      return e;
    }
  }
  return null;
}
