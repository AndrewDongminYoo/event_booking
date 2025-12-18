// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Event {

 BigInt get id; String get title; String get artist; String get description; String get venue; DateTime get eventDate; String get imageUrl; double get ticketPrice; List<String> get tags; int get totalSeats; int get bookedSeats; DateTime get createdAt;
/// Create a copy of Event
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventCopyWith<Event> get copyWith => _$EventCopyWithImpl<Event>(this as Event, _$identity);

  /// Serializes this Event to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Event&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.description, description) || other.description == description)&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.eventDate, eventDate) || other.eventDate == eventDate)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.ticketPrice, ticketPrice) || other.ticketPrice == ticketPrice)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.totalSeats, totalSeats) || other.totalSeats == totalSeats)&&(identical(other.bookedSeats, bookedSeats) || other.bookedSeats == bookedSeats)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,artist,description,venue,eventDate,imageUrl,ticketPrice,const DeepCollectionEquality().hash(tags),totalSeats,bookedSeats,createdAt);

@override
String toString() {
  return 'Event(id: $id, title: $title, artist: $artist, description: $description, venue: $venue, eventDate: $eventDate, imageUrl: $imageUrl, ticketPrice: $ticketPrice, tags: $tags, totalSeats: $totalSeats, bookedSeats: $bookedSeats, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $EventCopyWith<$Res>  {
  factory $EventCopyWith(Event value, $Res Function(Event) _then) = _$EventCopyWithImpl;
@useResult
$Res call({
 BigInt id, String title, String artist, String description, String venue, DateTime eventDate, String imageUrl, double ticketPrice, List<String> tags, int totalSeats, int bookedSeats, DateTime createdAt
});




}
/// @nodoc
class _$EventCopyWithImpl<$Res>
    implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._self, this._then);

  final Event _self;
  final $Res Function(Event) _then;

/// Create a copy of Event
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? artist = null,Object? description = null,Object? venue = null,Object? eventDate = null,Object? imageUrl = null,Object? ticketPrice = null,Object? tags = null,Object? totalSeats = null,Object? bookedSeats = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as BigInt,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,artist: null == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,venue: null == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as String,eventDate: null == eventDate ? _self.eventDate : eventDate // ignore: cast_nullable_to_non_nullable
as DateTime,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,ticketPrice: null == ticketPrice ? _self.ticketPrice : ticketPrice // ignore: cast_nullable_to_non_nullable
as double,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,totalSeats: null == totalSeats ? _self.totalSeats : totalSeats // ignore: cast_nullable_to_non_nullable
as int,bookedSeats: null == bookedSeats ? _self.bookedSeats : bookedSeats // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Event].
extension EventPatterns on Event {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Event value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Event() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Event value)  $default,){
final _that = this;
switch (_that) {
case _Event():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Event value)?  $default,){
final _that = this;
switch (_that) {
case _Event() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BigInt id,  String title,  String artist,  String description,  String venue,  DateTime eventDate,  String imageUrl,  double ticketPrice,  List<String> tags,  int totalSeats,  int bookedSeats,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Event() when $default != null:
return $default(_that.id,_that.title,_that.artist,_that.description,_that.venue,_that.eventDate,_that.imageUrl,_that.ticketPrice,_that.tags,_that.totalSeats,_that.bookedSeats,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BigInt id,  String title,  String artist,  String description,  String venue,  DateTime eventDate,  String imageUrl,  double ticketPrice,  List<String> tags,  int totalSeats,  int bookedSeats,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _Event():
return $default(_that.id,_that.title,_that.artist,_that.description,_that.venue,_that.eventDate,_that.imageUrl,_that.ticketPrice,_that.tags,_that.totalSeats,_that.bookedSeats,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BigInt id,  String title,  String artist,  String description,  String venue,  DateTime eventDate,  String imageUrl,  double ticketPrice,  List<String> tags,  int totalSeats,  int bookedSeats,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Event() when $default != null:
return $default(_that.id,_that.title,_that.artist,_that.description,_that.venue,_that.eventDate,_that.imageUrl,_that.ticketPrice,_that.tags,_that.totalSeats,_that.bookedSeats,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _Event implements Event {
  const _Event({required this.id, required this.title, required this.artist, required this.description, required this.venue, required this.eventDate, required this.imageUrl, required this.ticketPrice, required final  List<String> tags, required this.totalSeats, required this.bookedSeats, required this.createdAt}): _tags = tags;
  factory _Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

@override final  BigInt id;
@override final  String title;
@override final  String artist;
@override final  String description;
@override final  String venue;
@override final  DateTime eventDate;
@override final  String imageUrl;
@override final  double ticketPrice;
 final  List<String> _tags;
@override List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override final  int totalSeats;
@override final  int bookedSeats;
@override final  DateTime createdAt;

/// Create a copy of Event
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventCopyWith<_Event> get copyWith => __$EventCopyWithImpl<_Event>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Event&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.description, description) || other.description == description)&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.eventDate, eventDate) || other.eventDate == eventDate)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.ticketPrice, ticketPrice) || other.ticketPrice == ticketPrice)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.totalSeats, totalSeats) || other.totalSeats == totalSeats)&&(identical(other.bookedSeats, bookedSeats) || other.bookedSeats == bookedSeats)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,artist,description,venue,eventDate,imageUrl,ticketPrice,const DeepCollectionEquality().hash(_tags),totalSeats,bookedSeats,createdAt);

@override
String toString() {
  return 'Event(id: $id, title: $title, artist: $artist, description: $description, venue: $venue, eventDate: $eventDate, imageUrl: $imageUrl, ticketPrice: $ticketPrice, tags: $tags, totalSeats: $totalSeats, bookedSeats: $bookedSeats, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$EventCopyWith(_Event value, $Res Function(_Event) _then) = __$EventCopyWithImpl;
@override @useResult
$Res call({
 BigInt id, String title, String artist, String description, String venue, DateTime eventDate, String imageUrl, double ticketPrice, List<String> tags, int totalSeats, int bookedSeats, DateTime createdAt
});




}
/// @nodoc
class __$EventCopyWithImpl<$Res>
    implements _$EventCopyWith<$Res> {
  __$EventCopyWithImpl(this._self, this._then);

  final _Event _self;
  final $Res Function(_Event) _then;

/// Create a copy of Event
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? artist = null,Object? description = null,Object? venue = null,Object? eventDate = null,Object? imageUrl = null,Object? ticketPrice = null,Object? tags = null,Object? totalSeats = null,Object? bookedSeats = null,Object? createdAt = null,}) {
  return _then(_Event(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as BigInt,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,artist: null == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,venue: null == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as String,eventDate: null == eventDate ? _self.eventDate : eventDate // ignore: cast_nullable_to_non_nullable
as DateTime,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,ticketPrice: null == ticketPrice ? _self.ticketPrice : ticketPrice // ignore: cast_nullable_to_non_nullable
as double,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,totalSeats: null == totalSeats ? _self.totalSeats : totalSeats // ignore: cast_nullable_to_non_nullable
as int,bookedSeats: null == bookedSeats ? _self.bookedSeats : bookedSeats // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
