import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repo.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_use_case.dart';
import '../entities/movie.dart';
import '../entities/movie_detail.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters>{

 final BaseMoviesRepo baseMoviesRepo;

 GetNowPlayingMoviesUseCase(this.baseMoviesRepo);

 @override
  Future<Either <Failure ,List<Movie>>> call(NoParameters parameters) async{
   return await baseMoviesRepo.getNowPlayingMovies();
   }
}