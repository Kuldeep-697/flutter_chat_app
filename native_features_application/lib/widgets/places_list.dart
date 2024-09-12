import 'package:flutter/material.dart';
import 'package:native_features_application/models/place.dart';
import 'package:native_features_application/screens/places_detail.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    return places.isEmpty
        ? Center(
            child: Text(
            'No places added yet',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ))
        : ListView.builder(
            itemCount: places.length,
            itemBuilder: (ctx, index) => ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) =>
                            PlacesDetailsScreen(place: places[index])));
                  },
                  leading: CircleAvatar(
                    radius: 26,
                    backgroundImage: FileImage(places[index].image),
                  ),
                  title: Text(
                    places[index].title,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                ));
  }
}
