import 'package:injectable/injectable.dart';

import '../../domain/entities/movie.dart';
import '../../domain/repositories/movie_repository.dart';
import '../data_sources/movie_api_service.dart';

@LazySingleton(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  final MovieApiService apiService;

  MovieRepositoryImpl(this.apiService);

  @override
  Future<List<Movie>> getPopularMovies() async {
    final movies =
        await apiService.getPopularMovies('7f8f9fb3d3eb1c8fa8b26dbd048564b5');
    return movies.results
        .map((movieModel) => Movie(
              adult: movieModel.adult,
              backdropPath: movieModel.backdropPath,
              genreIds: movieModel.genreIds,
              id: movieModel.id,
              originalLanguage: movieModel.originalLanguage,
              originalTitle: movieModel.originalTitle,
              overview: movieModel.overview,
              popularity: movieModel.popularity,
              posterPath: movieModel.posterPath,
              releaseDate: movieModel.releaseDate,
              title: movieModel.title,
              video: movieModel.video,
              voteAverage: movieModel.voteAverage,
              voteCount: movieModel.voteCount,
            ))
        .toList();
  }

  @override
  Future<Movie> getMovieDetails(int id) async {
    final movie = await apiService.getMovieDetails(
        id, '7f8f9fb3d3eb1c8fa8b26dbd048564b5');
    return Movie(
      adult: movie.adult,
      backdropPath: movie.backdropPath,
      genreIds: movie.genreIds,
      id: movie.id,
      originalLanguage: movie.originalLanguage,
      originalTitle: movie.originalTitle,
      overview: movie.overview,
      popularity: movie.popularity,
      posterPath: movie.posterPath,
      releaseDate: movie.releaseDate,
      title: movie.title,
      video: movie.video,
      voteAverage: movie.voteAverage,
      voteCount: movie.voteCount,
    );
  }
}
