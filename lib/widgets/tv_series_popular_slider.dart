import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutflix/abstract_and_constants/constants.dart';
import 'package:flutflix/models/tv_series_popular.dart'; // Ensure this import is correct for your project structure

import '../screens/details_screen_tvseries.dart';

class TvSeriesList extends StatelessWidget {
  const TvSeriesList({
    super.key,
    required this.snapshot,
  });
  final AsyncSnapshot<List<TvSeries>> snapshot;
  @override
  Widget build(BuildContext context) {
    if (!snapshot.hasData) {
      return const Center(child: CircularProgressIndicator());
    }

    return SizedBox(
      height: 750,
      width: double.infinity,
      child: Tv(
        snapshot: snapshot,
      ),
    );
  }
}

class Tv extends StatelessWidget {
  const Tv({super.key, required this.snapshot});
  final AsyncSnapshot<List<TvSeries>> snapshot;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        final tvSeries = snapshot.data![index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TvSeriesDetailsScreen(tvSeries: tvSeries),
              ),
            );
          },
          child: Card(
            elevation: 5,
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: '${Constants.imagePath}${tvSeries.posterPath}',
                  height: 150,
                  width: 100,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              title: Text(
                tvSeries.originalname,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
