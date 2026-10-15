
import '../models/trip.dart';

const List<Trip> trips = [
  Trip(
    name: 'Annapurna Circuit',
    location: 'Nepal',
    duration: '14 Days',
    difficulty: 'Moderate',
    bestTime: 'Mar – May',
    rating: '4.8',
    price: '650',
    description:
    'Explore beautiful mountain landscapes, traditional '
        'villages, and the spectacular Annapurna range.',
    highlights: [
      'Thorong La Pass (5,416 m)',
      'Tibetan culture and villages',
      'Stunning Annapurna mountain views',
    ],
    image: 'asset/images/annapurna.jpg',
  ),

  Trip(
    name: 'Langtang Valley',
    location: 'Nepal',
    duration: '8 Days',
    difficulty: 'Moderate',
    bestTime: 'Mar – May',
    rating: '4.6',
    price: '420',
    description:
    'Discover peaceful villages, glaciers, forests, '
        'and Himalayan scenery in Langtang Valley.',
    highlights: [
      'Kyanjin Gompa village',
      'Glacier and mountain views',
      'Local Tamang culture',
    ],
    image: 'asset/images/langtang.jpg',
  ),

  Trip(
    name: 'Mardi Himal Trek',
    location: 'Nepal',
    duration: '5 Days',
    difficulty: 'Moderate',
    bestTime: 'Oct – Nov',
    rating: '4.7',
    price: '350',
    description:
    'Enjoy quiet trails, forest scenery, and close-up '
        'views of the Annapurna mountains.',
    highlights: [
      'Mardi Himal viewpoint',
      'Rhododendron forests',
      'Annapurna South views',
    ],
    image: 'asset/images/mardi_himal.jpg',
  ),
];
