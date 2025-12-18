// Defines the core event entity used across the POC.
// Keep the model framework-agnostic so it can be reused in data, domain, and UI layers.

// 📦 Package imports:
import 'package:meta/meta.dart';

@immutable
class Event {
  const Event({
    required this.id,
    required this.title,
    required this.artist,
    required this.dateTime,
    required this.venue,
    required this.tags,
    required this.totalSeats,
    required this.bookedSeats,
    this.imageUrl,
    this.description = '',
  });

  /// Prefer BigInt so we can align with potential backend ids later.
  final BigInt id;
  final String title;
  final String artist;
  final DateTime dateTime;
  final String venue;
  final List<String> tags;
  final int totalSeats;
  final int bookedSeats;
  final String? imageUrl;
  final String description;

  bool get isUpcoming => dateTime.isAfter(DateTime.now());
  bool get isSoldOut => bookedSeats >= totalSeats;
  int get seatsLeft => (totalSeats - bookedSeats).clamp(0, totalSeats);

  Event copyWith({
    BigInt? id,
    String? title,
    String? artist,
    DateTime? dateTime,
    String? venue,
    List<String>? tags,
    int? totalSeats,
    int? bookedSeats,
    String? imageUrl,
    String? description,
  }) {
    return Event(
      id: id ?? this.id,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      dateTime: dateTime ?? this.dateTime,
      venue: venue ?? this.venue,
      tags: tags ?? this.tags,
      totalSeats: totalSeats ?? this.totalSeats,
      bookedSeats: bookedSeats ?? this.bookedSeats,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
    );
  }
}
