import 'package:flutter/material.dart';
import 'place.dart';  // Import the Place class
import 'list.dart';  // Beaches List page
import 'list2.dart';  // Churches List page
import 'list4.dart';  // Restaurants List page

class List3Page extends StatelessWidget {
  final List<Place> waterfalls = [
    Place(name: 'Dudhsagar Waterfalls', imagePath: 'assets/ww1.jpg', type: PlaceType.Waterfall),
    Place(name: 'Bhagwan Mahavir Wildlife Sanctuary', imagePath: 'assets/ww2.jpg', type: PlaceType.Waterfall),
    Place(name: 'Tambdi Surla Waterfall', imagePath: 'assets/ww3.jpg', type: PlaceType.Waterfall),
    Place(name: 'Netravali Waterfalls', imagePath: 'assets/ww4.jpg', type: PlaceType.Waterfall),
  ];

  void _goToWatchlist(BuildContext context) {
    final selectedPlaces = waterfalls.where((place) => place.isSelected).toList();
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
        title: Text('Waterfalls in Goa'),
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

          // List of Waterfalls
          Expanded(
            child: ListView.builder(
              itemCount: waterfalls.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(10),
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(waterfalls[index].imagePath, height: 200, fit: BoxFit.cover),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          waterfalls[index].name,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      CheckboxListTile(
                        title: Text('Add to Watchlist'),
                        value: waterfalls[index].isSelected,
                        onChanged: (bool? value) {
                          waterfalls[index].isSelected = value!;
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