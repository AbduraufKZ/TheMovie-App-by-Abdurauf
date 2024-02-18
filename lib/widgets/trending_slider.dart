import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutflix/abstract_and_constants/constants.dart';
import 'package:flutflix/models/movie.dart';

import 'package:flutflix/screens/details_screen.dart';
import 'package:flutter/material.dart';

class TrendingSlider extends StatelessWidget {
  const TrendingSlider({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot<List<Movie>> snapshot;

  @override
  Widget build(BuildContext context) {
    if (!snapshot.hasData) {
      return const Center(child: CircularProgressIndicator());
    }

    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: snapshot.data!.length,
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          viewportFraction: 0.55,
          enlargeCenterPage: true,
          pageSnapping: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 1),
        ),
        itemBuilder: (context, itemIndex, pageViewIndex) {
          final movie = snapshot.data![itemIndex];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                    movie: movie,
                  ),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                '${Constants.imagePath}${movie.posterPath}',
                height: 300,
                width: 200,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            ),
             
          );
        },
      ),
    );
  }
}
