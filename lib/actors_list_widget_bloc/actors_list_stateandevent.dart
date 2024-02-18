// actor_event.dart
import 'package:flutflix/models/actors.dart';

abstract class ActorEvent {}

class FetchActors extends ActorEvent {
  final int movieId;

  FetchActors(this.movieId);
}

// actor_state.dart
abstract class ActorState {}

class ActorsInitial extends ActorState {}

class ActorsLoading extends ActorState {}

class ActorsLoaded extends ActorState {
  final List<Actor> actors;

  ActorsLoaded(this.actors);
}

class ActorsError extends ActorState {
  final String message;

  ActorsError(this.message);
}
