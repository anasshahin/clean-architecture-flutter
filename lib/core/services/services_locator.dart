import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repo.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';

final getIt = GetIt.instance;
class ServicesLocator{
  void init(){
    ///bloc
    getIt.registerFactory(() => MoviesBloc(getIt(),getIt(),getIt()),);

    /// Use Cases
    getIt.registerLazySingleton(() => GetNowPlayingMoviesUseCase(getIt()),);
    getIt.registerLazySingleton(() => GetPopularMoviesUseCase(getIt()),);
    getIt.registerLazySingleton(() => GetTopRatedMoviesUseCase(getIt()),);
    /// repo
    getIt.registerLazySingleton<BaseMoviesRepo>(
          () => MoviesRepository(getIt()),);
    // getIt() in means in this object you can find the object that you need
    // but you have to declare this object before use getIt() to make getIt() find the object
    /// Data source
    // this is mean don't create object until i call
    getIt.registerLazySingleton<BaseMovieRemoteDataSource>(
          () => MovieRemoteDataSource(),);
  }
}
// registerSingleton it means create object when you call func init()
// registerLazySingleton when i use the object create it.
// these two create one object only for this class and this class use in the complete app
// registerFactory create new object we call this class