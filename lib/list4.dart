import 'package:flutter/material.dart';
import 'place.dart';  // Import the Place class
import 'list.dart';  // Beaches List page
import 'list2.dart';  // Churches List page
import 'list3.dart';  // Waterfalls List page

class List4Page extends StatelessWidget {
  final List<Place> restaurants = [
    Place(name: 'Fisherman\'s Wharf', imagePath: 'assets/r1.jpg', type: PlaceType.Restaurant),
    Place(name: 'Vinayak Family Restaurant', imagePath: 'assets/r2.jpg', type: PlaceType.Restaurant),
    Place(name: 'Mambo\'s', imagePath: 'assets/r3.jpg', type: PlaceType.Restaurant),
    Place(name: 'Thalassa', imagePath: 'assets/r4.jpg', type: PlaceType.Restaurant),
  ];

  void _goToWatchlist(BuildContext context) {
    final selectedPlaces = restaurants.where((place) => place.isSelected).toList();
    Navigator.pushNamed(
      context,
      '/watchlist',
      arguments: selectedPlaces,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurants in Goa'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              _goToWatchlist(context); // Navigate to Watchlist with selected places
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Navigation buttons to the other lists, aligned horizontally
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Beaches Button
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0), // Horizontal padding between buttons
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListPage()), // Navigate to Beaches List
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        backgroundColor: Colors.blue,
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      child: const Text('Beaches in Goa'),
                    ),
                  ),
                ),
                // Churches Button
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0), // Horizontal padding between buttons
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => List2Page()), // Navigate to Churches List
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        backgroundColor: Colors.blue,
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      child: const Text('Churches in Goa'),
                    ),
                  ),
                ),
                // Waterfalls Button
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0), // Horizontal padding between buttons
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => List3Page()), // Navigate to Waterfalls List
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        backgroundColor: Colors.blue,
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      child: const Text('Waterfalls in Goa'),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // List of Restaurants
          Expanded(
            child: ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(10),
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(restaurants[index].imagePath, height: 200, fit: BoxFit.cover),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          restaurants[index].name,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      CheckboxListTile(
                        title: Text('Add to Watchlist'),
                        value: restaurants[index].isSelected,
                        onChanged: (bool? value) {
                          restaurants[index].isSelected = value!;
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}