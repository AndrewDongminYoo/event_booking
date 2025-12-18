// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(eventRepository)
const eventRepositoryProvider = EventRepositoryProvider._();

final class EventRepositoryProvider extends $FunctionalProvider<EventRepository, EventRepository, EventRepository>
    with $Provider<EventRepository> {
  const EventRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'eventRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$eventRepositoryHash();

  @$internal
  @override
  $ProviderElement<EventRepository> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  EventRepository create(Ref ref) {
    return eventRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EventRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EventRepository>(value),
    );
  }
}

String _$eventRepositoryHash() => r'4d8a50d9f9b34c61169b71e1255753cb44ba88bc';

@ProviderFor(events)
const eventsProvider = EventsProvider._();

final class EventsProvider extends $FunctionalProvider<List<Event>, List<Event>, List<Event>>
    with $Provider<List<Event>> {
  const EventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'eventsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$eventsHash();

  @$internal
  @override
  $ProviderElement<List<Event>> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  List<Event> create(Ref ref) {
    return events(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Event> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Event>>(value),
    );
  }
}

String _$eventsHash() => r'bd7cb311ca61d2da5ea7d5b8b58de3989ea9e1d0';

@ProviderFor(filteredEvents)
const filteredEventsProvider = FilteredEventsProvider._();

final class FilteredEventsProvider extends $FunctionalProvider<List<Event>, List<Event>, List<Event>>
    with $Provider<List<Event>> {
  const FilteredEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredEventsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredEventsHash();

  @$internal
  @override
  $ProviderElement<List<Event>> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  List<Event> create(Ref ref) {
    return filteredEvents(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Event> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Event>>(value),
    );
  }
}

String _$filteredEventsHash() => r'7964f060d95e52e666df8e37b20cbb80bd8182e3';

@ProviderFor(eventWithBookingStatus)
const eventWithBookingStatusProvider = EventWithBookingStatusProvider._();

final class EventWithBookingStatusProvider
    extends $FunctionalProvider<Map<Event, bool>, Map<Event, bool>, Map<Event, bool>>
    with $Provider<Map<Event, bool>> {
  const EventWithBookingStatusProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'eventWithBookingStatusProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$eventWithBookingStatusHash();

  @$internal
  @override
  $ProviderElement<Map<Event, bool>> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  Map<Event, bool> create(Ref ref) {
    return eventWithBookingStatus(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<Event, bool> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<Event, bool>>(value),
    );
  }
}

String _$eventWithBookingStatusHash() => r'3e3243a45827e51c4b4bf6ad7a5d8d159fa7e414';
