import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/api_constant.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_use_case.dart';

import '../models/movie_model.dart';
abstract class BaseMovieRemoteDataSource{
  Future <List<MovieModel>> getNowPlayingMovies();
  Future <List<MovieModel>> getPopularMovies();
  Future <List<MovieModel>> getTopRatedMovies();
  Future <List<MovieModel>> getMovieDetails(MovieDetailsParameters parameters);
}
class MovieRemoteDataSource extends BaseMovieRemoteDataSource{
@override
  Future<List<MovieModel>> getNowPlayingMovies () async{
 final response= await Dio().get(ApiConstant.nowPlayingMoviesPath);
 if (response.statusCode ==200){
   return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
 }else{
   throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
 //  throw Exception(response.data[status_message]);
   // why we don't do that because this only return msg but we need all values that return from error
 }
}

  @override
  Future<List<MovieModel>> getPopularMovies() async {
  final response = await Dio().get(ApiConstant.popularMoviesPath);
  if (response.statusCode ==200){
    return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
  }else{
    throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));

  }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async{
    final response = await Dio().get(ApiConstant.topRatedPath);
    if (response.statusCode ==200){
      return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getMovieDetails(MovieDetailsParameters parameters)async {
    final response = await Dio().get(ApiConstant.popularMoviesPath);
    if (response.statusCode ==200){
      return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));

    }
  }
}