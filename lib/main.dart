// 🎯 Dart imports:
import 'dart:developer';

// 🐦 Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 🌎 Project imports:
import 'package:event_booking/app/app.dart';
import 'package:event_booking/features/bookings/booking_providers.dart';

/// Minimal ProviderObserver that helps verify session-scoped disposals during development.
/// Safe to include in release (no-ops in release).
final class SessionLoggingObserver extends ProviderObserver {
  const SessionLoggingObserver();

  @override
  void didAddProvider(ProviderObserverContext context, Object? value) {
    if (!kReleaseMode) {
      log('${context.provider} ${value == null ? 'initializing' : 'initialized'}');
    }
  }

  @override
  void didDisposeProvider(ProviderObserverContext context) {
    if (!kReleaseMode) {
      log('${context.provider} disposed: ');
    }
  }

  @override
  void providerDidFail(ProviderObserverContext context, Object error, StackTrace stackTrace) {
    if (!kReleaseMode) {
      log('${context.provider} did failed: ', error: error, stackTrace: stackTrace);
    }
  }

  @override
  void didUpdateProvider(ProviderObserverContext context, Object? previousValue, Object? newValue) {
    if (!kReleaseMode) {
      final provider = context.provider;
      final newState = newValue is AsyncValue ? newValue.value : newValue;
      // ignore: avoid_print
      print({
        'providers': provider.name ?? provider.runtimeType,
        'statement': ?newState,
        'keepAlive': !provider.isAutoDispose,
      });
    }
  }
}

Future<void> main() async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(preferences),
      ],
      observers: const [
        if (kDebugMode || kProfileMode) SessionLoggingObserver(),
      ],
      child: const App(),
    ),
  );
}
