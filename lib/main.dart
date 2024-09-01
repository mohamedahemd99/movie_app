import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentaion/cubits/movie_details_cubit.dart';

import 'domain/repositories/movie_repository.dart';
import 'injection.dart';
import 'presentaion/blocs/movie_bloc.dart';
import 'presentaion/screens/movie_list_screen.dart';

void main() {
  configureDependencies();
  final movieRepository = getIt<MovieRepository>();
  runApp(MyApp(movieRepository: movieRepository));
}

class MyApp extends StatelessWidget {
  final MovieRepository movieRepository;

  const MyApp({super.key, required this.movieRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MovieCubit(movieRepository),
        ),
        BlocProvider(
          create: (context) => MovieDetailsCubit(movieRepository),
        ),
      ],
      child: MaterialApp(
        home: MovieListScreen(),
      ),
    );
  }
}
