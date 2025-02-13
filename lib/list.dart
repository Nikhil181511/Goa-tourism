import 'package:flutter/material.dart';
import 'place.dart';  // Import the Place class
import 'list2.dart';  // Churches List page
import 'list3.dart';  // Waterfalls List page
import 'list4.dart';  // Restaurants List page

class ListPage extends StatelessWidget {
  final List<Place> places = [
    Place(name: 'Palolem Beach', imagePath: 'assets/palolem.jpg', type: PlaceType.Beach),
    Place(name: 'Baga Beach', imagePath: 'assets/baga.jpg', type: PlaceType.Beach),
    Place(name: 'Agonda Beach', imagePath: 'assets/agonda.jpg', type: PlaceType.Beach),
    Place(name: 'Arambol Beach', imagePath: 'assets/arambol.jpg', type: PlaceType.Beach)
  ];

  void _goToWatchlist(BuildContext context) {
    final selectedPlaces = places.where((place) => place.isSelected).toList();
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
        title: Text('Beaches in Goa'),
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
                // Church Button
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0), // Add horizontal padding between buttons
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
                // Waterfall Button
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0), // Add horizontal padding between buttons
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
                // Restaurants Button
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0), // Add horizontal padding between buttons
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => List4Page()), // Navigate to Restaurants List
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        backgroundColor: Colors.blue,
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      child: const Text('Restaurants in Goa'),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // List of Beaches
          Expanded(
            child: ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(10),
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(places[index].imagePath, height: 200, fit: BoxFit.cover),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          places[index].name,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      CheckboxListTile(
                        title: Text('Add to Watchlist'),
                        value: places[index].isSelected,
                        onChanged: (bool? value) {
                          places[index].isSelected = value!;
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