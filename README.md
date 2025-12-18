# K-Wave Connect

![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

K-Wave Connect is a K-pop event discovery and booking app. The current POC focuses on a fan-event reservation flow so we can validate the booking experience end to end.

---

## Core Features

- Browse upcoming K-pop events with artist, date, and venue details.
- Register/book events directly in the app.
- View a personalized list of events a user has booked.
- Search and filter events by artist, date, venue, or other criteria.
- Recommend upcoming concerts a user may enjoy based on simple viewing history signals.

## POC Scope (fan event booking)

- Hardcoded event catalog for quick browsing and filtering.
- Event detail view with a single-step "Reserve" action.
- Minimal booking confirmation and a "My Bookings" list stored locally.
- Simple rule-based recommendations derived from viewed/selected artists.
- Seat availability per event (total/booked/left) with sold-out handling in UI.
- Uses the K-Wave Connect design palette: primary #FF69B4, accent #FF1493, background #D3D3D3, Pretendard font, K-pop themed icons, grid-based layout, and subtle transitions.

## Getting Started 🚀

This project ships with three flavors: development, staging, and production. Run a flavor via IDE launch configs or the CLI:

```sh
# Development
flutter run --flavor development

# Staging
flutter run --flavor staging

# Production
flutter run --flavor production
```

K-Wave Connect targets iOS, Android, Web, macOS, and Windows.

## Running Tests 🧪

```sh
very_good test --coverage --test-randomize-ordering-seed random
```

View coverage locally:

```sh
genhtml coverage/lcov.info -o coverage/
open coverage/index.html
```

## Localization 🌐

Localization uses Flutter's `flutter_localizations` and ARB files in `lib/l10n/arb`. Add strings, generate with `flutter gen-l10n --arb-dir="lib/l10n/arb"`, and update `ios/Runner/Info.plist` locales as needed.

[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli
