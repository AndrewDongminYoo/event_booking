import 'package:event_booking/app/app.dart';
import 'package:event_booking/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
