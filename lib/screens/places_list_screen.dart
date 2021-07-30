import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:special_places/providers/places.dart';

import 'package:special_places/screens/add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  static const routeName = '/';

  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future:
              Provider.of<Places>(context, listen: false).fetchAndSetPlaces(),
          builder: (ctx, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? Center(child: CircularProgressIndicator())
              : Consumer<Places>(
                  child: Center(child: Text('Got no palces yet.')),
                  builder: (ctx, places, ch) => places.items.length <= 0
                      ? ch!
                      : ListView.builder(
                          itemCount: places.items.length,
                          itemBuilder: (ctx, i) => ListTile(
                            leading: CircleAvatar(
                              backgroundImage: FileImage(places.items[i].image),
                            ),
                            title: Text(places.items[i].title),
                            onTap: () {
                              //Go to detail page...
                            },
                          ),
                        ),
                ),
        ),
      ),
    );
  }
}
