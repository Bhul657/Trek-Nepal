
import 'package:flutter/material.dart';
import '../models/trip.dart';

class TripDetailsScreen extends StatelessWidget {
  final Trip trip;

  const TripDetailsScreen({
    super.key,
    required this.trip,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 290,
            pinned: true,
            backgroundColor: const Color(0xFF07518A),
            foregroundColor: Colors.white,
            actions: [
              IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Added to your saved trips'),
                    ),
                  );
                },
                icon: const Icon(Icons.favorite_border),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    trip.image,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.12),
                          Colors.transparent,
                          Colors.black.withOpacity(0.25),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 18,
                    bottom: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF159E89),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        trip.difficulty,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              transform: Matrix4.translationValues(0, -8, 0),
              padding: const EdgeInsets.fromLTRB(20, 22, 20, 24),
              decoration: const BoxDecoration(
                color: Color(0xFFF7F9FC),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(26),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trip.name,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 17,
                        color: Color(0xFF159E89),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        trip.location,
                        style: const TextStyle(
                          color: Colors.blueGrey,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${trip.rating} (1.2k reviews)',
                        style: const TextStyle(
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),

                  const Divider(height: 30),

                  Row(
                    children: [
                      _InfoItem(
                        icon: Icons.calendar_month,
                        title: trip.duration,
                        subtitle: 'Duration',
                      ),
                      _InfoItem(
                        icon: Icons.terrain,
                        title: trip.difficulty,
                        subtitle: 'Difficulty',
                      ),
                      _InfoItem(
                        icon: Icons.access_time,
                        title: trip.bestTime,
                        subtitle: 'Best Time',
                      ),
                    ],
                  ),

                  const Divider(height: 30),

                  const Text(
                    'Overview',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    trip.description,
                    style: const TextStyle(
                      color: Colors.blueGrey,
                      height: 1.6,
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 22),

                  const Text(
                    'Highlights',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  ...trip.highlights.map(
                        (highlight) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.check,
                            color: Color(0xFF159E89),
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              highlight,
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  // Price and booking section
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6F6F2),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'From',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '\$Rs{trip.price}',
                                style: const TextStyle(
                                  color: Color(0xFF00695C),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'per person',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),

                        ElevatedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Booking feature coming soon',
                                ),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.arrow_forward,
                            size: 17,
                          ),
                          label: const Text('Book Now'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00695C),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 22),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _BottomAction(
                        icon: Icons.map_outlined,
                        label: 'Itinerary',
                      ),
                      _BottomAction(
                        icon: Icons.check_circle_outline,
                        label: 'Inclusions',
                      ),
                      _BottomAction(
                        icon: Icons.star_border,
                        label: 'Reviews',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Duration, difficulty, and best-time information
class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _InfoItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(
            icon,
            size: 19,
            color: const Color(0xFF23374D),
          ),
          const SizedBox(height: 7),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

// Bottom action items
class _BottomAction extends StatelessWidget {
  final IconData icon;
  final String label;

  const _BottomAction({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: const Color(0xFF334B66),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: Colors.blueGrey,
          ),
        ),
      ],
    );
  }
}
