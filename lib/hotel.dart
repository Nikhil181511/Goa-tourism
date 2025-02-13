import 'package:flutter/material.dart';
import 'dart:async';

import 'package:tourism/Question.dart';

class FishPage extends StatefulWidget {
  const FishPage({super.key});

  @override
  _FishPageState createState() => _FishPageState();
}

class _FishPageState extends State<FishPage> {
  final PageController _pageController = PageController();



  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        int nextPage = _pageController.page!.toInt() + 1;
        if (nextPage > 2) {
          nextPage = 0;
        }
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info Page'),
        backgroundColor: Colors.lightBlue[100],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250,
              child: PageView(
                controller: _pageController,
                children: [
                  Image.asset('assets/fish11.jpg', fit: BoxFit.cover),
                  Image.asset('assets/fish22.jpg', fit: BoxFit.cover),
                  Image.asset('assets/fish33.jpg', fit: BoxFit.cover),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[100],
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'To Details',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Fisherman’s Wharf in Goa is a renowned waterfront restaurant that offers an authentic Goan dining experience with a view that’s hard to beat. Located along the banks of the River Sal, this charming spot is set in a traditional Goan-style building and surrounded by lush greenery, creating an inviting, rustic atmosphere. ',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'The restaurant is famous for its fresh seafood, sourced daily and prepared with signature Goan flavors, from succulent prawn curries to traditional fish recheado. Guests can enjoy a diverse menu that combines Goan delicacies with a selection of Indian and international dishes, ensuring that there’s something for everyone. ',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'With live music adding to the ambiance, Fisherman’s Wharf provides a delightful mix of local charm and modern comforts, making it an unforgettable spot to enjoy Goa’s vibrant culinary culture.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Beyond its delicious food, Fisherman’s Wharf offers a relaxed and scenic dining experience that’s perfect for families, couples, and groups of friends. The restaurant’s riverfront seating allows diners to enjoy breathtaking views of the river as they savor their meals, and as the sun sets, the ambiance becomes even more enchanting.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          ' Friendly and attentive staff ensure a warm Goan welcome, and the spacious setup provides plenty of room for a leisurely meal or celebration. Located in South Goa near Cavelossim Beach, Fisherman’s Wharf is also a great stop for those exploring the nearby beaches and sights.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          ' For tourists seeking a memorable culinary experience in Goa, Fisherman’s Wharf combines great food, a picturesque setting, and genuine Goan hospitality into one unforgettable dining experience.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: (){},                    style: ButtonStyle(
                        backgroundColor:
                        const WidgetStatePropertyAll(Colors.black),
                        foregroundColor:
                        const WidgetStatePropertyAll(Colors.white),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                    child: const Text('Book a Tour'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DhudhsagarApp()),
                      );                    },
                    style: ButtonStyle(
                        backgroundColor:
                        const WidgetStatePropertyAll(Colors.black),
                        foregroundColor:
                        const WidgetStatePropertyAll(Colors.white),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                    child: const Text('Play Quiz!'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}