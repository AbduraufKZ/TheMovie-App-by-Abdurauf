import 'package:flutflix/api/api.dart';
import 'package:flutflix/models/tv_series_popular.dart';
import 'package:flutflix/widgets/tv_series_popular_slider.dart';

import 'package:flutter/material.dart';


class TvSeriesComponents extends StatelessWidget {
  final Future<List<TvSeries>> popularTvSeries = Api().getPopularTvSeries();

  TvSeriesComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       
        const SizedBox(height:50 ),
        FutureBuilder(
          future: popularTvSeries,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error.toString()}'),
              );
            } else if (snapshot.hasData) {
              
              return TvSeriesList( snapshot: snapshot,
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }
}
