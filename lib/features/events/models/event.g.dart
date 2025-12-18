// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Event _$EventFromJson(Map<String, dynamic> json) => _Event(
  id: BigInt.parse(json['id'] as String),
  title: json['title'] as String,
  artist: json['artist'] as String,
  description: json['description'] as String,
  venue: json['venue'] as String,
  eventDate: DateTime.parse(json['event_date'] as String),
  imageUrl: json['image_url'] as String,
  ticketPrice: (json['ticket_price'] as num).toDouble(),
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  totalSeats: (json['total_seats'] as num).toInt(),
  bookedSeats: (json['booked_seats'] as num).toInt(),
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$EventToJson(_Event instance) => <String, dynamic>{
  'id': instance.id.toString(),
  'title': instance.title,
  'artist': instance.artist,
  'description': instance.description,
  'venue': instance.venue,
  'event_date': instance.eventDate.toIso8601String(),
  'image_url': instance.imageUrl,
  'ticket_price': instance.ticketPrice,
  'tags': instance.tags,
  'total_seats': instance.totalSeats,
  'booked_seats': instance.bookedSeats,
  'created_at': instance.createdAt.toIso8601String(),
};
