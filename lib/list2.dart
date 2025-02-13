import 'package:flutter/material.dart';
import 'place.dart';  // Import the Place class
import 'list.dart';  // Beaches List page
import 'list3.dart';  // Waterfalls List page
import 'list4.dart';  // Restaurants List page

class List2Page extends StatelessWidget {
  final List<Place> churches = [
    Place(name: 'Basilica of Bom Jesus', imagePath: 'assets/c2.jpg', type: PlaceType.Church),
    Place(name: 'Se Cathedral', imagePath: 'assets/c1.jpg', type: PlaceType.Church),
    Place(name: 'Church of St. Cajetan', imagePath: 'assets/c3.jpg', type: PlaceType.Church),
    Place(name: 'St. Augustine Tower', imagePath: 'assets/c4.jpg', type: PlaceType.Church)
  ];

  void _goToWatchlist(BuildContext context) {
    final selectedPlaces = churches.where((place) => place.isSelected).toList();
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
        title: Text('Churches in Goa'),
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
                // Restaurants Button
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0), // Horizontal padding between buttons
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

          // List of Churches
          Expanded(
            child: ListView.builder(
              itemCount: churches.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(10),
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(churches[index].imagePath, height: 200, fit: BoxFit.cover),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          churches[index].name,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      CheckboxListTile(
                        title: Text('Add to Watchlist'),
                        value: churches[index].isSelected,
                        onChanged: (bool? value) {
                          churches[index].isSelected = value!;
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