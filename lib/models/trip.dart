
class Trip {
  final String name;
  final String location;
  final String duration;
  final String difficulty;
  final String bestTime;
  final String rating;
  final String price;
  final String description;
  final List<String> highlights;
  final String image;

  const Trip({
    required this.name,
    required this.location,
    required this.duration,
    required this.difficulty,
    required this.bestTime,
    required this.rating,
    required this.price,
    required this.description,
    required this.highlights,
    required this.image,
  });
}
