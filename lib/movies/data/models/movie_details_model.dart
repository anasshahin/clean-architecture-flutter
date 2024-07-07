import 'package:movies_app/movies/data/models/genres_model.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';

class MovieDetailsModel extends MovieDetail{
   const MovieDetailsModel({required super.backdropPath, required super.genres, required super.id, required super.overview, required super.releaseDate, required super.runtime, required super.title, required super.voteAverage});
  factory MovieDetailsModel.fromJson(Map<String,dynamic> json)=>
      MovieDetailsModel(backdropPath: json['backdrop_path'],voteAverage:json['vote_average'],
      
          title:json['title'],overview: json['overview'],id: json['id'],
          genres: List<GenresModel>.from(
            json['genres'].map((e) => GenresModel.formJson(e),)
          ) ,releaseDate: json['release_date'],runtime: json['runtime'] );
     
}
