class Actor {
  final String name;
  final String? character;
  final String? profilePath;

  const Actor({required this.name, this.character, this.profilePath});
}

class Director {
  final String name;
  final String? profilePath;

  const Director({required this.name, this.profilePath});
}

class MovieCredits {
  final List<Director> directors;
  final List<Actor> cast;

  const MovieCredits({
    this.directors = const [],
    this.cast = const [],
  });
}
