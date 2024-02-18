
import 'package:flutflix/actors_list_widget_bloc/actors_list_stateandevent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutflix/models/actors.dart';
import 'package:flutflix/services/movie_credits.dart';

class ActorBloc extends Bloc<ActorEvent, ActorState> {
  final MovieService movieService;

  ActorBloc({required this.movieService}) : super(ActorsInitial()) {
    on<FetchActors>((event, emit) async {
      emit(ActorsLoading());
      try {
        List<Actor> actors = await movieService.fetchCredits(event.movieId);
        emit(ActorsLoaded(actors));
      } catch (error) {
        emit(ActorsError(error.toString()));
      }
    });
  }
}
