import 'package:movies_app/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  // super this use to call variable that is are in parent class

  const MovieModel(
      {required super.id, required super.title, required super.releaseDate, required super.backdropPath, required super.genreIds, required super.overview, required super.voteAverage});

  factory MovieModel.fromJson(Map<String, dynamic> json)=>
      MovieModel(id: json['id'],
          title: json['title'],
          releaseDate: json['release_date'],
          backdropPath: json['backdrop_path'],
          genreIds: List<int>.from(json['genre_ids'].map((e) => e,)),
          overview: json['overview'],
          voteAverage: json['vote_average'].toDouble());

}