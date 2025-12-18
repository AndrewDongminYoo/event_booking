// Static seed data for the POC. Keeps the POC self-contained and offline.

// 🌎 Project imports:
import 'package:event_booking/features/events/models/event.dart';

const _kImageBase = 'https://raw.githubusercontent.com/dummy-kpop-assets/k-wave/main';

final seedEvents = <Event>[
  Event(
    id: 'seoul-fanmeet-01',
    title: 'Starlight Fanmeet',
    artist: 'Lumi',
    dateTime: DateTime(2026, 1, 20, 19, 30),
    venue: 'Jamsil Arena, Seoul',
    tags: const ['fanmeet', 'vip'],
    imageUrl: '$_kImageBase/lumi_fanmeet.jpg',
    description: 'An intimate Q&A and performance session with Lumi.',
  ),
  Event(
    id: 'busan-showcase-02',
    title: 'Rising Tide Showcase',
    artist: 'Tidal',
    dateTime: DateTime(2026, 2, 3, 18),
    venue: 'BEXCO Auditorium, Busan',
    tags: const ['showcase', 'new-album'],
    imageUrl: '$_kImageBase/tidal_showcase.jpg',
    description: 'Album reveal, live stage, and exclusive merch preorders.',
  ),
  Event(
    id: 'tokyo-fan-sign-03',
    title: 'Neon Night Fansign',
    artist: 'Neon9',
    dateTime: DateTime(2026, 3, 10, 17),
    venue: 'Shibuya Stream Hall, Tokyo',
    tags: const ['fansign', 'limited'],
    imageUrl: '$_kImageBase/neon9_fansign.jpg',
    description: 'Limited-seat autograph session with surprise unit stage.',
  ),
  Event(
    id: 'la-concert-04',
    title: 'Pacific Lights Tour',
    artist: 'Astra',
    dateTime: DateTime(2026, 4, 15, 20),
    venue: 'The Forum, Los Angeles',
    tags: const ['concert', 'tour'],
    imageUrl: '$_kImageBase/astra_concert.jpg',
    description: 'Full-scale tour stop with extended live band set.',
  ),
  Event(
    id: 'seoul-fanmeet-05',
    title: 'Midnight Echo Fan Party',
    artist: 'EchoHeart',
    dateTime: DateTime(2026, 5, 12, 19),
    venue: 'Yes24 Live Hall, Seoul',
    tags: const ['fanmeet', 'afterparty'],
    imageUrl: '$_kImageBase/echoheart_fanparty.jpg',
    description: 'Hi-touch, DJ set, and mini live performance.',
  ),
  Event(
    id: 'nyc-fan-sign-06',
    title: 'Skyline Sign & Snap',
    artist: 'Skyline',
    dateTime: DateTime(2026, 6, 2, 18, 30),
    venue: 'Hammerstein Ballroom, NYC',
    tags: const ['fansign', 'meet-and-greet'],
    imageUrl: '$_kImageBase/skyline_sign.jpg',
    description: 'Photo session plus acoustic duet stage.',
  ),
];
