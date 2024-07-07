import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';

import '../../../core/usecase/base_use_case.dart';
import '../../domain/usecases/get_now_playing_movies_usecase.dart';
import '../../domain/usecases/get_top_rated_movies_usecase.dart';
import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesState()) {
    // emit : it use to change the state of the bloc
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters ());
    result.fold(
      (l) => emit(state.copyWith(
          nowPlayingState: RequestState.error, nowPlayingMessage: l.message)),
      (r) => emit(state.copyWith(
          nowPlayingState: RequestState.loaded, nowPlayingMovies: r)),
    );
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase(const NoParameters ());
    result.fold(
      (l) => emit(state.copyWith(
          popularState: RequestState.error, popularMessage: l.message)),
      (r) => emit(
          state.copyWith(popularState: RequestState.loaded, popularMovies: r)),
    );
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUseCase(const NoParameters ());
    result.fold(
      (l) => emit(state.copyWith(
          topRatedState: RequestState.error, topRatedMessage: l.message)),
      (r) => emit(state.copyWith(
          topRatedState: RequestState.loaded, topRatedMovies: r)),
    );
  }
}
