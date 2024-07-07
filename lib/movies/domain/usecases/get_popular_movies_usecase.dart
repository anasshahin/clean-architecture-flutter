import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repo.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_use_case.dart';
import '../entities/movie_detail.dart';

class GetPopularMoviesUseCase extends  BaseUseCase<List<Movie>,NoParameters>{

  final BaseMoviesRepo baseMoviesRepo;

  GetPopularMoviesUseCase(this.baseMoviesRepo);

  @override
  Future<Either <Failure ,List<Movie>>> call(NoParameters parameters) async {
    return await baseMoviesRepo.getPopularMovies();
  }

}