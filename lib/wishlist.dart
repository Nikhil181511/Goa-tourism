import 'package:flutter/material.dart';
import 'place.dart';  // Import the Place class

class WishlistPage extends StatefulWidget {
  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  List<Place> selectedPlaces = [];

  @override
  Widget build(BuildContext context) {
    // Retrieve the list of selected places from the arguments
    final List<Place> receivedPlaces = ModalRoute.of(context)?.settings.arguments as List<Place>? ?? [];

    if (selectedPlaces.isEmpty && receivedPlaces.isNotEmpty) {
      selectedPlaces = receivedPlaces; // Only set if the list is empty
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('My Wishlist'),
      ),
      body: selectedPlaces.isEmpty
          ? Center(child: Text('No places added to wishlist!'))
          : ListView.builder(
        itemCount: selectedPlaces.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Image.asset(
                  selectedPlaces[index].imagePath,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  selectedPlaces[index].name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      selectedPlaces.removeAt(index); // Safely remove the item
                    });
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}