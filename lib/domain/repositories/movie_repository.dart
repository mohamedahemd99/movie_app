import '../entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getPopularMovies();
  Future<Movie> getMovieDetails(int id);
}
