// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 🌎 Project imports:
import 'package:event_booking/app/view/bookings_page.dart';
import 'package:event_booking/app/view/home_page.dart';

class EventShell extends StatefulWidget {
  const EventShell({super.key});

  @override
  State<EventShell> createState() => _EventShellState();
}

class _EventShellState extends State<EventShell> {
  int _index = 0;

  final List<ConsumerWidget> _pages = const [
    HomePage(),
    BookingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _index, children: _pages),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.event_seat), label: 'My bookings'),
        ],
        onDestinationSelected: (value) => setState(() => _index = value),
      ),
    );
  }
}
