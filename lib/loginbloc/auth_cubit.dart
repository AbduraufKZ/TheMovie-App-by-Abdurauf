import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutflix/api/api_client_exception.dart';
import 'package:flutflix/loginbloc/auth_event.dart';

import 'auth_bloc.dart';
import 'auth_state.dart';

abstract class AuthViewCubitState {}

class AuthViewCubitFormFillInProgressState extends AuthViewCubitState {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthViewCubitFormFillInProgressState &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class AuthViewCubitErrorState extends AuthViewCubitState {
  final String errorMessage;

  AuthViewCubitErrorState(this.errorMessage);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthViewCubitErrorState &&
          runtimeType == other.runtimeType &&
          errorMessage == other.errorMessage;

  @override
  int get hashCode => errorMessage.hashCode;
}

class AuthViewCubitAuthProgressState extends AuthViewCubitState {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthViewCubitAuthProgressState &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class AuthViewCubitSuccessAuthState extends AuthViewCubitState {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthViewCubitSuccessAuthState &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class AuthViewCubit extends Cubit<AuthViewCubitState> {
  final AuthBloc authBloc;
  late final StreamSubscription<AuthState> authBlocSubscription;

  AuthViewCubit(
    AuthViewCubitState initialState,
    this.authBloc,
  ) : super(initialState) {
    _onState(authBloc.state);
    authBlocSubscription = authBloc.stream.listen(_onState);
  }

  bool _isValid(String login, String password) =>
      login.isNotEmpty && password.isNotEmpty;

  void auth({required String login, required String password}) {
    if (!_isValid(login, password)) {
      final state = AuthViewCubitErrorState('Username and Password');
      emit(state);
      return;
    }
    authBloc.add(AuthLoginEvent(login: login, password: password));
  }

  void _onState(AuthState state) {
    if (state is AuthUnauthorizedState) {
      emit(AuthViewCubitFormFillInProgressState());
    } else if (state is AuthAuthorizedState) {
      authBlocSubscription.cancel();
      emit(AuthViewCubitSuccessAuthState());
    } else if (state is AuthFailureState) {
      final message = _mapErrorToMessage(state.error);
      emit(AuthViewCubitErrorState(message));
    } else if (state is AuthInProgressState) {
      emit(AuthViewCubitAuthProgressState());
    } else if (state is AuthCheckStatusInProgressState) {
      emit(AuthViewCubitAuthProgressState());
    }
  }

  String _mapErrorToMessage(Object error) {
    if (error is! ApiClientException) {
      return 'Try again blaa';
    }
    switch (error.type) {
      case ApiClientExceptionType.network:
        return 'Server not found';
      case ApiClientExceptionType.auth:
        return 'Incorrect password';
      case ApiClientExceptionType.sessionExpired:
      case ApiClientExceptionType.other:
        return 'Error';
    }
  }

  @override
  Future<void> close() {
    authBlocSubscription.cancel();
    return super.close();
  }
}
