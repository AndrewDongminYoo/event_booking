// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Profile _$ProfileFromJson(Map<String, dynamic> json) => _Profile(
  id: BigInt.parse(json['id'] as String),
  email: json['email'] as String,
  fullName: json['full_name'] as String?,
  favoriteArtists: (json['favorite_artists'] as List<dynamic>?)?.map((e) => e as String).toList(),
  createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$ProfileToJson(_Profile instance) => <String, dynamic>{
  'id': instance.id.toString(),
  'email': instance.email,
  'full_name': ?instance.fullName,
  'favorite_artists': ?instance.favoriteArtists,
  'created_at': ?instance.createdAt?.toIso8601String(),
};
