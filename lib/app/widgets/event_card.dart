// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:intl/intl.dart';

// 🌎 Project imports:
import 'package:event_booking/features/events/models/event.dart';
import 'package:event_booking/theme/design_tokens.dart';
import 'package:event_booking/widgets/custom_image_view.dart';

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
    final statusChips = _buildStatusChips(event);
    final metaText = '${_dDayLabel(event.eventDate)} • ${_promoLabel(event)}';

    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(AppRadius.md),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _PosterSection(event: event),
            Padding(
              padding: const EdgeInsets.fromLTRB(AppSpacing.sm, AppSpacing.sm, AppSpacing.sm, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    metaText,
                    style: AppTextStyles.metaAccent,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    event.title,
                    style: AppTextStyles.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    event.artist.toUpperCase(),
                    style: AppTextStyles.subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (statusChips.isNotEmpty) ...[
                    const SizedBox(height: AppSpacing.xs),
                    Row(
                      children: [
                        for (var i = 0; i < statusChips.length; i++) ...[
                          if (i > 0) const SizedBox(width: AppSpacing.xxs),
                          statusChips[i],
                        ],
                      ],
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

  List<Widget> _buildStatusChips(Event event) {
    final now = DateTime.now();
    final daysFromCreation = now.difference(event.createdAt).inDays;
    final isNew = daysFromCreation.abs() <= 60;

    final bookingRatio = event.totalSeats == 0 ? 0 : event.bookedSeats / event.totalSeats;
    final isHot = bookingRatio >= 0.75 || event.isSoldOut || isBooked;

    return [
      if (isNew) const _StatusChip.filled(label: 'NEW'),
      if (isHot) const _StatusChip.outline(label: 'HOT'),
    ];
  }

  String _dDayLabel(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final target = DateTime(date.year, date.month, date.day);
    final diff = target.difference(today).inDays;

    if (diff > 0) return 'D-$diff';
    if (diff == 0) return 'D-DAY';
    return '종료';
  }

  String _promoLabel(Event event) {
    if (event.tags.isNotEmpty) {
      return event.tags.first;
    }
    return '기간한정';
  }
}

class _PosterSection extends StatelessWidget {
  const _PosterSection({required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(AppRadius.md);
    const bannerHeight = 36.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: radius,
              topRight: radius,
            ),
            border: Border.all(color: AppColors.black10),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: radius,
              topRight: radius,
            ),
            child: AspectRatio(
              aspectRatio: 1,
              child: CustomImageView(
                imagePath: event.imageUrl,
                semanticLabel: event.tags.join(' '),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          height: bannerHeight,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.gradientStart, AppColors.gradientEnd],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: radius,
              bottomRight: radius,
            ),
            border: Border(
              left: BorderSide(color: AppColors.athensGray),
              right: BorderSide(color: AppColors.athensGray),
              bottom: BorderSide(color: AppColors.athensGray),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                _eventType(event),
                style: AppTextStyles.bannerLabel,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  _dateLabel(event.eventDate),
                  style: AppTextStyles.bannerMeta,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _eventType(Event event) {
    if (event.tags.isNotEmpty) return event.tags.first.toUpperCase();
    return 'MEET&CALL';
  }

  String _dateLabel(DateTime date) {
    final formatter = DateFormat('yyyy.MM.dd');
    return '${formatter.format(date)} KST';
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip.filled({required this.label})
    : background = AppColors.black,
      textColor = AppColors.white,
      borderColor = AppColors.black,
      horizontal = 6,
      vertical = 4;

  const _StatusChip.outline({required this.label})
    : background = Colors.transparent,
      textColor = AppColors.crimson,
      borderColor = AppColors.crimson,
      horizontal = 7,
      vertical = 5;

  final String label;
  final Color background;
  final Color textColor;
  final Color borderColor;
  final double horizontal;
  final double vertical;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(AppRadius.xs),
        border: Border.all(color: borderColor),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: Text(
          label,
          style: AppTextStyles.chipLabel.copyWith(color: textColor),
        ),
      ),
    );
  }
}

/// Backwards-compatible badge used elsewhere in the app (e.g., detail page).
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
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Text(
          isSoldOut ? 'Sold Out' : '${event.availableSeats} seats left',
          style: theme.textTheme.labelMedium?.copyWith(
            color: fg,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
