import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutflix/loginbloc/auth_bloc.dart';
import 'package:flutflix/loginbloc/auth_state.dart'; 
import 'package:flutflix/movie_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await dotenv.load(fileName: '.env'); 

  runApp(
    BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(AuthUnauthorizedState()),
      child: const MovieApp(),
    ),
  );
}
