// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:intl/intl.dart';

// 🌎 Project imports:
import 'package:event_booking/features/events/models/event.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    required this.event,
    this.isBooked = false,
    this.onTap,
    this.onBook,
    this.showBookButton = true,
    super.key,
  });

  final Event event;
  final bool isBooked;
  final VoidCallback? onTap;
  final VoidCallback? onBook;
  final bool showBookButton;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isSoldOut = event.isSoldOut;
    final formatter = DateFormat('MMM d • h:mm a');
    final label = isSoldOut
        ? 'Sold Out'
        : isBooked
        ? 'Booked'
        : 'Reserve';

    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  if (event.imageUrl != null)
                    Image.network(
                      event.imageUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => Container(color: Colors.grey.shade300),
                    )
                  else
                    Container(color: Colors.grey.shade300),
                  Positioned(
                    top: 12,
                    left: 12,
                    child: SeatBadge(event: event),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    event.artist,
                    style: theme.textTheme.bodyMedium?.copyWith(color: Colors.black87),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.schedule, size: 16, color: Colors.black54),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          formatter.format(event.dateTime),
                          style: theme.textTheme.bodySmall?.copyWith(color: Colors.black54),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    event.venue,
                    style: theme.textTheme.bodySmall?.copyWith(color: Colors.black54),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (showBookButton) ...[
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: isSoldOut || isBooked ? null : onBook,
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: Text(label),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SeatBadge extends StatelessWidget {
  const SeatBadge({required this.event, super.key});

  final Event event;

  @override
  Widget build(BuildContext context) {
    final isSoldOut = event.isSoldOut;
    final theme = Theme.of(context);
    final bg = isSoldOut ? theme.colorScheme.errorContainer : theme.colorScheme.secondaryContainer;
    final fg = isSoldOut ? theme.colorScheme.onErrorContainer : theme.colorScheme.onSecondaryContainer;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: bg.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Text(
          isSoldOut ? 'Sold Out' : '${event.seatsLeft} seats left',
          style: theme.textTheme.labelMedium?.copyWith(
            color: fg,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
