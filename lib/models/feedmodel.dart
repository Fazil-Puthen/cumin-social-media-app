class Feed{
  final String image;
  final String heading;
  final String description;
  bool liked;
  bool saved;

  Feed({
    required this.image,
    required this.heading,
    required this.description,
    required this.liked,
    required this.saved
  });
}