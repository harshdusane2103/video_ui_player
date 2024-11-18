class Movie {
  String description;
  String sources;
  String subtitle;
  String thumb;
  String title;

  Movie({
    this.description = '',
    this.sources = '',
    this.subtitle = '',
    this.thumb = '',
    this.title = '',
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      description: json['description'] ?? '',
      sources: json['sources'] ?? '',
      subtitle: json['subtitle'] ?? '',
      thumb: json['thumb'] ?? 'https://img.freepik.com/free-photo/fantasy-elephant-illustration_23-2151548441.jpg',
      title: json['title'] ?? '',
    );
  }
}
