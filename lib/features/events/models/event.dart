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
    this.imageUrl,
    this.description = '',
  });

  final String id;
  final String title;
  final String artist;
  final DateTime dateTime;
  final String venue;
  final List<String> tags;
  final String? imageUrl;
  final String description;

  bool get isUpcoming => dateTime.isAfter(DateTime.now());

  Event copyWith({
    String? id,
    String? title,
    String? artist,
    DateTime? dateTime,
    String? venue,
    List<String>? tags,
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
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
    );
  }
}
