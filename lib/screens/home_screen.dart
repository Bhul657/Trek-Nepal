
import 'package:flutter/material.dart';
import '../data/trips.dart';
import '../models/trip.dart';
import '../widgets/destination_card.dart';
import 'trip_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _openTrip(BuildContext context, Trip trip) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TripDetailsScreen(trip: trip),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 14, 20, 18),
          children: [
            // Greeting and notifications
            Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good Morning,',
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'Arun',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('No new notifications'),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.notifications_none,
                    size: 28,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            // Search bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search treks, destinations, or places...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: const Color(0xFFEDF2F7),
                contentPadding: const EdgeInsets.symmetric(vertical: 4),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 18),

            // Featured destination
            _FeaturedTrek(
              trip: trips[0],
              onTap: () => _openTrip(context, trips[0]),
            ),

            const SizedBox(height: 18),

            // Categories
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _Category(
                  icon: Icons.terrain,
                  label: 'Trekking',
                  color: Color(0xFF087F6E),
                ),
                _Category(
                  icon: Icons.map,
                  label: 'Tours',
                  color: Color(0xFF1685E8),
                ),
                _Category(
                  icon: Icons.hotel,
                  label: 'Hotels',
                  color: Color(0xFFFF8A00),
                ),
                _Category(
                  icon: Icons.explore,
                  label: 'Explore',
                  color: Color(0xFF8A42D6),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Popular destinations heading
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Popular Destinations',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => _openTrip(context, trips[1]),
                  child: const Text('See All'),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Horizontally scrolling destination cards
            SizedBox(
              height: 166,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: trips.length,
                separatorBuilder: (_, __) =>
                const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  return DestinationCard(
                    trip: trips[index],
                    onTap: () => _openTrip(context, trips[index]),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Recommended For You',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            ...trips.map(
                  (trip) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _RecommendedTile(
                  trip: trip,
                  onTap: () => _openTrip(context, trip),
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: const _HomeNavigationBar(),
    );
  }
}

// Featured trek card
class _FeaturedTrek extends StatelessWidget {
  final Trip trip;
  final VoidCallback onTap;

  const _FeaturedTrek({
    required this.trip,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: SizedBox(
        height: 178,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(
                trip.image,
                fit: BoxFit.cover,
              ),
            ),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.85),
                  ],
                ),
              ),
            ),

            Positioned(
              left: 16,
              bottom: 17,
              right: 62,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF159E89),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Featured',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    trip.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'The journey of a lifetime',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              right: 12,
              bottom: 42,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.teal.shade800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Category icon
class _Category extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _Category({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 27,
          backgroundColor: color.withOpacity(0.12),
          child: Icon(icon, color: color, size: 27),
        ),
        const SizedBox(height: 7),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

// Recommended trek tile
class _RecommendedTile extends StatelessWidget {
  final Trip trip;
  final VoidCallback onTap;

  const _RecommendedTile({
    required this.trip,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      contentPadding: const EdgeInsets.all(8),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          trip.image,
          width: 86,
          height: 68,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        trip.name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
      subtitle: Text(
        '${trip.duration} • ${trip.difficulty}\n'
            '⭐ ${trip.rating}  •  Nepal',
        style: const TextStyle(
          fontSize: 11,
          height: 1.6,
        ),
      ),
      trailing: const CircleAvatar(
        radius: 18,
        backgroundColor: Color(0xFFF4F7F8),
        child: Icon(Icons.arrow_forward, size: 18),
      ),
    );
  }
}

// Bottom navigation bar
class _HomeNavigationBar extends StatelessWidget {
  const _HomeNavigationBar();

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: 0,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.search),
          label: 'Explore',
        ),
        NavigationDestination(
          icon: Icon(Icons.favorite_border),
          label: 'Saved',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
    );
  }
}
