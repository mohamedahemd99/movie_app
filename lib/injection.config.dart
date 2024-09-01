// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/data_sources/movie_api_service.dart' as _i5;
import 'data/data_sources/movie_api_service.dart';
import 'data/repositories/movie_repository_impl.dart' as _i4;
import 'domain/repositories/movie_repository.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<MovieApiService>(() => MovieApiService(
          gh<Dio>(),
          baseUrl: 'https://api.themoviedb.org/3/',
        ));

    gh.lazySingleton<Dio>(() => Dio());
    gh.lazySingleton<_i3.MovieRepository>(
        () => _i4.MovieRepositoryImpl(gh<_i5.MovieApiService>()));
    return this;
  }
}
