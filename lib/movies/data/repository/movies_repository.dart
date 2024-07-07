import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repo.dart';

import '../../../core/error/failure.dart';
import '../datasource/movie_remote_data_source.dart';

class MoviesRepository extends BaseMoviesRepo{
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either <Failure ,List<Movie>>> getNowPlayingMovies() async{
  final result= await baseMovieRemoteDataSource.getNowPlayingMovies();
  try{
    return Right(result);

  } on ServerException catch(failure){
    return Left(ServerFailure(failure.errorMessageModel.statusMessage));
  }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async{
    final result= await baseMovieRemoteDataSource.getPopularMovies();
    try{
      return Right(result);

    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async{
    final result= await baseMovieRemoteDataSource.getTopRatedMovies();
    try{
      return Right(result);

    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails() {
    // TODO: implement getMovieDetails
    throw UnimplementedError();
  }




}