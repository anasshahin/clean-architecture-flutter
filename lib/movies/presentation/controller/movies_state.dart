import 'package:equatable/equatable.dart';

import '../../../core/utils/enums.dart';
import '../../domain/entities/movie.dart';

class MoviesState extends Equatable {

  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;

  final List<Movie> popularMovies;
  final RequestState popularState;
  final String popularMessage;

  final List<Movie> topRatedMovies;
  final RequestState topRatedState;
  final String topRatedMessage;


  const MoviesState(
      {this.topRatedMovies = const[], this.topRatedState = RequestState
          .loading, this.topRatedMessage = '',
        this.popularMovies = const[], this.popularState = RequestState
          .loading, this.popularMessage = '', this.nowPlayingMovies = const[],
        this.nowPlayingState = RequestState
            .loading, this.nowPlayingMessage = ''});

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,

    List<Movie>? popularMovies,
    RequestState? popularState,
    String? popularMessage,

    List<Movie>? topRatedMovies,
    RequestState? topRatedState,
    String? topRatedMessage,
  }) {
    return MoviesState(
        nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
        nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
        nowPlayingState: nowPlayingState ?? this.nowPlayingState,

        popularMessage: popularMessage ?? this.popularMessage,
        popularMovies: popularMovies ?? this.popularMovies,
        popularState: popularState ?? this.popularState,

        topRatedMessage: topRatedMessage ?? this.topRatedMessage,
        topRatedMovies: topRatedMovies ?? this.topRatedMovies,
        topRatedState: topRatedState ?? this.topRatedState
    );
  }

  @override
  List<Object> get props =>
      [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,

        popularMovies,
        popularState,
        popularMessage,

        topRatedMovies,
        topRatedState,
        topRatedMessage,
      ];
}