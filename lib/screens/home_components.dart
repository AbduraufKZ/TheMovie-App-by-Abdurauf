
import 'package:flutflix/api/api.dart';
import 'package:flutflix/models/movie.dart';
import 'package:flutflix/widgets/movies_slider.dart';
import 'package:flutflix/widgets/trending_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenContent extends StatelessWidget {
  final Future<List<Movie>> trendingMovies = Api().getTrendingMovies();
  final Future<List<Movie>> topRatedMovies = Api().getTopRatedMovies();
  final Future<List<Movie>> upcomingMovies = Api().getUpcomingMovies();

  HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Text(
          'Trending Movies',
          style: GoogleFonts.aBeeZee(fontSize: 25),
        ),
        const SizedBox(height: 32),
        FutureBuilder(
          future: trendingMovies,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              return TrendingSlider(snapshot: snapshot,);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
        const SizedBox(height: 32),
        Text(
          'Top rated movies',
          style: GoogleFonts.aBeeZee(
            fontSize: 25,
          ),
        ),
        const SizedBox(height: 32),
        FutureBuilder(
          future: topRatedMovies,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              return MoviesSlider(snapshot: snapshot, );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
        const SizedBox(height: 32),
        Text(
          'Upcoming movies',
          style: GoogleFonts.aBeeZee(
            fontSize: 25,
          ),
        ),
        const SizedBox(height: 32),
        FutureBuilder(
          future: upcomingMovies,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              return MoviesSlider(snapshot: snapshot,);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
        
      ],
    );
  }
}