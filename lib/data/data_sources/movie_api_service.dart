import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../models/movie_model.dart';

part 'movie_api_service.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3/")
abstract class MovieApiService {
  factory MovieApiService(Dio dio, {String baseUrl}) = _MovieApiService;

  @GET("movie/popular")
  Future<MovieResponseModel> getPopularMovies(@Query("api_key") String apiKey);

  @GET("movie/{id}")
  Future<MovieModel> getMovieDetails(
      @Path("id") int id, @Query("api_key") String apiKey);
}
