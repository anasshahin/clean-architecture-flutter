import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';

import '../../../core/usecase/base_use_case.dart';
import '../repository/base_movies_repo.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetail, MovieDetailsParameters> {
  BaseMoviesRepo baseMoviesRepo;

  GetMovieDetailsUseCase(this.baseMoviesRepo);

  @override
  Future<Either<Failure, MovieDetail>> call(
      MovieDetailsParameters parameters) async{
    return await baseMoviesRepo.getMovieDetails();
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}