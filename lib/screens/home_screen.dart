import 'package:flutflix/loginbloc/auth_bloc.dart';
import 'package:flutflix/loginbloc/auth_event.dart';
import 'package:flutflix/screens/home_components.dart';
import 'package:flutflix/screens/tv_series_components.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Abdurauf'),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Log Out'),
                onTap: () {
                  BlocProvider.of<AuthBloc>(context).add(AuthLogoutEvent());
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed('/');
                },
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      width: 200, // Example fixed height
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.blue,
                      ),
                      child: const Center(
                        child: Text(
                          'Movies',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    HomeScreenContent(),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.blue,
                      ),
                      child: const Center(
                        child: Text(
                          'Popular TvSeries',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    TvSeriesComponents(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
