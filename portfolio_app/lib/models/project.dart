class Project {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> technologies;
  final String githubUrl;
  final String? liveUrl;
  final String category;

  const Project({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.technologies,
    required this.githubUrl,
    this.liveUrl,
    required this.category,
  });
}
