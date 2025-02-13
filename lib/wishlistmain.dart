import 'package:flutter/material.dart';
import 'list.dart';  // Beaches List page
import 'list2.dart';  // Churches List page
import 'list3.dart';  // Waterfalls List page
import 'list4.dart';  // Restaurants List page
import 'wishlist.dart';  // Combined Wishlist page

void main() {
  runApp(wish());
}

class wish extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Goa Tourist Wishlist',
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => ListPage(),
        '/list2': (context) => List2Page(),
        '/list3': (context) => List3Page(),
        '/list4': (context) => List4Page(),
        '/watchlist': (context) => WishlistPage(),
      },
    );
  }
}