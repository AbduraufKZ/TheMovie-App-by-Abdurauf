import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutflix/abstract_and_constants/constants.dart';
import 'package:flutflix/actors_list_widget_bloc/actors_list_bloc.dart';
import 'package:flutflix/actors_list_widget_bloc/actors_list_stateandevent.dart';
import 'package:flutflix/models/actors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActorsListView extends StatelessWidget {
  final int movieId;

  const ActorsListView({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActorBloc, ActorState>(
      builder: (context, state) {
        if (state is ActorsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ActorsLoaded) {
          return SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.actors.length,
              itemBuilder: (context, index) {
                Actor actor = state.actors[index];
                return SizedBox(
                  width: 100,
                  child: Column(
                    children: [
                      Expanded(
                          child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl:
                              '${Constants.imagePath}${actor.profilePath}',
                          height:
                              80, 
                          width: 80, 
                          fit: BoxFit
                              .cover, 
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error), 
                        ),
                      )),
                      Text(actor.originalName, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                );
              },
            ),
          );
        } else {
          return const Text("No actors found");
        }
      },
    );
  }
}
