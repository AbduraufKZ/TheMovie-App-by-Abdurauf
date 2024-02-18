import 'package:flutflix/abstract_and_constants/constants.dart';

import 'package:flutflix/models/movie.dart';

import 'package:flutter/material.dart';


import '../screens/details_screen.dart';

class MoviesSlider extends StatelessWidget {
  const MoviesSlider({
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
      height: 200,
      width: double.infinity,
      child: NewWidget(snapshot: snapshot, ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
    required this.snapshot, 
   
  });

  final AsyncSnapshot<List<Movie>> snapshot;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        final movie = snapshot.data![index];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () async {
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
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                '${Constants.imagePath}${movie.posterPath}',
                height: 200,
                width: 150,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
        );
      },
    );
  }
}
