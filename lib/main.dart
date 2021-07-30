import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:special_places/providers/places.dart';
import 'package:special_places/screens/add_place_screen.dart';
import 'package:special_places/screens/places_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Places()),
      ],
      child: MaterialApp(
        title: 'Special Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        initialRoute: PlacesListScreen.routeName,
        routes: {
          PlacesListScreen.routeName: (ctx) => PlacesListScreen(),
          AddPlaceScreen.routeName: (ctx) => AddPlaceScreen(),
        },
      ),
    );
  }
}
